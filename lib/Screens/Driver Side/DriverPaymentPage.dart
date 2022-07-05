// ignore_for_file: file_names

import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:get/get.dart';
import 'package:qgo_application/Constants/Constant.dart';
import 'package:qgo_application/Screens/Driver%20Side/DriverSubscriptionPage.dart';

import '../../Constants/ReusableWidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DriverPaymentPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  DriverPaymentPage({Key? key}) : super(key: key);

  @override
  State<DriverPaymentPage> createState() => _DriverPaymentPageState();
}

class _DriverPaymentPageState extends State<DriverPaymentPage> {
  List<Color> colorizeColors = [
    Colors.pink,
    Color.fromARGB(255, 22, 8, 5),
    Colors.black,
  ];
  TextStyle colorizeTextStyle = const TextStyle(
    fontSize: 240.0,
    fontFamily: 'Myriad-Pro',
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(''),
        iconTheme: IconThemeData(
          size: IconsSize,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      endDrawer: myDrawer(),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff22133c), Color(0xffea296a)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 30),
                height: height / 3,
                width: double.infinity,
                child: SizedBox(
                  child: Center(
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        ColorizeAnimatedText('G',
                            textStyle: colorizeTextStyle,
                            colors: colorizeColors,
                            speed: const Duration(seconds: 1)),
                      ],
                      isRepeatingAnimation: true,
                      onTap: () {
                        // ignore: avoid_print
                        print("Tap Event");
                      },
                    ),
                  ),
                )),
            GestureDetector(
              child: Container(
                  height: 55,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: whiteC, width: 0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Start Your Free Trial'.tr,
                        style: appThemeText1,
                      ),
                      Text(
                        'Free'.tr,
                        style: appThemeText1,
                      ),
                    ],
                  )),
              onTap: () {},
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width / 1.4,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 0.5, color: whiteC),
                          bottom: BorderSide(width: 0.5, color: whiteC),
                          left: BorderSide(width: 0.5, color: whiteC),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Choose Subscription'.tr,
                                style: appThemeText1),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      // ignore: avoid_print
                      print('clicked');
                      showPickerModal(context);
                    },
                  ),
                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 0.5, color: whiteC),
                          bottom: BorderSide(width: 0.5, color: whiteC),
                          right: BorderSide(width: 0.5, color: whiteC),
                        ),
                      ),
                      child: Tooltip(
                          child: const Icon(
                            FontAwesomeIcons.circleInfo,
                            color: whiteC,
                          ),
                          message:
                              'Lorem ipsum dolor sit amet, consectetur es simplemente ',
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.9),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showPickerModal(BuildContext context) async {
    // ignore: constant_identifier_names
    const PickerData = '''[
    {
        "1 Day": [
            {
                "2km": [
                    "\$10"
                ]
            },
            {
                "3km": [
                  "\$11"
                ]
            },
            {
                "4km": [
                    "\$12"
                ]
            },
            {
                "5km": [
                    "\$13"
                ]
            },
            {
                "6km": [
                    "\$14"
                ]
            },
             {
                "7km": [
                    "\$15"
                ]
            },
             {
                "8km": [
                    "\$16"
                ]
            },
             {
                "9km": [
                    "\$17"
                ]
            },
             {
                "10km": [
                    "\$18"
                ]
            },
             {
                "11km": [
                    "\$19"
                ]
            },
             {
                "12km": [
                    "\$20"
                ]
            },
             {
                "13km": [
                  "\$21"
                ]
            },
             {
                "14km": [
                    "\$22"
                ]
            },
             {
                "15km": [
                    23
                ]
            },
             {
                "16km": [
                    "\$24"
                ]
            },
             {
                "17km": [
                    "\$25"
                ]
            },
             {
                "18km": [
                   "\$26"
                ]
            },
             {
                "19km": [
                    "\$27"
                ]
            },
             {
                "20km": [
                   "\$28"
                ]
            }
            
           
           
           
          
           
        ]
    },
    {
        "3 Days": [
            {
                "50km": [
                    "\$60"
                ]
            },
            {
                "80km": [
                  "\$100"
                ]
            },
            {
                "100km": [
                    "\$110"
                ]
            },
            {
                "120km": [
                    "\$130"
                ]
            },
            {
                "140km": [
                    "\$150"
                ]
            },
             {
                "170km": [
                    "\$170"
                ]
            },
             {
                "180km": [
                    "\$200"
                ]
            },
             {
                "200km": [
                    "\$210"
                ]
            },
             {
                "210km": [
                    "\$220"
                ]
            },
             {
                "220km": [
                    "\$240"
                ]
            },
             {
                "230km": [
                    "\$250"
                ]
            },
             {
                "250km": [
                  "\$270"
                ]
            }
           
        ]
    },
     {
        "5 Days": [
            {
                "100km": [
                    "\$130"
                ]
            },
            {
                "200km": [
                  "\$260"
                ]
            },
            {
                "300km": [
                    "\$360"
                ]
            },
            {
                "400km": [
                    "\$440"
                ]
            },
            {
                "500km": [
                    "\$600"
                ]
            },
             {
                "600km": [
                    "\$700"
                ]
            },
             {
                "800km": [
                    "\$900"
                ]
            },
             {
                "1000km": [
                    "\$1100"
                ]
            },
             {
                "1100km": [
                    "\$1200"
                ]
            },
             {
                "1200km": [
                    "\$1300"
                ]
            },
             {
                "1300km": [
                    "\$1400"
                ]
            },
             {
                "1400km": [
                  "\$1500"
                ]
            }
           
        ]
    },
    {
        "1 week": [
            {
                "10km": [
                    "\$40"
                ]
            },
            {
                "20km": [
                    "\$60"
                ]
            },
            {
                "30km": [
                    "\$80"
                ]
            },
            {
                "40km": [
                    "\$100"
                ]
            },
            {
                "50km": [
                    "\$120"
                ]
            }
        ]
    },
        {
        "2 weeks": [
            {
                "110km": [
                    "\$43"
                ]
            },
            {
                "243km": [
                    "\$42"
                ]
            },
            {
                "65km": [
                    "\$564"
                ]
            },
            {
                "11km": [
                    "\$664"
                ]
            },
            {
                "564km": [
                    "\$222"
                ]
            }
        ]
    },
    {
        "3 weeks": [
            {
                "330km": [
                    "\$33"
                ]
            },
            {
                "0900km": [
                    "\$400"
                ]
            },
            {
                "221km": [
                    "\$32"
                ]
            },
            {
                "99km": [
                    "\$85"
                ]
            },
            {
                "564km": [
                    "\$222"
                ]
            }
        ]
    },
    {
        "1 month": [
            {
                "200km": [
                    "\$300"
                ]
            },
            {
                "300km": [
                    "\$400"
                ]
            },
            {
                "400km": [
                    "\$500"
                ]
            },
            {
                "500km": [
                    "\$600"
                ]
            }
        ]
    }
]''';

    final result = await Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: const JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        hideHeader: false,
        selectedTextStyle: const TextStyle(color: Colors.blue, fontSize: 22),
        onConfirm: (picker, value) {
          Get.to(DriverSubscriptionPage());
          // // ignore: avoid_print
          // print(value.toString());
          // // ignore: avoid_print
          // print(picker.adapter.text);
          // Get.to(Scaffold(
          //   appBar: AppBar(title: const Text("Hello")),
          //   body: Center(
          //       child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Text("You click the Confirm button."),
          //       const SizedBox(height: 32),
          //       Text("result: \n ${picker.adapter.text}")
          //     ],
          //   )),
          // ));
        }).showModal(this.context);
    // ignore: avoid_print
    print("result: $result");
  }
}
