import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          children: [
            Spacer(),
            InkWell(
              child: men_women_select("男の子をえらぶ"),
              onTap: (){
                getImageFromGallery();
              },
            ),
            InkWell(
              child: men_women_select("女の子をえらぶ"),
              onTap: (){
                getImageFromGallery();
              },
            ),
            ElevatedButton(
              onPressed: () {

                },
              child: Text('思い出作成！'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("戻る"),
            ),
            Spacer(),
          ],
        )
      ),
    );
  }
}



class men_women_select extends StatelessWidget {
  String description = "";
  men_women_select(String description) {
    this.description = description;
  }
  @override
  Widget build(BuildContext context) {
    return

      SizedBox(

          width: 500,
          height: 200,
          // const(コンパイル定数)を定義できる
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.white, // Cardの背景色
            margin: const EdgeInsets.all(30), // Cardの外側の余白を設定するオプション
            elevation: 2, // 影の離れ具合を調整するオプション
            shadowColor: Colors.black, // 影の色を設定するオプション

            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30,bottom: 10),
                  child: Text("$description",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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