import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_show_dialog.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_text_button.dart';
import 'package:whatsapp_clone/features/auth/view/auth.dart';

class DialogUtils {
  static void showConnectingDialog(BuildContext context) {
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

  static void showConfirmNumberDialogBox (BuildContext context){
    showDialog(
        context: context,
        builder: (_) =>
            CustomShowDialog(
              title: Text('Is this the correct number?', style: TextStyle(
                fontSize: 17,
              ),),
              widget: Column(
                children: [
                  Text('?????'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                        text: 'Edit',
                        textColor: AppColor.green,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),

                      SizedBox(width: 15,),
                      CustomTextButton(
                        text: 'Yes',
                        textColor: AppColor.green,
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            )
    );
  }


  static void showEnterPhoneDialog(BuildContext context) {
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



  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => CustomShowDialog(
        widget: Text(message),
      ),
    );
  }

}
