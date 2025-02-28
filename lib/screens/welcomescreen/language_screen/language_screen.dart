import 'package:flutter/material.dart';
import 'package:whatsapp_clone/data/language_data.dart';
import '../../../constant/color.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {

    List<MapEntry<String, String>> languageList = languageMap.entries.toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      minChildSize: 0.5,
      builder: (context, scrollController){
        return Material(
        color: white,
        child: SafeArea(
          child: Column(
            children: [
              Icon(Icons.horizontal_rule_rounded, size: 35, color: grey),
              Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.close),
                  SizedBox(width: 30),
                  Text(
                    'App Language',
                    style: TextStyle(
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Divider(height: 3, color: lightGrey,),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: languageList.length,
              itemBuilder: (context, index) {
                String key = languageList[index].key;
                String value = languageList[index].value;

                return RadioListTile<String>(
                  title: Text(value ,style: TextStyle(fontSize: 14),),
                  subtitle: Text(key ,style: TextStyle(fontSize: 12),),
                  value: key,
                  groupValue: selectedLanguage,
                  onChanged: (value) {},
                  activeColor: Colors.green,
                  dense: true,
                );
              },
            ),
          ),
            ],
          ),
        ),
      );
      },
    );
  }
}
