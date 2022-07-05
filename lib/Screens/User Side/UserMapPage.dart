import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as myPermission;
import 'package:qgo_application/Constants/ReusableWidgets.dart';
import 'package:qgo_application/Screens/User%20Side/ShareRidePage.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'dart:ui' as ui;

import '../../Constants/Constant.dart';
import '../../Constants/Utilities.dart';

class UserMapPage extends StatefulWidget {
  const UserMapPage({Key? key}) : super(key: key);

  @override
  State<UserMapPage> createState() => _UserMapPageState();
}

class _UserMapPageState extends State<UserMapPage> {
  String? _mapStyle;

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;
  Position? currentPosition;
  var geoLocator = Geolocator();

  final LatLng _initialcameraposition = const LatLng(24.8974834, 67.0775689);
  GoogleMapController? _controller;
  myPermission.PermissionStatus? permissionStatus;
  final Location _location = Location();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  int _markerIdCounter = 1;
  late BitmapDescriptor _markerIcon;

  late GoogleMapController mapController;

  var availability = false;
  var notifications = false;
  var _itemCount = 0.obs;
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              size: 23,
            ),
            onTap: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: Container(
              child: Text(
            'QGO'.tr,
            style: appThemeText3,
          )),
          iconTheme: IconThemeData(
            size: IconsSize,
            color: whiteC,
          ),
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
        endDrawer: myDrawer(),
        body: Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition),
              myLocationEnabled: false,
              zoomGesturesEnabled: true,
              onMapCreated: _onMapCreated,
              markers: Set<Marker>.of(markers.values),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 75.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchContainer(_height),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BottomContainer(_width),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Material BottomContainer(double _width) {
    void openDialog() {
      Get.dialog(
        AlertDialog(
          alignment: Alignment.bottomCenter,
          title: const Text('Dialog'),
          content: const Text('This is a dialog'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text("Chat"),
                  onPressed: () => Get.back(),
                ),
                TextButton(
                  child: const Text("Call"),
                  onPressed: () => Get.back(),
                ),
                TextButton(
                  child: const Text("Cancel Ride"),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Material(
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        overflow: Overflow.visible,
        children: <Widget>[
          Column(
            children: [
              Container(
                height: 60,
                width: _width,
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
            ],
          ),
          Positioned(
              top: -20,
              left: 10,
              child: WhiteContainer(height: 35, width: 85, text: 'HOME'.tr)),
          Positioned(
              top: -20,
              left: 100,
              child: WhiteContainer(height: 35, width: 85, text: 'OTHER'.tr)),
          Positioned(
              top: -20,
              right: 100,
              child: WhiteContainer(height: 35, width: 85, text: 'WORK'.tr)),
          Positioned(
              top: -20,
              right: 10,
              child: GestureDetector(
                child:
                    WhiteContainer(height: 35, width: 85, text: 'Schedule'.tr),
                onTap: () {},
              )),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SlidingUpPanel(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
              panel: Center(child: PanelBody()),
              minHeight: 30,
              maxHeight: 370,
              // header: Container(
              //   height: 2,
              //   width: 99,
              //   color: blackC,
              // ),
            ),
          ),
        ],
      ),
    );
  }

  Widget PanelBody() => Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 2,
              width: 99,
              color: blackC,
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your driver is coming in'.tr,
                  style: smallappThemeText4,
                ),
                Text(
                  ' 5 mints',
                  style: smallappThemeText4,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                      height: 70,
                      width: double.infinity,
                      color: Colors.black12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 50,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Fare'.tr,
                                    style: smallappThemeText4,
                                  ),
                                  Text(
                                    '200 mn',
                                    style: smallappThemeText4,
                                  )
                                ],
                              )),
                          VerticalDivider(
                            indent: 10,
                            endIndent: 10,
                            thickness: 2,
                          ),
                          Container(
                              height: 50,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Status'.tr,
                                    style: smallappThemeText4,
                                  ),
                                  Text(
                                    'Single',
                                    style: smallappThemeText4,
                                  )
                                ],
                              )),
                          VerticalDivider(
                            indent: 10,
                            endIndent: 10,
                            thickness: 2,
                          ),
                          Container(
                              height: 50,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Distance'.tr,
                                    style: smallappThemeText4,
                                  ),
                                  Text(
                                    '2 km',
                                    style: smallappThemeText4,
                                  )
                                ],
                              )),
                        ],
                      )),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                    height: 60,
                                    image: AssetImage('assets/images/car.png')),
                                Text(
                                  'Honda Civic',
                                  style: appThemeText,
                                ),
                                Text(
                                  'White. 7916',
                                  style: appThemeText,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                                height: 100,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      child: CircleAvatar(
                                        radius: 70.0,
                                        child: ClipOval(
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/driver.jpg'),
                                            fit: BoxFit.cover,
                                            width: 120.0,
                                            height: 120.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'John Karter',
                                      style: appThemeText,
                                    ),
                                    RatingBar.builder(
                                      itemSize: 20,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 2.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          slideupButton(
                            height: 40,
                            width: 110,
                            text: 'Chat'.tr,
                          ),
                          slideupButton(
                              height: 40, width: 110, text: 'Call'.tr),
                          slideupButton(
                              height: 40, width: 110, text: 'Cancel Ride'.tr),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  SearchContainer(double _height) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: _height * 0.2,
      width: _width,
      color: whiteC,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    hintText: 'Search Location'.tr,
                    icon: const Icon(Icons.mic),
                    prefixIcon: const Icon(Icons.menu),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff3d3d5c),
                                Color.fromARGB(255, 22, 76, 128)
                              ],
                            )),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _itemCount--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 16,
                                )),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white),
                              child: Text(
                                _itemCount.toString(),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _itemCount++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      ToggleSwitch(
                        minWidth: 62.0,
                        minHeight: 40.0,
                        initialLabelIndex: 1,
                        cornerRadius: 10.0,
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey[400],
                        inactiveFgColor: Colors.white,
                        totalSwitches: 3,
                        labels: ['Share'.tr, 'Single'.tr, 'VIP'.tr],
                        iconSize: 30.0,
                        activeBgColors: const [
                          [Color(0xff3d3d5c), Color.fromARGB(255, 22, 76, 128)],
                          [Color(0xff3d3d5c), Color.fromARGB(255, 22, 76, 128)],
                          [Color(0xff3d3d5c), Color.fromARGB(255, 22, 76, 128)],
                        ],
                        onToggle: (index) {
                          print('switched to: $index');
                          if (index == 0) {
                            Get.to(ShareRidePage());
                          } else if (index == 1) {
                            Get.to(UserMapPage());
                          }
                        },
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      ToggleSwitch(
                        minWidth: 40.0,
                        minHeight: 40,
                        initialLabelIndex: 0,
                        cornerRadius: 7.0,
                        activeBgColors: [
                          [Color(0xff3d3d5c), Color.fromARGB(255, 22, 76, 128)],
                          [Color(0xff104c84), Color(0xff3d3d5c)],
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey[400],
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        icons: [
                          FontAwesomeIcons.person,
                          FontAwesomeIcons.personDress
                        ],
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onMapCreated(GoogleMapController _cntlr) async {
    _controller = _cntlr;
    _controller!.setMapStyle(_mapStyle);

    await myPermission.Permission.location.request();
    permissionStatus = await myPermission.Permission.location.status;
    print("this is status of permission $permissionStatus");

    if (permissionStatus!.isGranted) {
      final post = await _location.getLocation();
      print("this is the lat and long $post");
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(post.latitude!, post.longitude!),
            zoom: 18,
          ),
        ),
      );
      createMarker(post.latitude!, post.longitude!);
    } else {
      permissionDeniedMethod(
        context,
        "Location",
      );
    }
  }

  createMarker(double latitude, double longitude) async {
    String markerPath = "assets/images/driver_pin.png";
    final Uint8List markerIcon = await getBytesFromAsset(markerPath, 130);

    _markerIcon = BitmapDescriptor.fromBytes(markerIcon);

    _markerIdCounter++;
    final MarkerId markerId = MarkerId(_markerIdCounter.toString());

    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(latitude, longitude),
        icon: _markerIcon,
        onTap: () {});

    print("hello");
    setState(() {
      markers[markerId] = marker;
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void setMarkerIcon() async {
    String markerPath = "assets/images/driver_pin.png";

    final Uint8List markerIcon = await getBytesFromAsset(markerPath, 120);
    _markerIcon = BitmapDescriptor.fromBytes(markerIcon);
  }
}
