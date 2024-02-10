///HomeView
///HomeViewではユーザーが恋人モードか友達・家族モードを選択することができる

import 'package:flutter/material.dart';
import 'package:spajam2022/components/mode_select_button.dart';
import 'package:spajam2022/components/background.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGround(),
          SingleChildScrollView(
            child: Column(
              children: [
                // Spacer(),
                Container(
                  margin: const EdgeInsets.only(
                    top: 100,
                    bottom: 15,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    scale: .9,
                  ),
                ),
                const ModeSelectButton("恋人モード", "過去に好きだった人と勝手に付き合いませんか？",
                    "assets/images/love.jpeg"),
                const ModeSelectButton("友達・家族モード", "友達・家族との楽しい思い出を作りませんか？",
                    "assets/images/family.jpeg"),
                // Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
