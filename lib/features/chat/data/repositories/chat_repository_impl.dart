import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/features/chat/data/model/chat_model.dart';
import 'package:whatsapp_clone/features/chat/domain/entities/chat_entity.dart';
import 'package:whatsapp_clone/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl extends ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Firestore path: conversations/{conversationId}/messages
  CollectionReference<Map<String, dynamic>> _messagesRef(
    String conversationId,
  ) =>
      _firestore
          .collection('conversations')
          .doc(conversationId)
          .collection('messages');

  @override
  Stream<List<ChatEntity>> getMessagesStream(String conversationId) {
    return _messagesRef(conversationId)
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ChatModel.fromFirestore(doc))
              .toList(),
        );
  }

  @override
  Future<void> sendMessage({
    required String conversationId,
    required String receiverId,
    required String text,
  }) async {
    final senderId = _auth.currentUser?.uid ?? '';
    final now = Timestamp.now();

    // Write the message to Firestore — this triggers the real-time stream
    // on all clients listening to this conversation automatically.
    await _messagesRef(conversationId).add({
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'conversationId': conversationId,
      'status': 'sent',
      'isCall': false,
      'callType': '',
      'callStatus': '',
      'unreadCount': 0,
      'createdAt': now,
      'updatedAt': now,
    });

    // Keep the conversation summary up-to-date for the chat list.
    await _firestore
        .collection('conversations')
        .doc(conversationId)
        .set({
      'lastMessage': text,
      'lastMessageTime': now,
      'participants': [senderId, receiverId],
    }, SetOptions(merge: true));
  }
}
