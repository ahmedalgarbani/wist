import 'package:flutter/material.dart';
import 'package:wist/core/constants/constant_value.dart';

class SelectFormField extends StatelessWidget {
  final String inputContent;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final ValueChanged<int?>? onChanged;
  final List<Map<String, dynamic>> items;
  final int? value;

  const SelectFormField({
    Key? key,
    required this.inputContent,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    required this.items,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: value,
      onChanged: (int? newValue) {
        if (newValue != null) {
          onChanged?.call(newValue);
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFFF3F3F),
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
      items: items.map((Map<String, dynamic> item) {
        return DropdownMenuItem<int>(
          value: item['value'] as int,
          child: Text(
            item['label'] as String,
            style: const TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
      dropdownColor: Color(0xFFFF3F3F), 
    );
  }
}
