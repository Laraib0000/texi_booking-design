// ignore_for_file: file_names
import 'package:flutter/material.dart';

const whiteC = Color(0xFFFFFFFF);
const redC = Color(0xFFFF0000);
const blackC = Color(0xFF000000);
const lightBC = Color(0x61000000);
const blueC = Color(0xFF8080ff);
const lightWC = Color(0xFF999999);
const lightBorderBC = Color(0xFFd5d5d7);
const lightextBC = Color(0xFF424242);
const fullLightBC = Color(0xFF000000);
const extraLightWC = Color(0xFFf8f8fa);
const lightBorderC = Color(0xFFe6e5f3);
const blueishWC = Color(0xFFEEEFF3);
const innerInputColor = Color(0xFFf8f8fa);
const borderColor = Color(0xFFd5d5d7);
Color lightGreyC = Colors.grey.shade200;

// ignore: prefer_const_constructors
final appThemeText = TextStyle(
  color: blackC,
  fontSize: 17,
  decoration: TextDecoration.none,
  fontWeight: FontWeight.w500,
);
// ignore: prefer_const_constructors
final appThemeText1 = TextStyle(
  color: whiteC,
  fontSize: 17,
  decoration: TextDecoration.none,
  fontWeight: FontWeight.w500,
);
// ignore: prefer_const_constructors
final appThemeText2 = TextStyle(
    color: whiteC,
    fontSize: 15,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w500,
    fontFamily: 'Myriad-Pro');

// ignore: prefer_const_constructors
final appThemeText3 = TextStyle(
  color: whiteC,
  fontSize: 26,
  decoration: TextDecoration.none,
  fontWeight: FontWeight.w500,
);
final smallappThemeText4 = TextStyle(
  color: blackC,
  fontSize: 13,
  decoration: TextDecoration.none,
  fontWeight: FontWeight.w500,
);
final appThemeText5 = TextStyle(
    color: whiteC,
    fontSize: 18,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w500,
    fontFamily: 'Myriad-Pro');

// ignore: non_constant_identifier_names
var IconsSize = 40.0;

// ignore: camel_case_types
class gradientColor extends StatelessWidget {
  const gradientColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        stops: [
          0.30,
          0.61,
          1.1,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFFa3a4d5),
          Color(0xFFa8aad6),
          Color(0xFFffffff),
        ],
      )),
    ));
  }
}
