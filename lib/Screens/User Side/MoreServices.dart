import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:qgo_application/Constants/Constant.dart';
import 'package:qgo_application/Constants/ReusableWidgets.dart';

class MoreServices extends StatefulWidget {
  MoreServices({Key? key}) : super(key: key);

  @override
  State<MoreServices> createState() => _MoreServicesState();
}

class _MoreServicesState extends State<MoreServices> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent.withOpacity(0),
        elevation: 0,
        iconTheme: const IconThemeData(color: whiteC),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            stops: [
              0.10,
              0.35,
              0.56,
              0.90,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF383b45),
              Color(0xFF21304b),
              Color(0xFF091845),
              Color(0xFF62688c),
            ],
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Services',
                  style: const TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                topContainer(height, width),
                middleContainer(height, width),
                bottomController(height, width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Q',
                      style: const TextStyle(
                          color: const Color(0xFFE91E63),
                          fontSize: 40,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Myriad-Pro'),
                    ),
                    const Text(
                      'GO TRAVEL',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 26,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Myriad-Pro'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container bottomController(double height, width) {
    return Container(
      height: height / 3.3,
      child: Expanded(
          child: ServicesContainer(
              height: height,
              width: width,
              text: Text(
                'MONGLIA' + '\n' 'NOW OPEN!',
                style: appThemeText5,
              ),
              image: const DecorationImage(
                  image: AssetImage('assets/images/mongolia.jpeg'),
                  fit: BoxFit.cover))),
    );
  }

  Container middleContainer(double height, width) {
    return Container(
      height: height / 3.3,
      child: Expanded(
          child: ServicesContainer(
              height: height,
              width: width,
              text: Text(
                'Car Rental',
                style: appThemeText5,
              ),
              image: const DecorationImage(
                  image: AssetImage('assets/images/carRental.jpeg'),
                  fit: BoxFit.cover))),
    );
  }

  Widget topContainer(double height, width) {
    return Container(
      height: height / 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ServicesContainer(
                  height: height * 0.13,
                  width: width * 0.46,
                  text: Text(
                    'DELIVERY',
                    style: appThemeText5,
                  ),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/delivery.jpg'),
                      fit: BoxFit.cover)),
              Expanded(
                child: ServicesContainer(
                    height: height * 0.13,
                    width: width * 0.46,
                    text: Text(
                      'VIP',
                      style: appThemeText5,
                    ),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/vip.jpg'),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
          Expanded(
            child: ServicesContainer(
                height: height,
                width: width / 4,
                text: Text(
                  'SCHAFFUER',
                  style: appThemeText5,
                ),
                image: const DecorationImage(
                    image: AssetImage('assets/images/myDriver.jpg'),
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}
