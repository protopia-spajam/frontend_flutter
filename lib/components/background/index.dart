import 'package:flutter/material.dart';
import 'package:spajam2022/utils/style.dart';

class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [
            kColorOrange.withOpacity(0.4),
            kColorCyan.withOpacity(0.9),
          ],
          stops: const [
            0.0,
            1.0,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Circle(size.width, 0, 0, kColorWhite),
          Circle(125, 40, 90, kColorRed),
          Circle(80, 100, 300, kColorOrange),
          Circle(90, 230, 135, kColorYellow),
          Circle(110, 250, 240, kColorBlue),
        ],
      ),
    );
  }
}

class Circle extends StatelessWidget {
  double size = 0;
  double x = 0;
  double y = 0;
  Color color = Color(0xffffffff);
  Circle(
    double size,
    double x,
    double y,
    Color color,
  ) {
    this.size = size;
    this.x = x;
    this.y = y;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: y,
        left: x,
      ),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
