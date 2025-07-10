import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:whatsapp_clone/features/chatList/data/model/chatlist_model.dart';
import 'package:whatsapp_clone/features/chatList/domain/repositories/chatlist_respository.dart';

class ChatListRepositoryImpl extends ChatListRepository {
  @override
  Future<List<ChatListModel>> getChatList(String userId, String idToken) async {
    try {
      final uri = 'http://10.0.2.2:8000/message/conversations/$userId';
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $idToken',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final List<dynamic> chatList = jsonData['conversations'];
      } else {
        throw Exception('Failed to load chat list: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching chat list: $error');
    }
    return [];
  }
}
