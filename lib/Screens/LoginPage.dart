// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:qgo_application/Constants/ReusableWidgets.dart';
import 'package:qgo_application/Controller/HomeController.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../Constants/Constant.dart';

import 'QRCodePage.dart';
import 'SelectionPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  QRViewController? controller;
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    final languageController lanChanger = Get.put(languageController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'sign-in with QR'.tr,
                style: appThemeText,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Icon(
                Icons.qr_code_2,
                size: IconsSize,
                color: blackC,
              ),
            ],
          ),
          onTap: () {
            Get.to(const QRCode());
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: RadiantGradientMask(
                  child: Icon(
                    Icons.menu,
                    size: IconsSize,
                  ),
                ));
          },
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(
                right: 10.0,
              ),
              height: _height * 0.15,
              width: _width * 0.15,
              child: Center(
                child: Text(
                  'Wed'.tr,
                  style: appThemeText,
                ),
              )),
        ],
      ),
      drawer: myDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Center(
                    child: Image(
                        height: 100,
                        image: AssetImage('assets/images/qgo.png')),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  UsernameTextField(_height, _width),
                  const SizedBox(
                    height: 10,
                  ),
                  passwordTextField(_height, _width),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Forget username or password?'.tr,
                      style: appThemeText,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 100,
                    width: _width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              border: Border.all(width: 3, color: blackC)),
                          child: const Center(
                            child: Icon(
                              FontAwesomeIcons.fingerprint,
                              size: 43,
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: CustomButtons(
                              inputText: 'SIGN IN'.tr, height: 40, width: 130),
                          onTap: () {
                            Get.to(SelectionPage());
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  signUpContainer(_height, _width)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row passwordTextField(double _height, double _width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7.0),
                  bottomLeft: Radius.circular(7.0))),
          child: Container(
            height: _height * 0.053,
            width: _width / 1.07,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff000000), Color(0xffe31c73)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.circular(7.0)),
            child: Obx(
              () => TextFormField(
                obscureText: HomeController.isPasswordHidden.value,
                style: appThemeText2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 10, left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: whiteC,
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Icon(
                          HomeController.isPasswordHidden.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 19,
                          color: blackC,
                        ),
                      ),
                    ),
                    hintText: 'Password'.tr,
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    hintStyle: appThemeText2,
                    filled: true,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none)),
                onTap: () {
                  HomeController.isPasswordHidden.value =
                      !HomeController.isPasswordHidden.value;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Padding UsernameTextField(double _height, double _width) {
    final HomeController ctrl = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            child: Container(
              height: _height * 0.055,
              width: _width / 1.57,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff000000), Color(0xffe31c73)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7.0),
                    bottomLeft: Radius.circular(7.0)),
              ),
              child: Center(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: appThemeText2,
                  decoration: InputDecoration(
                      hintText: 'User name or phone number'.tr,
                      isDense: true,
                      contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      hintStyle: appThemeText2,
                      filled: true,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                ),
              ),
            ),
          ),
          Container(
            width: _width * 0.30,
            height: _height * 0.055,
            decoration: const BoxDecoration(
                color: blackC,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(7.0),
                    bottomRight: Radius.circular(7.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'remember'.tr,
                  style: const TextStyle(
                      color: whiteC, fontSize: 13, overflow: TextOverflow.fade),
                ),
                Transform.scale(
                  scaleX: 1.5,
                  scaleY: 1.4,
                  child: Obx(
                    () => Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: lightWC,
                      ),
                      child: Checkbox(
                          checkColor: blackC,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          activeColor: whiteC,
                          value: ctrl.checkBool.value,
                          onChanged: (value) {
                            ctrl.checkBool.value = !ctrl.checkBool.value;
                          }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  signUpContainer(double _height, double _width) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff000000), Color(0xffe31c73)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      )),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'SIGN UP'.tr,
              style: appThemeText2,
            ),
            const SizedBox(
              height: 20.0,
            ),
            // ignore: sized_box_for_whitespace
            Container(
                height: _height * 0.07,
                width: _width / 1.2,
                child: IntlPhoneField(
                  dropdownIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: whiteC,
                  ),
                  cursorColor: whiteC,
                  keyboardType: TextInputType.phone,
                  style: appThemeText2,
                  textAlign: TextAlign.right,
                  disableLengthCheck: true,
                  decoration: InputDecoration(
                    hintText: 'Phone number'.tr,
                    hintStyle: appThemeText2,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: whiteC, width: 0.7),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: whiteC, width: 0.7),
                    ),
                  ),
                  initialCountryCode: 'PK',
                  onChanged: (phone) {
                    // ignore: avoid_print
                    print(phone.completeNumber);
                  },
                )),
            const SizedBox(
              height: 30.0,
            ),
            CustomButtons(inputText: 'SIGN UP'.tr, height: 40, width: 130),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(color: whiteC, width: 0.7)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'FACEBOOK'.tr,
                          style: appThemeText2,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Image(
                            height: 20,
                            image: AssetImage('assets/images/facebook2.png'))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(color: whiteC, width: 0.7)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'GOOGLE',
                          style: appThemeText2,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        const Image(
                            height: 20,
                            image: AssetImage('assets/images/google-plus.png'))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
