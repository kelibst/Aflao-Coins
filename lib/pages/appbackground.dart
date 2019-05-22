import 'package:flutter/material.dart';
import 'package:aflacoins_updated/colors.dart';

class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint){
        final height = constraint.maxHeight;
        final width = constraint.maxWidth;

        return  Stack(
          children: <Widget>[
            Container(
              color: backgroundColor,
            ),
            Positioned(
              left: -(height/2 - width/2),
            bottom: height * 0.25,
              child: Container(
                height: height,
                width: height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: firstCircleColor,
                ),
              ),
            ),
            Positioned(
              left: width * 0.15,
              top: -width * 0.5,
              child: Container(
                height: width * 1.2,
                width: width * 1.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondCircleColor,
                ),
              ),
            ),
            Positioned(
              left: width * 0.7,
              top: -width * 0.3,
              child: Container(
                height: width * 0.6,
                width: width * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: thirdCircleColor,
                ),
              ),
            )
          ],
        );
      });
    }
}
