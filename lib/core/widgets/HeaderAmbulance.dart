import 'package:flutter/material.dart';

class HeaderAmbulance extends StatelessWidget {
  const HeaderAmbulance({super.key, required this.HeaderImage,required this.TitleString});
  final String HeaderImage;
  final String TitleString;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            child: Text(
              TitleString,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Image.asset(
          HeaderImage,
          width: 144,
          height: 88,
        ),
      ],
    );
  }
}
