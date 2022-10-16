import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:spajam2022/components/button/index.dart';
import 'package:spajam2022/screens/result/index.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PrepareView extends StatefulWidget {
  @override
  State<PrepareView> createState() => _PrepareViewState();
}

class _PrepareViewState extends State<PrepareView> {
  File? image;
  final picker = ImagePicker();
  bool isVisible = false;

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(pickedFile!.path);
    });
  }

  /* ボタンがタップされた時の処理 */
  Future handleClick(String title, String imageURL, String message) async {
    setState(() {
      isVisible = true;
    });
    // 一旦3秒だけloading表示
    return Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultView(
            title,
            imageURL,
            message,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          Column(
            children: [
              const Spacer(),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                    '新しく作る思い出の登場人物を設定してください！',
                    style: TextStyle(
                      fontFamily: 'AniFont',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF212121),
                    ),
                  ),
                ),
              ),
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
                  handleClick(
                    'ずーーーっと、なかよし☺︎',
                    'assets/images/resultImage1.jpeg',
                    '海デートに行ったときの写真！\nこの後はしゃぎ過ぎて、\nふたりでびしょびしょになったよね笑',
                  );
                },
                onDoubleTap: () {
                  handleClick(
                    '制服の思い出🫶',
                    'assets/images/resultImage2.jpeg',
                    '学校帰りに撮ってもらった写真📷\n毎日一緒に帰るの、\n楽しかったなあ〜！',
                  );
                },
                child: Button('思い出作成！'),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Button('もどる'),
              ),
              const Spacer(),
            ],
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              color: const Color(0x55000000),
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  //この部分
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
          ),
        ],
      ),
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
      height: 180,
      // const(コンパイル定数)を定義できる
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: color.shade100, // Cardの背景色
        margin: const EdgeInsets.only(
          right: 30,
          left: 30,
          bottom: 40,
        ), // Cardの外側の余白を設定するオプション
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
                    color: Colors.grey.shade900,
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
