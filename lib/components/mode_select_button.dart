import 'package:flutter/material.dart';
import 'package:spajam2022/screens/prepare.dart';

//恋人モードか友達・家族モードを選ぶ際のカードレイアウト
class ModeSelectButton extends StatelessWidget {
  final String modeName;
  final String description;
  final String url;
  const ModeSelectButton(this.modeName, this.description, this.url,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 520,
        height: 200,
        // const(コンパイル定数)を定義できる
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white, // Cardの背景色
          margin: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 30,
          ), // Cardの外側の余白を設定するオプション
          elevation: 2, // 影の離れ具合を調整するオプション
          shadowColor: Colors.black, // 影の色を設定するオプション
          child: Row(
            children: <Widget>[
              Image.asset(
                url,
                width: 170,
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(modeName,
                        style: const TextStyle(
                          fontFamily: 'AniFont',
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        description,
                        style: TextStyle(
                            fontFamily: 'AniFont',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey.shade600),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PrepareView()));
      },
    );
  }
}
