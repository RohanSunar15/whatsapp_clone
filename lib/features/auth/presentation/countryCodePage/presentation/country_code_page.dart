import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/features/auth/presentation/countryCodePage/local_repository/country_code_data.dart';

class CountryCodePage extends StatefulWidget {
  const CountryCodePage({super.key});

  @override
  State<CountryCodePage> createState() => _CountryCodePageState();
}

class _CountryCodePageState extends State<CountryCodePage> {
  @override
  Widget build(BuildContext context) {
    final countryEntries = CountryCodeList.countries.entries.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Country'),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.keyboard_backspace_sharp),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: CountryCodeList.countries.length,
        itemBuilder: (context, index) {
          final country = countryEntries[index];
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('${country.value['flag']}'),
                    SizedBox(width: 15),
                    Text(
                      country.key,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  '+${country.value['code']}',
                  style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context, {
                  'countryName' : country.key,
                  'countryCode' : country.value['code'],
              });
            },
          );
        },
        separatorBuilder:(context, index) =>  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            color: AppColor.grey,
            thickness: 0.5,
            height: 0.5,
          ),
        ),
      ),
    );
  }
}
