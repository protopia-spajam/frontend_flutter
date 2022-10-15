import 'package:flutter/material.dart';

class PrepareView extends StatelessWidget {
  const PrepareView({Key? key}) : super(key: key);

  void post() {
    /* ボタンがタップされた時の処理 */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            post();
          },
          child: Text('click here'),
        ),
      ),
    );
  }
}
