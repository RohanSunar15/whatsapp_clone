import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widget/custom_button.dart';
import 'package:whatsapp_clone/features/auth/countryCodePage/country_code_page.dart';
import 'package:whatsapp_clone/features/auth/countryCodePage/local_repository/country_code_data.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    String? selectedCountry;
    final countryEntries = CountryCodeList.countries.entries.toList();

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
      body: Container(
        color: AppColor.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                'Enter your phone number',
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text:
                    'WhatsApp will need to verify your phone number. Carrier charges \nmay apply. ',
                    style: TextStyle(
                      color: AppColor.grey,
                      fontSize: 19,
                      decoration: TextDecoration.none,
                    ),
                    children: [
                      TextSpan(text: 'What\'s my number?',

                        style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        ),
                    ),

                    ]
                ),
              ),
              SizedBox(height: 20,),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CountryCodePage(),
                    ),
                  );
                },
                child: AbsorbPointer(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      // labelText: selectedCountry ?? "Choose a country" ,
                      hintText: selectedCountry ?? "Choose a country",
                      hintStyle: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                      suffixIconColor: AppColor.lightGreen,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor
                            .lightGreen), // Normal state
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightGreen,
                            width: 5), // On focus
                      ),
                    ),
                  ),
              ),
              ),

              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintText: '91',
                        hintStyle: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(Icons.add),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor
                              .lightGreen), // Normal state
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen,
                              width: 5), // On focus
                        ),
                      ),
                    ),
                  ),

                  Expanded( // <-- Expanded goes here
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AbsorbPointer( // optional if it's just for display
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: 'Phone number',
                            hintStyle: TextStyle(
                                fontSize: 19,
                                color: AppColor.grey
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.lightGreen), // Normal state
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightGreen,
                                  width: 5), // On focus
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              CustomOutlinedButton(childWidget: Text('Next')),

            ],
          ),
        ),
      ),
    );
  }
}
