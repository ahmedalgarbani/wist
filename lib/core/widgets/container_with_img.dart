import 'package:flutter/material.dart';
import 'package:wist/core/constants/constant_value.dart';

class ContainerWithImg extends StatelessWidget {
  const ContainerWithImg(
      {super.key,
      this.width,
      this.height,
       this.ContainerContent,
       this.space,
       this.onPressed,
      required this.icon,
      this.fontsize});
  final String? ContainerContent;
  final double? width;
  final double? height;
  final double? fontsize;
  final MainAxisAlignment? space;
  final IconData icon;
    final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60,
      width: width ?? 363,
      child: IconButton(
        onPressed: onPressed,
        icon: Row(
          mainAxisAlignment: space??MainAxisAlignment.spaceAround,
          children: [
          Icon(icon,color: Colors.white),
            Text(
              ContainerContent??"",
              style: TextStyle(
                color: Colors.white,
                fontSize: fontsize ?? 20,
                fontWeight: FontWeight.w700
              ),
            ),
          ],
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
