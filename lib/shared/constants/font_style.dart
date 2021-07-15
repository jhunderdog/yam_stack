import 'package:flutter/material.dart';


class AppTextStyle {



  static TextStyle _notoSansRegular(Color color, double size, FontWeight fontWeight,double height) {
    return _textStyle("NotoSans-Regular", color, size, fontWeight ,height);
  }

  static TextStyle _notoSansMedium(Color color, double size, FontWeight fontWeight,double height) {
    return _textStyle("NotoSans-Medium", color, size, fontWeight,height);
  }

  static TextStyle _notoSansBold(Color color, double size, FontWeight fontWeight,double height) {
    return _textStyle("NotoSans-Bold", color, size, fontWeight,height);
  }




  //regular
  static Function notoSansRegular1216 = ({Color color = Colors.black}) =>
      _notoSansRegular(color, 12, FontWeight.w400, 16);
  static Function notoSansRegular1418 = ({Color color = Colors.black}) =>
      _notoSansRegular(color, 14, FontWeight.w400, 18);
  static Function notoSansRegular1621 = ({Color color = Colors.black}) =>
      _notoSansRegular(color, 16, FontWeight.w400, 21);
  static Function notoSansRegular1823 = ({Color color = Colors.black}) =>
      _notoSansRegular(color, 18, FontWeight.w400, 23);
  static Function notoSansRegular2026 = ({Color color = Colors.black}) =>
      _notoSansRegular(color, 20, FontWeight.w400, 26);
  static Function notoSansRegular2229 = ({Color color = Colors.black}) =>
      _notoSansRegular(color, 22, FontWeight.w400, 29);
  //Medium
  static Function notoSansMedium1418 = ({Color color = Colors.black}) =>
      _notoSansMedium(color, 14, FontWeight.w400, 18);
  static Function notoSansMedium1621 = ({Color color = Colors.black}) =>
      _notoSansMedium(color, 16, FontWeight.w400, 21);
  static Function notoSansMedium1823 = ({Color color = Colors.black}) =>
      _notoSansMedium(color, 18, FontWeight.w400, 23);
  static Function notoSansMedium2026 = ({Color color = Colors.black}) =>
      _notoSansMedium(color, 20, FontWeight.w400, 26);
  //Bold
  static Function notoSansBold2026 = ({Color color = Colors.black}) =>
      _notoSansBold(color, 20, FontWeight.w400, 26);
  static Function notoSansBold2838 = ({Color color = Colors.black}) =>
      _notoSansBold(color, 28, FontWeight.w400, 38);




}

TextStyle _textStyle(
    String fontFamily, Color color, double size, FontWeight fontWeight,double height) {
  return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      height: height
  );


}
