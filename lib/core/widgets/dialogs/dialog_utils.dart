import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_show_dialog.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_text_button.dart';

class DialogUtils {
  static void showConnectingDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => CustomShowDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        widget: Row(
          children: [
            const SizedBox(width: 25),
            CircularProgressIndicator(color: AppColor.lightGreen),
            const SizedBox(width: 25),
            const Text(
              'Connecting...',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

  static void showInvalidCountryCodeDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) =>
            CustomShowDialog(
                title: Text('Invalid country code length (1-3 digit only).',
                  style: TextStyle(
                fontSize: 17,
                      color: AppColor.grey
              ),),
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      text: 'OK',
                      textColor: AppColor.green,
                      onPressed: () {
                        Navigator.pop(context);
                      },

                    ),
                  ],
                )
            )
    );
  }

  static void showEnterPhoneDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) =>
            CustomShowDialog(
              title: Text('Please enter your phone number.',
                style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 15
                ),
              ),
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(
                    text: 'OK',
                    textColor: AppColor.green,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                ],
              ),
            )
    );
  }

  static void showPhoneNumberExceedsLimitDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) =>
            CustomShowDialog(
                title: Text(
                  'The Phone number you entered is too long for the country: India',
                  style: TextStyle(
                      fontSize: 17,
                      color: AppColor.grey
                  ),),
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      text: 'OK',
                      textColor: AppColor.green,
                      onPressed: () {
                        Navigator.pop(context);
                      },

                    ),
                  ],
                )
            )
    );
  }

  static void showPhoneNumberUnderLimitDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) =>
            CustomShowDialog(
                title: Column(
                  children: [
                    Text(
                      'The phone number you entered is too short for the country: India',
                      style: TextStyle(
                          fontSize: 17,
                          color: AppColor.grey
                      ),),
                    SizedBox(height: 10,),
                    Text('Include your area code if you haven\'t. ',
                      style: TextStyle(
                          fontSize: 17,
                          color: AppColor.grey
                      ),),
                  ],
                ),
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      text: 'OK',
                      textColor: AppColor.green,
                      onPressed: () {
                        Navigator.pop(context);
                      },

                    ),
                  ],
                )
            )
    );
  }

  static void showConfirmNumberDialogBox(BuildContext context,
      { required String phoneNumber,
        required String countryCode,
        required VoidCallback onEditPressed,
        required VoidCallback onYesPressed,
      }) {
    showDialog(
        context: context,
        builder: (_) =>
            CustomShowDialog(
              title: Text('Is this the correct number?', style: TextStyle(
                fontSize: 17,
              ),
              ),
              dialogHeight: 90,
              widget: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('+$countryCode $phoneNumber',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,

                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                        text: 'Edit',
                        textColor: AppColor.green,
                        onPressed: onEditPressed
                      ),

                      SizedBox(width: 15,),
                      CustomTextButton(
                        text: 'Yes',
                        textColor: AppColor.green,
                        onPressed: onYesPressed,
                      ),
                    ],
                  )
                ],
              ),
            )
    );
  }

  static void showSendingCodeDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => CustomShowDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        widget: Row(
          children: [
            const SizedBox(width: 25),
            CircularProgressIndicator(color: AppColor.lightGreen),
            const SizedBox(width: 25),
            const Text(
              'Sending code...',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }


  static void showErrorDialogBox(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => CustomShowDialog(
        widget: Text(message),
      ),
    );
  }

  static void showVerifyingDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) =>
          CustomShowDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            widget: Row(
              children: [
                const SizedBox(width: 25),
                CircularProgressIndicator(color: AppColor.lightGreen),
                const SizedBox(width: 25),
                const Text(
                  'Verifying...',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
    );
  }

  static void showIncorrectCodeDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) =>
            CustomShowDialog(
                title: Text('The code you entered is incorrect. Please try again in 2 seconds.',
                  style: TextStyle(
                      fontSize: 17,
                      color: AppColor.grey
                  ),),
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      text: 'OK',
                      textColor: AppColor.green,
                      onPressed: () {
                        Navigator.pop(context);
                      },

                    ),
                  ],
                )
            )
    );
  }



  static void showTryAgainDialogBox(BuildContext context,
      { required String phoneNumber,
        required String countryCode,
        required VoidCallback onEditPressed,
        required VoidCallback onYesPressed,
      }) {
    showDialog(
        context: context,
        builder: (_) =>
            CustomShowDialog(
              title: Text(
                'Unable to connect. Please try again later.', style: TextStyle(
                fontSize: 17,
              ),
              ),
              dialogHeight: 90,
              widget: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('+$countryCode $phoneNumber',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,

                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                          text: 'Edit',
                          textColor: AppColor.green,
                          onPressed: onEditPressed
                      ),

                      SizedBox(width: 15,),
                      CustomTextButton(
                        text: 'Yes',
                        textColor: AppColor.green,
                        onPressed: onYesPressed,
                      ),
                    ],
                  )
                ],
              ),
            )
    );
  }
}
