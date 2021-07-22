import 'package:flutter/material.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/src/components/underline_button.dart';


class TermsListContainer extends StatelessWidget {
  const TermsListContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 29,),
            Text(
              "약관 동의",
              style: TextStyle(fontSize: 18),
            ),
            TermsList(buttonTitle: "이용약관(필수)"),
            TermsList(buttonTitle: "개인정보수집/이용(필수)"),
            TermsList(buttonTitle: "마케팅활용동의(선택)"),
            TermsList(buttonTitle: "마케팅수신동의(선택)"),
          ],
        ),
      ),
    );
  }
}

class TermsList extends StatelessWidget {
  const TermsList({
    Key? key, required this.buttonTitle,
  }) : super(key: key);

  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UnderLineButton(
          buttonTitle: buttonTitle,
          buttonColor: colorD9D9D9,
          pressed: () {},
        ),
        UnderLineButton(
          buttonTitle: "(필수)",
          buttonColor: colorD9D9D9,
          pressed: () {},
        ),
      ],
    );
  }
}