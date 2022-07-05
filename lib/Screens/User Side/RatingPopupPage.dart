import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qgo_application/Constants/Constant.dart';

class RatingPopupPage extends StatefulWidget {
  RatingPopupPage({Key? key}) : super(key: key);

  @override
  State<RatingPopupPage> createState() => _RatingPopupPageState();
}

class _RatingPopupPageState extends State<RatingPopupPage> {
  final kGradientBoxDecoration = BoxDecoration(
    gradient: const LinearGradient(colors: [Colors.pink, Colors.redAccent]),
    border: Border.all(
      color: blackC,
    ),
    borderRadius: BorderRadius.circular(32),
  );
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: whiteC),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 230, 230, 150),
              Color.fromARGB(255, 10, 6, 129)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: height / 2.7,
                  width: width,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 180,
                        left: 75,
                        child: Container(
                          width: 250,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: lightBC,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Text(
                                'D. Batsaikhan',
                                style: appThemeText1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 100,
                        child: Container(
                            height: 200,
                            width: 200,
                            decoration: kGradientBoxDecoration,
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(48),
                                  child: Image.asset('assets/images/driver.jpg',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: width,
                  child: Column(
                    children: [
                      RatingBar.builder(
                        itemSize: 30,
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ratingContainer(
                                    containerHeight: height * 0.07,
                                    containerWidth: width * 0.36,
                                    text: 'Arrived Quickly'),
                                ratingContainer(
                                    containerHeight: height * 0.07,
                                    containerWidth: width * 0.36,
                                    text: 'Good Conversation'),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ratingContainer(
                                    containerHeight: height * 0.07,
                                    containerWidth: width * 0.36,
                                    text: 'Nice Car'),
                                ratingContainer(
                                    containerHeight: height * 0.07,
                                    containerWidth: width * 0.36,
                                    text: 'Clean & Neat'),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ratingContainer(
                                    containerHeight: height * 0.07,
                                    containerWidth: width * 0.36,
                                    text: 'Good Music'),
                                ratingContainer(
                                    containerHeight: height * 0.07,
                                    containerWidth: width * 0.36,
                                    text: 'Dirty'),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              minLines: 5,
                              maxLines: 5,
                              decoration: InputDecoration(
                                fillColor: Colors.white30,
                                filled: true,
                                hintText: 'Write Review',
                                hintStyle: appThemeText1,
                                border: InputBorder.none,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            ratingContainer(
                                containerHeight: 40,
                                containerWidth: 140,
                                text: 'Send')
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ratingContainer extends StatelessWidget {
  double containerHeight;
  double containerWidth;
  String text;
  ratingContainer(
      {Key? key,
      required this.containerHeight,
      required this.containerWidth,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: whiteC)),
      child: Center(
        child: Text(
          text,
          style: appThemeText2,
        ),
      ),
    );
  }
}
