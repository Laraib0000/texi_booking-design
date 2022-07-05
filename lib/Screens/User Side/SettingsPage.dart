// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qgo_application/Constants/ReusableWidgets.dart';

import '../../Constants/Constant.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Settings',
                style: appThemeText,
              ),
            ),
            // GestureDetector(
            //   child: Container(
            //       height: 54,
            //       width: double.infinity,
            //       margin:
            //           const EdgeInsets.symmetric(horizontal: 24, vertical: 6.0),
            //       padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //       decoration: BoxDecoration(
            //           color: innerInputColor,
            //           border: Border.all(color: borderColor),
            //           borderRadius: BorderRadius.circular(5.0)),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: const [
            //           Text(
            //             'Languages',
            //           ),
            //         ],
            //       )),
            //   onTap: () {
            //     languagesDialogue();
            //   },
            // ),
            GestureDetector(
              child: Container(
                  height: 54,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 7.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      color: innerInputColor,
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text('Maps'),
                    ],
                  )),
              onTap: () {
                mapDialogue();
              },
            ),
            Container(
                height: 54,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 7.0),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                    color: innerInputColor,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Vibrate Booking Offers'),
                    Transform.scale(
                      scale: 0.7,
                      child: CupertinoSwitch(
                        activeColor: Colors.black,
                        value: vibrateBooking,
                        onChanged: (value) {
                          setState(() {
                            vibrateBooking = value;
                          });
                          // GhostMode(value);
                        },
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  mapDialogue() {
    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.center,
          child: StatefulBuilder(builder: (context, setState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Dialog(
                  insetPadding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 10.0),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 510,
                        decoration: BoxDecoration(
                            color: whiteC,
                            borderRadius: BorderRadius.circular(7)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'Change Map Style',
                                style: appThemeText,
                              ),
                            ),
                            SettingsContainer(text: 'Default Map'),
                            SettingsContainer(text: 'Satellite Map'),
                            SettingsContainer(text: 'Hybrid Map'),
                            SettingsContainer(text: 'Terrain'),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 7.0,
                                  ),
                                  height: 60,
                                  width: double.infinity,
                                  // color: blueC,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomButtons(
                                          inputText: 'Cancel',
                                          height: 40,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3),
                                      CustomButtons(
                                          inputText: 'Save Changes',
                                          height: 40,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }
}

class SettingsContainer extends StatelessWidget {
  String text;
  SettingsContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 52,
        width: double.infinity,
        margin: EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 5),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
            color: innerInputColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(5.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text),
          ],
        ));
  }
}
