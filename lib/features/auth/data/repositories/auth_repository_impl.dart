import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp_clone/features/auth/data/model/user_model.dart';
import 'package:whatsapp_clone/features/auth/domain/entities/user_entity.dart';
import 'package:whatsapp_clone/features/auth/domain/repositories/auth_repository.dart';
import 'package:whatsapp_clone/features/chatList/data/repositories/chatlist_respository_impl.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final chatListRepo = ChatListRepositoryImpl();

  AuthRepositoryImpl();

  @override
  Future<void> verifyPhone(
    String phoneNumber,
    Function(String) onCodeSent,
    Function(String) onAutoVerified,
    Function(String) onFailed,
  ) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        onAutoVerified("Auto Verified");
      },
      verificationFailed: (FirebaseAuthException e) {
        onFailed(e.message ?? "Verification Failed");
      },
      codeSent: (String verificationId, int? resendToken) async {
        await onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Future<UserEntity?> verifyOTP(
    String verificationId,
    String otp,
    String phoneNumber,
  ) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      final idToken = await _auth.currentUser!.getIdToken();
      await sendIdTokenToBackend(idToken!);
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<UserEntity?> sendIdTokenToBackend(String idToken) async {
    try {
      final baseUrl = dotenv.env['VERIFY_USER_URL'];

      if (baseUrl == null) {
        throw Exception("VERIFY_USER_URL not set in .env file");
      }

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': idToken}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = UserModel.fromJson(data['user']);

        print(idToken);

        final box = Hive.box('authBox');
        await box.put('mongoId', user.mongoId);
        await box.put('idToken', idToken);

        return user;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  bool get isLoggedIn => _auth.currentUser != null;
}
