import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  const CustomText({
    super.key,
    required this.text,
    required this.size,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: size, fontWeight: fontWeight));
  }
}
