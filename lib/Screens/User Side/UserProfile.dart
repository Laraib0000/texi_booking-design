import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qgo_application/Constants/Constant.dart';
import 'package:qgo_application/Constants/ReusableWidgets.dart';

import 'EditProfilePage.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0),
        elevation: 0,
        iconTheme: IconThemeData(color: blackC),
      ),
      body: Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   stops: [
            //     0.10,
            //     0.35,
            //     0.56,
            //     0.90,
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     Color(0xFF383b45),
            //     Color(0xFF21304b),
            //     Color(0xFF091845),
            //     Color(0xFF62688c),
            //   ],
            // ),
            ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Edit Profile'.tr,
                    style: smallappThemeText4,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: redC,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 10,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              image:
                                  // image == null ?
                                  AssetImage('assets/images/profile.jpg'),
                              fit: BoxFit.cover
                              //  : Image.file(File(image!.path)),
                              )),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 4, color: whiteC),
                                  color: Colors.green,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.edit,
                                color: whiteC,
                                size: 17,
                              )),
                          onTap: () {
                            filePicker();
                          },
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(EditProfile());
                  },
                  child: CustomButtons(
                      inputText: 'Edit Profile'.tr, height: 40, width: 200),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    child: Column(
                      children: [
                        EditProfileContainer(text: 'Joseph'),
                        const SizedBox(
                          height: 10.0,
                        ),
                        EditProfileContainer(text: 'Phone Number'),
                        const SizedBox(
                          height: 10.0,
                        ),
                        EditProfileContainer(text: 'Home Address'),
                        const SizedBox(
                          height: 10.0,
                        ),
                        EditProfileContainer(text: 'Mail@gmail.com'),
                        const SizedBox(
                          height: 10.0,
                        ),
                        EditProfileContainer(text: 'Password')
                      ],
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

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  void filePicker() async {
    final XFile? selectImage =
        await _picker.pickImage(source: ImageSource.gallery);
    print(selectImage!.path);
    setState(() {
      image = selectImage;
    });
  }
}
