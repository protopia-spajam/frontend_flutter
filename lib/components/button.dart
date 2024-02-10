import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String value;
  const Button(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: () {},
    //   child: Text('button'),
    // );
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      width: 200,
      height: 60,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.grey.shade300, // Cardの
        // margin: const EdgeInsets.all(30), // Cardの外側の余白を設定するオプション
        elevation: 2, // 影の離れ具合を調整するオプション
        shadowColor: Colors.black, // 影の色を設定するオプション
        child: Center(
          child: Text(value,
              style: TextStyle(
                fontFamily: 'AniFont',
                fontSize: 22,
                color: Colors.grey.shade900,
              )),
        ),
      ),
    );
  }
}
