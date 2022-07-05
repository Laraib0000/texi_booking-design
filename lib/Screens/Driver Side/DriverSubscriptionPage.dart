import 'package:flutter/material.dart';
import 'package:qgo_application/Constants/Constant.dart';
import 'package:status_stepper/status_stepper.dart';

import '../../Constants/ReusableWidgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DriverSubscriptionPage extends StatefulWidget {
  DriverSubscriptionPage({Key? key}) : super(key: key);

  @override
  State<DriverSubscriptionPage> createState() => _DriverSubscriptionPageState();
}

class _DriverSubscriptionPageState extends State<DriverSubscriptionPage> {
  List<Color> colorizeColors = [
    Colors.pink,
    Color.fromARGB(255, 22, 8, 5),
    Colors.black,
  ];
  TextStyle colorizeTextStyle = const TextStyle(
    fontSize: 240.0,
    fontFamily: 'Myriad-Pro',
  );

  final statuses = List.generate(
    3,
    (index) => SizedBox.square(
      dimension: 32,
      child: Center(child: Text('$index')),
    ),
  );

  int curIndex = -3;
  int lastIndex = -1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  height: height / 3,
                  width: double.infinity,
                  // color: blueC,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.cen,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Q',
                              style: TextStyle(
                                  color: whiteC,
                                  fontSize: 120,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Myriad-Pro'),
                            ),
                            Text(
                              'GO',
                              style: TextStyle(
                                  color: whiteC,
                                  fontSize: 70,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Myriad-Pro'),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 40,
                          width: width / 1.5,
                          color: lightBC,
                          child: Center(
                              child: Text(
                            'PAYMENT',
                            style: appThemeText5,
                          )),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: height * 0.12,
                  width: width,
                  decoration: BoxDecoration(
                      color: lightBC,
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                      border: Border.all(width: 0.7, color: whiteC)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'DAYS',
                              style: appThemeText5,
                            ),
                            Container(
                              height: 25,
                              width: 45,
                              color: whiteC,
                              child: Center(child: Text('data')),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'KM',
                              style: appThemeText5,
                            ),
                            Container(
                              height: 25,
                              width: 45,
                              color: whiteC,
                              child: Center(child: Text('data')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: height * 0.08,
                  width: width,
                  decoration: BoxDecoration(
                      color: lightBC,
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                      border: Border.all(width: 0.7, color: whiteC)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'RATE',
                              style: appThemeText5,
                            ),
                            Text(
                              'data',
                              style: appThemeText5,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              paymentContainer(
                text: 'VIA QPAY',
              ),
              paymentContainer(text: 'PAY LATE'),
              paymentContainer(text: 'VIA SOCIALPAY'),
              paymentContainer(text: 'VIA QCOIN'),
              paymentContainer(text: 'VIA VISA MASTERCARD'),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 70,
                width: 90,
                color: whiteC,
                child: Center(
                  child: QrImage(
                    data: "1234567890",
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 20,
                width: width * 0.44,
                // color: blueC,
                child: StatusStepper(
                  connectorCurve: Curves.easeIn,
                  itemCurve: Curves.easeOut,
                  activeColor: Colors.amber,
                  disabledColor: whiteC,
                  animationDuration: const Duration(milliseconds: 500),
                  children: statuses,
                  lastActiveIndex: lastIndex,
                  currentIndex: curIndex,
                  connectorThickness: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class paymentContainer extends StatelessWidget {
  String text;
  paymentContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
      child: Container(
        height: height * 0.07,
        width: width,
        decoration: BoxDecoration(
          color: lightBC,
          borderRadius: BorderRadius.circular(
            5.0,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                text,
                style: appThemeText5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
