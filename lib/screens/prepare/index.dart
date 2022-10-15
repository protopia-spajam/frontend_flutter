import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:spajam2022/components/button/index.dart';
import 'package:spajam2022/screens/result/index.dart';

class PrepareView extends StatefulWidget {
  @override
  State<PrepareView> createState() => _PrepareViewState();
}

class _PrepareViewState extends State<PrepareView> {
  File? image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(pickedFile!.path);
    });
  }

  void post() {
    /* ボタンがタップされた時の処理 */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
          child: Column(
        children: [
          Spacer(),
          InkWell(
            child: men_women_select("男の子をえらぶ", Colors.blue),
            onTap: () {
              getImageFromGallery();
            },
          ),
          InkWell(
            child: men_women_select("女の子をえらぶ", Colors.pink),
            onTap: () {
              getImageFromGallery();
            },
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultView(
                            'ずーーーっと、なかよし☺︎',
                            'assets/images/resultImage1.jpeg',
                            '海デートに行ったときの写真！\nこの後はしゃぎ過ぎて、\nふたりでびしょびしょになったよね笑',
                          )));
            },
            onDoubleTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultView(
                            'ずーーーっと、なかよし☺︎',
                            'assets/images/resultImage2.jpeg',
                            '海デートに行ったときの写真！\nこの後はしゃぎ過ぎて、\nふたりでびしょびしょになったよね笑',
                          )));
            },
            child: Button('思い出作成！'),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Button('もどる'),
          ),
          Spacer(),
        ],
      )),
    );
  }
}

class men_women_select extends StatelessWidget {
  String description = "";
  MaterialColor color = Colors.grey;
  men_women_select(String description, MaterialColor color) {
    this.description = description;
    this.color = color;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 200,
      // const(コンパイル定数)を定義できる
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: color.shade100, // Cardの背景色
        margin: const EdgeInsets.all(30), // Cardの外側の余白を設定するオプション
        elevation: 2, // 影の離れ具合を調整するオプション
        shadowColor: Colors.black, // 影の色を設定するオプション

        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 10),
              child: Text("$description",
                  style: TextStyle(
                    fontFamily: 'AniFont',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey.shade800,
                  )),
            ),
            SizedBox(
              height: 46,
              width: 46,
              child: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.grey.shade100,
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
