import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp_clone/features/chat/data/model/chat_model.dart';
import 'package:whatsapp_clone/features/chat/domain/entities/chat_entity.dart';
import 'package:whatsapp_clone/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl extends ChatRepository {
  @override
  Future<List<ChatEntity?>> getChatMessage(String conversationId) async {
    final box = Hive.box('authBox');
    final idToken = box.get('idToken');

    final baseUrl = dotenv.env['GET_CHAT_MESSAGE_URL'];

    if (baseUrl == null) {
      throw Exception("GET_CHAT_MESSAGE_URL not set in .env file");
    }

    final uri = '$baseUrl/$conversationId';

    final response = await http.get(
      Uri.parse(uri),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $idToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> chatList = jsonData['messages'];
      final chat = chatList.map((e) => ChatModel.fromJson(e)).toList();
      return chat;
    } else {
      throw Exception('Error fetching chat list');
    }
  }
}
