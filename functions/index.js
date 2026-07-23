const { onDocumentCreated } = require("firebase-functions/v2/firestore");
const { initializeApp } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");
const { getMessaging } = require("firebase-admin/messaging");

initializeApp();

/**
 * Triggered every time a new message is written to Firestore.
 *
 * Path: conversations/{conversationId}/messages/{messageId}
 *
 * What it does:
 * 1. Reads the recipient's FCM token from users/{receiverId}/fcmToken
 * 2. Sends a push notification to that device via FCM
 *
 * Firestore structure expected:
 *   users/{uid}:
 *     fcmToken: string    ← saved by NotificationService.dart on login
 *     phoneNumber: string
 *     displayName: string (optional)
 */
exports.sendMessageNotification = onDocumentCreated(
  "conversations/{conversationId}/messages/{messageId}",
  async (event) => {
    const message = event.data?.data();
    if (!message) return null;

    const { senderId, receiverId, text, senderName } = message;
    const { conversationId } = event.params;

    // Don't notify if sender and receiver are the same (self-message).
    if (senderId === receiverId) return null;

    const db = getFirestore();

    // 1. Get the recipient's FCM token.
    const receiverDoc = await db.collection("users").doc(receiverId).get();
    if (!receiverDoc.exists) {
      console.log(`Receiver ${receiverId} not found in users collection.`);
      return null;
    }

    const { fcmToken, displayName: receiverName } = receiverDoc.data();
    if (!fcmToken) {
      console.log(`No FCM token for receiver ${receiverId}.`);
      return null;
    }

    // 2. Get the sender's display name (fallback to phone number or "Someone").
    let title = senderName;
    if (!title) {
      const senderDoc = await db.collection("users").doc(senderId).get();
      title = senderDoc.exists
        ? senderDoc.data().displayName ||
          senderDoc.data().phoneNumber ||
          "New message"
        : "New message";
    }

    // 3. Build and send the FCM payload.
    const payload = {
      token: fcmToken,
      notification: {
        title,
        body: text || "📎 Attachment",
      },
      // data fields are available in onMessageOpenedApp / background handler
      data: {
        conversationId,
        senderId,
        senderName: title,
        senderImage: message.senderImage ?? "",
      },
      android: {
        priority: "high",
        notification: {
          channelId: "messages",
          priority: "high",
          defaultSound: true,
          defaultVibrateTimings: true,
        },
      },
      apns: {
        payload: {
          aps: {
            sound: "default",
            badge: 1,
            contentAvailable: true,
          },
        },
      },
    };

    try {
      const response = await getMessaging().send(payload);
      console.log(`Notification sent to ${receiverId}: ${response}`);
      return response;
    } catch (err) {
      // Token may be stale — remove it so we don't retry indefinitely.
      if (
        err.code === "messaging/registration-token-not-registered" ||
        err.code === "messaging/invalid-registration-token"
      ) {
        console.warn(`Stale token for ${receiverId}, removing.`);
        await db.collection("users").doc(receiverId).update({ fcmToken: null });
      } else {
        console.error("FCM send error:", err);
      }
      return null;
    }
  }
);
