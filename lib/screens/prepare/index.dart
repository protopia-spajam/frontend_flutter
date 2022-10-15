import 'package:flutter/material.dart';

class PrepareView extends StatelessWidget {
  const PrepareView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 46,
          width: 46,
          child: InkWell(
            onTap: () {},
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
        ),
      ),
    );
  }
}
