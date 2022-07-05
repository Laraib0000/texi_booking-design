import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:qgo_application/Constants/Constant.dart';

import '../../Constants/ReusableWidgets.dart';

// ignore: must_be_immutable
class PickupDropofLocationPage extends StatefulWidget {
  String? startAddress;

  PickupDropofLocationPage({Key? key, this.startAddress}) : super(key: key);
  @override
  _PickupDropofLocationPageState createState() =>
      _PickupDropofLocationPageState();
}

class _PickupDropofLocationPageState extends State<PickupDropofLocationPage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: whiteC),
        elevation: 0,
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
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchContainer(_height),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SearchContainer(double _height) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    // ignore: sized_box_for_whitespace
    return Container(
      height: _height * 0.27,
      width: _width,
      // color: whiteC,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  height: 110,
                  // width: 25,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 15,
                                  width: 25,
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
                                  color: whiteC,
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                const Icon(
                                  Icons.place,
                                  color: redC,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 115,
                  width: _width / 1.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField(
                        hintText: 'Pickup Location'.tr,
                        icon: null,
                        prefixIcon: null,
                      ),
                      CustomTextField(
                        hintText: 'Dropoff Location'.tr,
                        icon: null,
                        prefixIcon: null,
                      ),
                    ],
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
