///PrepareView
///変換したい画像(男，女)を選択する画面
///ボタンを押すと変換後画面に遷移する

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
  File? image2;
  final picker = ImagePicker();
  bool isVisible = false;

  //デバイスから画像を取得する（男の画像）
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(pickedFile!.path);
    });
  }
  //デバイスから画像を取得する（女の画像）
  Future getImageFromGallery2() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image2 = File(pickedFile!.path);
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
          Spacer(),
          InkWell(
            child: SizedBox(
              width: 500,
              height: image==null ? 180 : 220,
              // const(コンパイル定数)を定義できる
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: Colors.blue.shade100, // Cardの背景色
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
                      child: Text("男の子をえらぶ",
                          style: TextStyle(
                            fontFamily: 'AniFont',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey.shade800,
                          )),
                    ),
                    Container(
                        width: 120,
                        child: image == null
                            ? SizedBox(
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
                        )
                            : Image.file(image!)
                    ),

                  ],
                ),
              ),
            ),
            onTap: () {
              getImageFromGallery();
            },
          ),

          InkWell(
            child: SizedBox(
              width: 500,
              height: image2==null ? 180 : 220,
              // const(コンパイル定数)を定義できる
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: Colors.pink.shade100, // Cardの背景色
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
                      child: Text("女の子をえらぶ",
                          style: TextStyle(
                            fontFamily: 'AniFont',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey.shade800,
                          )),
                    ),
                    Container(
                        width: 120,
                        child: image2 == null
                            ? SizedBox(
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
                        )
                            : Image.file(image2!)
                    ),

                  ],
                ),
              ),
            ),
            onTap: () {
              getImageFromGallery2();
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
    );
  }
}

