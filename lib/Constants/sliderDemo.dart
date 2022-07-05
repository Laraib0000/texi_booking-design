import 'package:flutter/material.dart';
import 'package:simple_drawer/simple_drawer.dart';

class sliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    {
      // set one simpleDrawer sliding in from the bottom
      Widget bottomSimpleDrawer = SimpleDrawer(
        child: Container(
          // round the corners & set color
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.green,
          ),
          width: MediaQuery.of(context).size.width,
          height: 300,
        ),
        childHeight: 300,
        direction: Direction.bottom,
        id: "bottom",
      );

      return Scaffold(
        body: Stack(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    SimpleDrawer.activate("bottom");
                  },
                  child: Text("bottom")),
            ),
            bottomSimpleDrawer,
          ],
        ),
      );
    }
  }
}
