import 'package:flutter/material.dart';
import 'package:spajam2022/utils/style.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key});

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
      child: const Stack(
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
  final double size;
  final double x;
  final double y;
  final Color color;
  const Circle(this.size, this.x, this.y, this.color, {super.key});

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
