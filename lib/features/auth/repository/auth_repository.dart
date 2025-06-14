import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp_clone/features/auth/model/user_model.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhone(String phoneNumber,
      Function(String) onCodeSent,
      Function(String) onAutoVerified,
      Function(String) onFailed,) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential)async{
          await _auth.signInWithCredential(credential);
          onAutoVerified("Auto Verified");
        },
        verificationFailed: (FirebaseAuthException e){
        onFailed(e.message ?? "Verification Failed");
        },
        codeSent: (String verificationId, int? resendToken){
        onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId){
    });
  }


  Future<UserModel?> verifyOTP(String verificationId, String otp,
      String phoneNumber,) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      final idToken = await _auth.currentUser!.getIdToken();

      final success = await sendIdTokenToBackend(idToken!);

      if (success) {
        final user = await fetchUserData(phoneNumber);
        return user;
      } else {
        print('Backend token verification failed');
        return null;
      }
    } catch (e) {
      print('Error verifying OTP: $e');
      return null;
    }
  }

  Future<bool> sendIdTokenToBackend(String idToken) async {
    print(idToken);
    final uri = 'http://10.0.2.2:8000/verify-token';

    final response = await http.post(
      Uri.parse(uri),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'token': idToken}),
    );
    return response.statusCode == 200;
  }


  Future<UserModel?> fetchUserData(String phoneNumber,) async {
    String formattedNumber = phoneNumber.replaceAll(' ', '');

    final uri = 'http://10.0.2.2:8000/user/$formattedNumber';

    print(uri);
    try{
      final response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return UserModel.fromJson(data);
      } else if (response.statusCode == 404) {
        print('User not found');
        return null;
      } else {
        print('Failed to fetch user: ${response.statusCode}');
        return null;
      }
    } catch(e) {
      print('Error fetching user: $e');
      return null;
    }

  }

  User? get currentUser => _auth.currentUser;
}