import 'package:flutter/material.dart';
class LoginTitle extends StatelessWidget {
  const LoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 5),
      child: Text(
        "LOGIN",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 26,
          fontFamily: "Inter",
        ),
      ),
    );
  }
}