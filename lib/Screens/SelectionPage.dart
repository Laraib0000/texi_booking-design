import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:glass/glass.dart';

import '../Constants/Constant.dart';
import '../Constants/ReusableWidgets.dart';
import 'Driver Side/DriverPaymentPage.dart';
import 'User Side/MoreServices.dart';
import 'User Side/UserMapPage.dart';

class SelectionPage extends StatefulWidget {
  SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        iconTheme: IconThemeData(
          size: IconsSize,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      endDrawer: myDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              // top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                child: Image(
                    image: AssetImage('assets/images/QGO_background.png')),
              ),
            ),
            Positioned(
                right: 15,
                top: 100,
                child: Image(
                    height: 80, image: AssetImage('assets/images/qgo.png'))),
            Positioned(
              left: 10,
              right: 10,
              top: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 140,
                      width: 220,
                      child: Center(
                        child: Text(
                          'PASSENGER'.tr,
                          style: appThemeText3,
                        ),
                      ),
                    ).asGlass(
                      clipBorderRadius: BorderRadius.circular(15.0),
                    ),
                    onTap: () {
                      Get.to(UserMapPage());
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 140,
                      width: 220,
                      child: Center(
                        child: Text(
                          'DRIVER'.tr,
                          style: appThemeText3,
                        ),
                      ),
                    ).asGlass(
                      clipBorderRadius: BorderRadius.circular(15.0),
                    ),
                    onTap: () {
                      Get.to(DriverPaymentPage());
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(MoreServices());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "More Services".tr,
                            style: const TextStyle(
                                color: whiteC,
                                fontSize: 18,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
