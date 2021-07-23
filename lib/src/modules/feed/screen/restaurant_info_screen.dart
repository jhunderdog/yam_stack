
import 'package:flutter/material.dart';
import 'package:yam_stack/src/components/back_button_app_bar.dart';


class RestaurantInfoScreen extends StatelessWidget {
  const RestaurantInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BackButtonAppBar(backButtonNavTitle: "가게정보",),
      ),
    )
  }
}
