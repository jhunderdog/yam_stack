
import 'package:flutter/material.dart';


class UnderLineButton extends StatelessWidget {
  final String buttonTitle;
  final Color buttonColor;
  final VoidCallback pressed;


  const UnderLineButton({
    Key? key,
    required this.buttonTitle,
    required this.buttonColor,
    required this.pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(),
        onPressed: pressed,
        child: Text(buttonTitle,
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: buttonColor)));
  }
}