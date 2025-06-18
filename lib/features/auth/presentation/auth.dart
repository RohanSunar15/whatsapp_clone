import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_button.dart';
import 'package:whatsapp_clone/core/widgets/dialogs/dialog_utils.dart';
import 'package:whatsapp_clone/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:whatsapp_clone/features/auth/presentation/otp_verification.dart';
import 'package:whatsapp_clone/features/countryCodePage/presentation/country_code_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();


}


class _AuthPageState extends State<AuthPage> {
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;
  String? selectedCountryName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryCodeController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }


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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is PhoneAuthLoading) {
            DialogUtils.showConnectingDialogBox(context);
            Future.delayed(Duration(seconds: 3));
          } else if (state is AuthCountrySelected) {
            countryCodeController.text = state.countryCode;
            selectedCountryName = state.countryName;
          } else if (state is FormBothFieldsEmpty) {
            DialogUtils.showInvalidCountryCodeDialogBox(context);
          } else if (state is FormPhoneMissing) {
            DialogUtils.showEnterPhoneDialogBox(context);
          } else if (state is PhoneNumberFormatted) {
            phoneNumberController.value = TextEditingValue(
              text: state.formattedPhoneNumber,
              selection: TextSelection.collapsed(
                  offset: state.formattedPhoneNumber.length),
            );
          } else if (state is PhoneNumberUnderLimit) {
            if (Navigator.canPop(context)) Navigator.pop(context);
            DialogUtils.showPhoneNumberUnderLimitDialogBox(context);
          } else if (state is PhoneNumberExceedsLimit) {
            if (Navigator.canPop(context)) Navigator.pop(context);
            DialogUtils.showPhoneNumberExceedsLimitDialogBox(context);
          } else if (state is BackToAuthScreen) {
            int count = 0;
            while (Navigator.canPop(context) && count < 2) {
              Navigator.pop(context);
              count++;
            }
          } else if (state is NavigateToOtpVerificationScreen) {
            if (Navigator.canPop(context)) Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (BuildContext context) =>
                    OtpVerificationPage(
                      phoneNumber: state.phoneWithCountryCode,)));
          } else if (state is OtpSendingLoading) {
            DialogUtils.showSendingCodeDialogBox(context);
            await Future.delayed(Duration(seconds: 2));
            Navigator.pop(context);
          } else if (state is AuthFormValidation) {
            DialogUtils.showConfirmNumberDialogBox(
                context,
                phoneNumber: phoneNumberController.text,
                countryCode: countryCodeController.text,
                onEditPressed: () {
                  context.read<AuthBloc>().add(EditButtonClicked());
                },
                onYesPressed: () async {
                  final phoneNumber = '+${countryCodeController
                      .text} ${phoneNumberController.text}';
                  print('YES clicked, sending phone: $phoneNumber');
                  context.read<AuthBloc>().add(SendOtp(phoneNumber));
                }
            );
          }
        },
        builder: (context, state) {
          return Container(
            color: AppColor.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30.0, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Enter your phone number',
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

                  // Country Name TextField
                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CountryCodePage()),
                      );

                      if (result != null && result is Map) {
                        context.read<AuthBloc>().add(
                            CountrySelected(
                                countryName: result['countryName'],
                                countryCode: result['countryCode'])
                        );
                      }
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: selectedCountryName ?? "Choose a country",
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
                      // Country Code TextField
                      SizedBox(
                        width: 100,
                        child: TextField(
                          onChanged: (value) {
                            context.read<AuthBloc>().add(CountryCodeChanged(
                                countryCode: value
                            ));
                          },
                          controller: countryCodeController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.add, size: 20, color: AppColor.grey,),
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

                      //Phone Number TextField
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            onChanged: (value) {
                              context.read<AuthBloc>().add(
                                  PhoneNumberChanged(phoneNumber: value,
                                      countryCode: countryCodeController.text));
                            },
                            controller: phoneNumberController,
                            style: TextStyle(
                                fontSize: 19
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: 'Phone number',
                              hintStyle: TextStyle(
                                  fontSize: 19,
                                  color: AppColor.grey
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColor
                                        .lightGreen), // Normal state
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightGreen,
                                    width: 5), // On focus
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomOutlinedButton(
                        borderRadius: 30,
                        height: 50,
                        width: 350,
                        backgroundColor: AppColor.lightGreen,
                        childWidget: Text('Next',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          context.read<AuthBloc>().add(NextButtonClicked(
                              countryCode: countryCodeController.text,
                              phoneNumber: phoneNumberController.text));
                        }
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
