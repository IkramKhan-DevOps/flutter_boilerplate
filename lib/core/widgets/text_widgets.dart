import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const HeadingWidget({
    super.key,
    required this.text,
    this.fontSize = 30,
    this.fontWeight = FontWeight.bold,
    this.color,
  });


  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Text(
      text,
      style: TextStyle(
        color: color ?? colors.secondary,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class SubHeadingWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const SubHeadingWidget({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
