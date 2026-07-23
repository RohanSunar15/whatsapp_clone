import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

/// Handles all Firebase Cloud Messaging logic:
/// - Requesting notification permission
/// - Saving the FCM device token to Firestore so Cloud Functions can
///   look it up when sending notifications to this user
/// - Handling messages in each app lifecycle state
class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Expose a global navigator key so notification taps can push routes
  // without needing a BuildContext.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Call once at app startup (after Firebase.initializeApp).
  static Future<void> initialize() async {
    await _requestPermission();
    await _refreshAndSaveToken();

    // Re-save the token whenever FCM rotates it.
    _messaging.onTokenRefresh.listen(_saveTokenToFirestore);

    // Foreground: app is open when the notification arrives.
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);

    // Background → foreground: user tapped the notification.
    FirebaseMessaging.onMessageOpenedApp.listen(_onNotificationTap);

    // Terminated → foreground: app was launched via notification tap.
    final initial = await _messaging.getInitialMessage();
    if (initial != null) _onNotificationTap(initial);
  }

  // ── Permission ────────────────────────────────────────────────────────────

  static Future<void> _requestPermission() async {
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
  }

  // ── Token management ──────────────────────────────────────────────────────

  static Future<void> _refreshAndSaveToken() async {
    final token = await _messaging.getToken();
    if (token != null) await _saveTokenToFirestore(token);
  }

  /// Saves the FCM token under users/{uid}/fcmToken in Firestore.
  /// The Cloud Function reads this to know where to deliver notifications.
  static Future<void> _saveTokenToFirestore(String token) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    await _firestore.collection('users').doc(uid).set(
      {
        'fcmToken': token,
        'phoneNumber':
            FirebaseAuth.instance.currentUser?.phoneNumber ?? '',
        'updatedAt': FieldValue.serverTimestamp(),
      },
      SetOptions(merge: true),
    );
  }

  // ── Message handlers ──────────────────────────────────────────────────────

  /// App is in the foreground — show an in-app banner via SnackBar.
  static void _onForegroundMessage(RemoteMessage message) {
    final notification = message.notification;
    if (notification == null) return;

    final context = navigatorKey.currentContext;
    if (context == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.title ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(notification.body ?? ''),
          ],
        ),
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Open',
          onPressed: () => _onNotificationTap(message),
        ),
      ),
    );
  }

  /// Notification was tapped — navigate to the relevant chat.
  static void _onNotificationTap(RemoteMessage message) {
    final conversationId = message.data['conversationId'];
    if (conversationId == null) return;

    // Navigate to the chat screen.
    // ChatScreen requires userName, userImage and receiverId — look them up
    // from Firestore before pushing the route if needed.
    navigatorKey.currentState?.pushNamed(
      '/chat',
      arguments: {
        'conversationId': conversationId,
        'senderName': message.data['senderName'] ?? 'New message',
        'senderImage': message.data['senderImage'] ?? '',
        'receiverId': message.data['senderId'] ?? '',
      },
    );
  }
}

/// Top-level handler for messages received while the app is terminated
/// or in the background. Must be a top-level function (not a class method).
/// Register it with FirebaseMessaging.onBackgroundMessage in main().
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Firebase is already initialized by the system in this isolate.
  // No UI operations are allowed here — just data processing if needed.
}
