import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

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


  Future<void> verifyOTP(String verificationId, String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    await _auth.signInWithCredential(credential);
  }

  User? get currentUser => _auth.currentUser;
}