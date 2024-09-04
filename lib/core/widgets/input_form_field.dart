import 'package:flutter/material.dart';
import 'package:wist/core/constants/constant_value.dart';

class InputFormField extends StatelessWidget {
  const InputFormField({
    Key? key,
    required this.inputContent,
    this.prefixIcon,
    this.onChanged,
    this.suffixIcon,
    this.type,
  }) : super(key: key);

  final String inputContent;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextInputType? type;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      onChanged: onChanged ,
      keyboardType:type?? TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: kPrimaryColor,
        hintText: inputContent,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }
}
