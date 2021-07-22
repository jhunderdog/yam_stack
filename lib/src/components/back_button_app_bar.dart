import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/shared/constants/color.dart';


class BackButtonAppBar extends StatelessWidget {
  const BackButtonAppBar({
    Key? key,
    required this.backButtonNavTitle,
  }) : super(key: key);


  final String backButtonNavTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 12,
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/icons/back_button.png"),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 33,
          ),
          Text(
            backButtonNavTitle,
            style: TextStyle(
                fontSize: 20,
                color: color202020,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
