import 'package:flutter/material.dart';


class RectangleButton extends StatelessWidget {
  const RectangleButton({
    Key? key,
    required this.width,
    required this.buttonTitle,
    required this.buttonColor,
    required this.pressed,
  }) : super(key: key);

  final double width;
  final String buttonTitle;
  final Color buttonColor;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width - 32,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.white, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(4))),
        onPressed: pressed,
        child: Text(
          buttonTitle,
        ),
      ),
    );
  }
}
