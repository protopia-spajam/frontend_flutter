import 'package:flutter/material.dart';
import 'package:spajam2022/utils/style.dart';

class Button extends StatelessWidget {
  String value = '';
  Button(String value) {
    this.value = value;
  }

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: () {},
    //   child: Text('button'),
    // );
    return Container(
      margin: EdgeInsets.only(
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
