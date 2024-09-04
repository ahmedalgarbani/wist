import 'package:flutter/material.dart';
import 'package:wist/core/constants/constant_value.dart';

class MainButtonDesign extends StatelessWidget {
  const MainButtonDesign(
      {super.key,
      this.width,
      this.height,
      this.onPressed,
      required this.ButtonContent,
      this.fontsize});
  final String ButtonContent;
  final double? width;
  final double? height;
  final double? fontsize;
  final Function()? onPressed;
    @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60,
      width: width ?? 363,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          ButtonContent,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontsize ?? 20,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(kPrimaryColor),
          padding: WidgetStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
