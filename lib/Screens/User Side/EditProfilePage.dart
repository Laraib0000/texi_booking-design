// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qgo_application/Constants/ReusableWidgets.dart';

import '../../Constants/Constant.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var vibrateBooking = false;
  var privateRide = true;
  var shareRide = false;
  var foodDelivery = true;
  var tourism = false;
  var carRental = false;
  var moving = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: whiteC,
        iconTheme: IconThemeData(color: blackC),
      ),
      body: Container(
        color: whiteC,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Edit Profile',
                // style: appThemeText2,
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20.0),
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              decoration: BoxDecoration(
                  color: innerInputColor,
                  border: Border.all(color: fullLightBC),
                  borderRadius: BorderRadius.circular(5.0)),
              child: TextFormField(
                  decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Joseph',
                // hintStyle: inputFieldText,
              )),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  color: innerInputColor,
                  border: Border.all(color: fullLightBC),
                  borderRadius: BorderRadius.circular(5.0)),
              child: TextFormField(
                  decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Phone Number',
                // hintStyle: inputFieldText,
              )),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  color: innerInputColor,
                  border: Border.all(color: fullLightBC),
                  borderRadius: BorderRadius.circular(5.0)),
              child: TextFormField(
                  decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Home Address',
                // hintStyle: inputFieldText,
              )),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  color: innerInputColor,
                  border: Border.all(color: fullLightBC),
                  borderRadius: BorderRadius.circular(5.0)),
              child: TextFormField(
                  decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Mail@gmai.com',
                // hintStyle: inputFieldText,
              )),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  color: innerInputColor,
                  border: Border.all(color: fullLightBC),
                  borderRadius: BorderRadius.circular(5.0)),
              child: TextFormField(
                  decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                // hintStyle: inputFieldText,
              )),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomButtons(inputText: 'Save'.tr, height: 40, width: 200),
          ],
        ),
      ),
    );
  }
}
