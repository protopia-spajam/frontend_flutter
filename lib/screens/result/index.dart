import 'package:flutter/material.dart';
import 'package:spajam2022/components/button/index.dart';

class ResultView extends StatelessWidget {
  String title = '';
  String imageURL = '';
  String message = '';
  ResultView(
    String title,
    String imageURL,
    String message,
  ) {
    this.title = title;
    this.imageURL = imageURL;
    this.message = message;
  }

  // 投稿の部分
  Widget _buildPost(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        height: 560.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            height: 50.0,
                            width: 50.0,
                            image: AssetImage('assets/images/icon.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('5分前'),
                    trailing: IconButton(
                      icon: Icon(Icons.more_horiz),
                      color: Colors.black,
                      onPressed: () => print('More'),
                    ),
                  ),
                  InkWell(
                    onDoubleTap: () => print('Like post'),
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      width: double.infinity,
                      height: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage(imageURL),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  iconSize: 30.0,
                                  onPressed: () => print('Like post'),
                                ),
                                Text(
                                  '2,515',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.chat),
                                  iconSize: 30.0,
                                  onPressed: () {},
                                ),
                                Text(
                                  '350',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          iconSize: 30.0,
                          onPressed: () => print('Save post'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Katteni Omoide Maker',
                  style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 32.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.live_tv),
                      iconSize: 30.0,
                      onPressed: () => print('IGTV'),
                    ),
                    SizedBox(width: 16.0),
                    Container(
                      width: 35.0,
                      child: IconButton(
                        icon: Icon(Icons.send),
                        iconSize: 30.0,
                        onPressed: () => print('Direct Messages'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          _buildPost(0),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
                right: 5,
                bottom: 20,
                left: 5,
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontFamily: 'AniFont',
                  fontSize: 23,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: () {
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 2);
                },
                child: Button('ホームにもどる'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
