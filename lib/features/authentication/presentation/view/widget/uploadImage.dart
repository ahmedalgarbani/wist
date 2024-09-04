import 'package:flutter/material.dart';
import 'package:wist/core/widgets/main_button_designed.dart';

class UploadIDWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/image/idcard.png",
          width: 362,
          height: 201,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 70,
          left: 45,
          child: MainButtonDesign(
            ButtonContent: "Upload your personal id",
            width: 210,
            height: 61,
            fontsize: 16,
          ),
        ),
      ],
    );
  }
}