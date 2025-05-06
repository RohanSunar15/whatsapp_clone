import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_button.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_text_button.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
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
                    'Waiting to automatically detect 6-digit code sent by SMS to +91 98989 89898. ',
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: TextField(
                        controller: otpController,
                        // focusNode: otpFocusNode,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
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
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  CustomOutlinedButton(
                    childWidget: Icon(
                      Icons.arrow_forward_outlined,
                      color: AppColor.white,
                      size: 25,
                    ),
                    backgroundColor: AppColor.lightGreen,
                    borderRadius: 50,
                    height: 60,
                    width: 65,
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            CustomTextButton(
              text: 'Din\'t receive code?',
              textColor: AppColor.green,
              fontSize: 17,
            ),

          ],
        ),
      ),
    );
  }
}
