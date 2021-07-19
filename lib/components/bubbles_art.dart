import 'package:flutter/material.dart';
import 'package:job_app/constants.dart';

class BubblesArt extends StatelessWidget {
  double size;

  BubblesArt({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: -20,
            child: Container(
              width: size * 0.7,
              height: size * 0.7,
              decoration:
                  BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            right: 0,
            top: -7,
            child: Container(
              width: size * 0.5,
              height: size * 0.5,
              decoration:
                  BoxDecoration(color: kAccentColor, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              width: size * 0.35,
              height: size * 0.35,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            bottom: size / 3.2,
            right: size * 0.15,
            child: Container(
              width: size * 0.2,
              height: size * 0.2,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
