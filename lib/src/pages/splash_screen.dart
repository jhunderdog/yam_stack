import 'package:flutter/material.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/utils/size_config.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: colorFFD74A,
      body: Center(
          child: Image(image: AssetImage("assets/images/logo.png"))
      ),
    );
  }
}
