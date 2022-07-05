// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qgo_application/Screens/User%20Side/RatingPopupPage.dart';

import '../Screens/User Side/ChatPage.dart';
import '../Screens/User Side/HelpCenterPage.dart';
import '../Screens/User Side/PickUpDropOfLocationPage.dart';
import '../Screens/User Side/SettingsPage.dart';
import '../Screens/User Side/SupportPage.dart';
import '../Screens/User Side/UserProfile.dart';
import 'Constant.dart';
import 'package:popover/popover.dart';

class CustomButtons extends StatelessWidget {
  final String inputText;
  final double height;
  final double width;
  const CustomButtons(
      {Key? key,
      required this.inputText,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff000000), Color(0xffe31c73)],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Center(
          child: Text(
            inputText,
            style: appThemeText2,
          ),
        ));
  }
}

Widget myDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Color(0xffeeeeee)),
          // ignore: sized_box_for_whitespace
          child: Container(
            child: const Center(
              child:
                  Image(height: 70, image: AssetImage('assets/images/qgo.png')),
            ),
          ),
        ),
        ListTile(
            title: Text(
              'Languages'.tr,
              style: appThemeText,
            ),
            leading: const Icon(Icons.translate),
            onTap: () {
              Get.defaultDialog(
                title: "Choose Language!".tr,
                titlePadding: const EdgeInsets.all(10.0),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: const Text('English'),
                            onTap: () {
                              var locale = const Locale('en', 'US');

                              // ignore: avoid_print
                              print(locale);
                              Get.updateLocale(locale);
                              Get.back();
                            },
                          ),
                        ],
                      ),
                      const Divider(),
                      GestureDetector(
                        child: const Text('Mongolian'),
                        onTap: () {
                          var locale = const Locale('mn', 'MN');
                          Get.updateLocale(locale);
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
        ListTile(
          title: Text(
            'Profile'.tr,
            style: appThemeText,
          ),
          leading: Icon(Icons.speed),
          onTap: () {
            Get.to(UserProfile());
          },
        ),
        ListTile(
          title: Text(
            'Help Center',
            style: appThemeText,
          ),
          leading: const Icon(Icons.account_balance_outlined),
          onTap: () {
            Get.to(HelpCenterPage());
          },
        ),
        GestureDetector(
          onTap: () {
            Get.to(SettingsPage());
          },
          child: ListTile(
            title: Text(
              'Settings',
              style: appThemeText,
            ),
            leading: const Icon(Icons.settings),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(ChatPage());
          },
          child: ListTile(
            title: Text(
              'Issues Inbox',
              style: appThemeText,
            ),
            leading: const Icon(Icons.chat_bubble_outline),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(SupportPage());
          },
          child: ListTile(
            title: Text(
              'Support',
              style: appThemeText,
            ),
            leading: const Icon(Icons.support),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(RatingPopupPage());
          },
          child: ListTile(
            title: Text(
              'Rating Pop-up',
              style: appThemeText,
            ),
            leading: const Icon(Icons.star),
          ),
        ),
        const Divider(
          indent: 20.0,
          endIndent: 10.0,
          thickness: 1,
        ),
        ListTile(
          title: const Text(
            'Sign Out',
            style: TextStyle(color: redC),
          ),
          leading: const Icon(Icons.support),
        ),
      ],
    ),
  );
}

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [Color(0xFFe31c73), Color(0xFF040404)],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final dynamic icon;
  final dynamic prefixIcon;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        Get.to(PickupDropofLocationPage());
      },
      decoration: InputDecoration(
          suffixIcon: icon,
          prefixIcon: prefixIcon,
          fillColor: whiteC,
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: blackC,
              width: 0.4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: const BorderSide(
              color: Color.fromRGBO(227, 228, 230, 1),
              width: 2.0,
            ),
          ),
          hintText: hintText,
          contentPadding: const EdgeInsets.all(17),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
    );
  }
}

class SearchBarBottom3Containers extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final dynamic icon;
  const SearchBarBottom3Containers(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.black38, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 12, overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}

class WhiteContainer extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  const WhiteContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: whiteC, borderRadius: BorderRadius.circular(5.0)),
          child: Center(
            child: Text(
              text,
              style: smallappThemeText4,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ));
  }
}

class slideupButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  const slideupButton(
      {Key? key, required this.height, required this.width, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      // width: 110,
      height: height,
      width: width,
      child: RaisedButton(
        onPressed: () {},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff3d3d5c), Color.fromARGB(255, 22, 76, 128)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Container(
            constraints: const BoxConstraints(
                minWidth: 88.0,
                minHeight: 36.0), // min sizes for Material buttons
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: appThemeText2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  dynamic image;
  ProfileContainer({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: CircleAvatar(
          radius: 27,
          backgroundImage: ExactAssetImage(image),
        ),
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => const ListItems(),
            onPop: () => print('Popover was popped!'),
            direction: PopoverDirection.top,
            width: 300,
            height: 120,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: lightBorderBC,
          width: 3.0,
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              // onTap: () {
              //   Navigator.of(context)
              //     ..pop()
              //     ..push(
              //       MaterialPageRoute<SecondRoute>(
              //         builder: (context) => SecondRoute(),
              //       ),
              //     );
              // },
              child: Container(
                height: MediaQuery.of(context).size.height,
                // color: Colors.amber[100],
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 50,
                      // color: blackC,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            height: 15,
                            width: 20,
                            decoration: BoxDecoration(
                                color: whiteC,
                                border: Border.all(),
                                shape: BoxShape.circle),
                          ),
                          const SizedBox(
                            height: 7.0,
                          ),
                          const Icon(
                            Icons.more_vert,
                            color: blackC,
                            size: 25,
                          ),
                          const SizedBox(
                            height: 7.0,
                          ),
                          const Icon(
                            Icons.place,
                            color: redC,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: blueC,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('DHA Block A, Multan',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 16)),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                'Cantonment Garden, Multan',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileContainer extends StatelessWidget {
  String text;
  EditProfileContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: innerInputColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    text,
                    // style: normalBText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesContainer extends StatelessWidget {
  double height;
  double width;
  Widget text;
  DecorationImage image;
  ServicesContainer(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: lightBC,
            borderRadius: BorderRadius.circular(10.0),
            image: image),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5.0, left: 5.0),
              child: text,
            ),
          ],
        ),
      ),
    );
  }
}
