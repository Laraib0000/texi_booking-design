import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qgo_application/Translation/Qgotranslation.dart';
import 'package:sizer/sizer.dart';
import 'Screens/LoginPage.dart';

void main() => runApp(
      GetMaterialApp(
        translations: Qgotranslation(),
        locale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        home: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: 'Myriad-Pro'),
        home: const LoginPage(),
      );
    });
  }
}
