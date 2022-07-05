// ignore_for_file: file_names, deprecated_member_use

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:permission_handler/permission_handler.dart';

permissionDeniedDialog(BuildContext dialogContext, Animation<double> animation,
    Animation<double> secondaryAnimation, String permissionName) {
  final screenSize = MediaQuery.of(dialogContext).size;
  return WillPopScope(
    onWillPop: () async => true,
    child: Scaffold(
      // backgroundColor: hexToColor(popUpBackgroundColor),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: 190.0,
          width: screenSize.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "😟",
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  '$permissionName Permission Needed!',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "Looks like you haven't granted the $permissionName permission yet. Please grant the $permissionName permission from settings.",
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0),
                ),
                GestureDetector(
                  onTap: () async {
                    bool isOpened = await openAppSettings();
                    isOpened ? Navigator.pop(dialogContext) : null;

                    // gotoPlayStoreAndMoveToHome(dialogContext, true);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(dialogContext).size.width * 0.3,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      'Open Settings',
                      style: TextStyle(
                        // color: hexToColor(primaryColor),
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

permissionDeniedMethod(context, String permissionName) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (
      dialogContext,
      animation,
      secondaryAnimation,
    ) =>
        permissionDeniedDialog(
            dialogContext, animation, secondaryAnimation, permissionName),
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(anim1),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}

Future<Future> showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  String? cancelActionText,
  required String defaultActionText,
}) async {
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if (cancelActionText != null)
            FlatButton(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          FlatButton(
            child: Text(defaultActionText),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }

  // todo : showDialog for ios
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        CupertinoDialogAction(
          child: Text(defaultActionText),
          onPressed: () async {
            bool isOpened = await openAppSettings();
            isOpened ? Navigator.pop(context) : null;
          },
        ),
      ],
    ),
  );
}

Future<Object> checkInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return Future.value(true);
    }
  } on SocketException catch (_) {
    return Future.value(false);
  }
  return const Text('data');
}

noInternetConnectionMethod(context,
    {required bool double, required bool endRide}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (
      dialogContext,
      animation,
      secondaryAnimation,
    ) =>
        noInternetDialog(dialogContext, animation, secondaryAnimation,
            double: double, endRide: endRide),
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(anim1),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}

noInternetDialog(BuildContext dialogContext, Animation<double> animation,
    Animation<double> secondaryAnimation,
    {required bool double, required bool endRide}) {
  final screenSize = MediaQuery.of(dialogContext).size;
  return Scaffold(
    backgroundColor: Colors.transparent,
    body: Align(
      alignment: Alignment.center,
      child: Container(
        height: 180.0,
        width: screenSize.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "😟",
                style: TextStyle(fontSize: 30.0),
              ),
              const Text(
                'No Internet Connection',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const Text(
                'Please check your connection and then try again.',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.pop(dialogContext);
                  endRide
                      ? SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop')
                      : double
                          ? Navigator.pop(dialogContext)
                          : null;
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(dialogContext).size.width * 0.3,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1),
                  ),
                  child: const Text(
                    'OKAY',
                    style: TextStyle(
                      // color: hexToColor(primaryColor),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

showEasyloaging() async {
  await EasyLoading.show(
    status: ' ',
    maskType: EasyLoadingMaskType.black,
  );
}

hideEasyLoading() async {
  await EasyLoading.dismiss();
}
