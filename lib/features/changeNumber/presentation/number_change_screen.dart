import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_button.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_textfield.dart';

class NumberChangeScreen extends StatefulWidget {
  const NumberChangeScreen({super.key});

  @override
  State<NumberChangeScreen> createState() => _NumberChangeScreenState();
}

class _NumberChangeScreenState extends State<NumberChangeScreen> {
  final TextEditingController _oldNumber = TextEditingController(
    text: '98989 89898',
  );
  final TextEditingController _oldCountryCode = TextEditingController(
    text: '91',
  );
  final TextEditingController _newNumber = TextEditingController();
  final TextEditingController _newCountryCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        title: Text(
          'Change number',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade300, // or any border color
            height: 1.0,
          ),
        ),
        leadingWidth: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your old phone number with country code:',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                // old Country Code TextField
                SizedBox(
                  width: 50,
                  child: TextField(
                    onChanged: (value) {},
                    controller: _oldCountryCode,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    style: TextStyle(fontSize: 19, color: Colors.black),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add,
                        size: 13,
                        color: AppColor.grey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.black,
                        ), // Normal state
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightGreen,
                          width: 5,
                        ), // On focus
                      ),
                    ),
                  ),
                ),

                //Phone Number TextField
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {},
                      controller: _oldNumber,
                      style: TextStyle(fontSize: 14),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 19,
                          color: AppColor.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.lightGreen,
                            width: 5,
                          ), // On focus
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Text(
              'Enter your new phone number with country code:',
              style: TextStyle(color: AppColor.grey, fontSize: 12),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CustomOutlinedButton(
                  childWidget: Text(
                    'Next',
                    style: TextStyle(color: AppColor.white, fontSize: 14),
                  ),
                  borderRadius: 50,
                  backgroundColor: AppColor.lightGreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
