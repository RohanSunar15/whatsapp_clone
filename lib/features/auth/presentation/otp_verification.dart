import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_text_button.dart';
import 'package:whatsapp_clone/core/widgets/dialogs/dialog_utils.dart';
import 'package:whatsapp_clone/features/auth/presentation/auth.dart';
import 'package:whatsapp_clone/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:whatsapp_clone/features/chatList/presentation/chat_list.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key, required this.phoneNumber});

  final String? phoneNumber;

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController otpController = TextEditingController(
      text: '___ ___'
  );
  String? currentVerificationId;

  @override
  void initState() {
    super.initState();
    otpController.selection = TextSelection.collapsed(offset: 0);
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is OtpUpdated) {
          otpController.value = TextEditingValue(
            text: state.otp,
            selection: TextSelection.collapsed(
                offset: state.cursorPosition),
          );
        }
        else if (state is OtpSentState) {
          currentVerificationId = state.verificationId;
        }
        else if (state is OtpVerifying) {
          DialogUtils.showVerifyingDialogBox(context);
          await Future.delayed(Duration(seconds: 2));
        }
        else if (state is OtpVerificationFailure) {
          DialogUtils.showIncorrectCodeDialogBox(context);
          await Future.delayed(Duration(seconds: 2));
        }
        else if (state is AuthFailure) {
          DialogUtils.showIncorrectCodeDialogBox(context);
        }
        else if (state is AuthSuccess) {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (BuildContext context) => ChatList()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.more_vert_outlined),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 30.0, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Text(
                  'Verifying your number',
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 30),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                    'Waiting to automatically detect 6-digit code sent by SMS to ${widget
                        .phoneNumber}. ',
                    style: TextStyle(
                      color: AppColor.grey,
                      fontSize: 17,
                      decoration: TextDecoration.none,
                    ),
                    children: [
                      TextSpan(
                        text: 'Wrong number?',
                        style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  AuthPage()), // Replace with your screen
                            );
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: TextField(
                            onChanged: (value) {
                              context.read<AuthBloc>().add(
                                  OtpChanged(otp: value));

                              if (value.length == 6) {
                                context.read<AuthBloc>().add(VerifyOtp(
                                  otp: value,
                                  phoneNumber: widget.phoneNumber!,
                                  verificationId: '',
                                ));
                              }

                            },
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 10,
                            ),
                            controller: otpController,
                            // focusNode: otpFocusNode,
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6),
                            ],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ), // Grey bottom line
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ), // Grey when focused
                              ),
                            ),
                            cursorColor: AppColor.green,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                CustomTextButton(
                  text: 'Didn\'t receive code?',
                  textColor: AppColor.green,
                  fontSize: 17,
                ),

              ],
            ),
          ),
        );
      },
    );
  }

}

