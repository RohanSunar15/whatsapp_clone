import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp_clone/features/chatList/data/model/chatlist_model.dart';
import 'package:whatsapp_clone/features/chatList/domain/entities/chatlist_entity.dart';
import 'package:whatsapp_clone/features/chatList/domain/repositories/chatlist_repository.dart';

class ChatListRepositoryImpl extends ChatListRepository {
  @override
  Future<List<ChatListEntity?>> getChatList() async {
    final box = Hive.box('authBox');
    final mongoId = box.get('mongoId');
    final idToken = box.get('idToken');

    if (mongoId == null || idToken == null) {
      throw Exception('User not logged in');
    }

    print('Stored mongoId: ${box.get('mongoId')}');
    print('Stored idToken: ${box.get('idToken')}');

    final baseUrl = dotenv.env['GET_CONVERSATIONS_URL'];

    if (baseUrl == null) {
      throw Exception("GET_CONVERSATIONS_URL not set in .env file");
    }

    final uri = '$baseUrl/$mongoId';

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
      print(chatList);
      return chatList.map((e) => ChatListModel.fromJson(e)).toList();
    } else {
      throw Exception('Error fetching chat list');
    }
  }
}
