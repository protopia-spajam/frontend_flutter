import 'package:flutter/material.dart';
import 'screens/prepare/index.dart';
import 'screens/result/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '勝手に思い出メーカー',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResultView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image.asset('assets/images/logo.png'),
              ),
              mode_select_button("恋人モード", "過去に好きだった人と\n付き合いませんか？",
                  "https://d3cmdai71kklhc.cloudfront.net/post_watermark/marketplace/23717/mp_20161011-130104721_i3hut.jpg"),
              mode_select_button("友達・家族モード", "友達・家族との楽しい思い出を\n作りませんか？",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8rTuqMVFww1hBVW2HRZ90E9RId2o_t3znQw&usqp=CAU"),
            ],
          )),
        ));
  }
}

class mode_select_button extends StatelessWidget {
  String mode_name = "";
  String description = "";
  String url = "";
  mode_select_button(String mode_name, String description, String url) {
    this.mode_name = mode_name;
    this.description = description;
    this.url = url;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 300,
      // const(コンパイル定数)を定義できる
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white, // Cardの背景色
        margin: const EdgeInsets.all(30), // Cardの外側の余白を設定するオプション
        elevation: 2, // 影の離れ具合を調整するオプション
        shadowColor: Colors.black, // 影の色を設定するオプション
        child: Row(
          children: <Widget>[
            Image.network(this.url),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text("$mode_name",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  Text("$description",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
