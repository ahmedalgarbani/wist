import 'package:flutter/material.dart';
class LoginImage extends StatelessWidget {
  const LoginImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/image/login.png",
      fit: BoxFit.fill,
      height: 200,
      width: 250,
    );
  }
}