import 'package:flutter/material.dart';
import 'package:qgo_application/Constants/ReusableWidgets.dart';

import '../../Constants/Constant.dart';

class HelpCenterPage extends StatefulWidget {
  HelpCenterPage({Key? key}) : super(key: key);

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HELP CENTER',
          style: appThemeText,
        ),
        backgroundColor: lightGreyC,
        iconTheme: IconThemeData(color: blackC),
        elevation: 0,
      ),
      body: Container(
        color: lightGreyC,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.11,
                width: width,
                // color: blueC,
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            CustomButtons(inputText: 'PAYMENT', height: 40, width: 200),
            SizedBox(
              height: 20.0,
            ),
            Text('VIDEO ADVICE'),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  listviewContainer(
                      image: AssetImage('assets/images/mongolia.jpeg')),
                  listviewContainer(
                      image: AssetImage('assets/images/driver.jpg')),
                  listviewContainer(
                      image: AssetImage('assets/images/mongolia.jpeg')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan t, odio ultricies imperdiet aliquet, risus justo varius mauris, sit amet ornare ante elit  nibh.'),
            ),
            Spacer(),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 3,
              // color: blueC,
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: 27,
                  ),
                  Text(
                    '1800-4545',
                    style: appThemeText,
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

class listviewContainer extends StatelessWidget {
  dynamic image;
  listviewContainer({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, left: 10.0),
      child: Container(
          height: 80,
          width: 260,
          child: Center(
            child: Image(
              image: image,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
