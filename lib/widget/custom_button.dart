import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double padding;
  final TextStyle? textStyle;
  final EdgeInsets? customPadding;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = Colors.blueAccent,
      this.textColor = Colors.white,
      this.borderRadius = 10.0,
      this.padding = 16.0,
      this.textStyle,
      this.customPadding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          customPadding ?? EdgeInsets.all(padding),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              color: textColor,
              fontSize: 15,
            ),
      ),
    );
  }
}
