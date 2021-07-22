import 'package:flutter/material.dart';


class RectangleButton extends StatelessWidget {
  const RectangleButton({
    Key? key,
    this.height = 48,
    required this.width,
    required this.buttonTitle,
    required this.buttonColor,
    required this.pressed,
    required this.textStyle ,
    this.borderRadius = 4,
    this.elevationWidth = 1.0
  }) : super(key: key);

  final double width;
  final double height;
  final String buttonTitle;
  final Color buttonColor;
  final VoidCallback pressed;
  final double borderRadius;
  final TextStyle textStyle;
  final double elevationWidth;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.white, width: elevationWidth, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(borderRadius))),
        onPressed: pressed,
        child: Text(buttonTitle, textAlign: TextAlign.center, style: textStyle,
        ),
      ),
    );
  }
}