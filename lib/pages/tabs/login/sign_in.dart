import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/custom_backgrounded_button.dart';
import 'package:takasburada/widgets/custom_bordered_text_field.dart';
import 'package:takasburada/widgets/custom_colored_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView(
        padding: EdgeInsets.all(
          containerPadding,
        ),
        children: [
          CustomBorderedTextField(
            hint: "username or email",
          ),
          SizedBox(
            height: containerPadding,
          ),
          CustomBorderedTextField(
            hint: "password",
          ),
          SizedBox(
            height: containerPadding,
          ),
          CustomColoredButton(
            text: "continue",
            isPrimary: true,
            onTap: () {},
          ),
          SizedBox(
            height: containerPadding,
          ),
          CustomBackgroundedButton(
            text: "sign in with google",
            image: "images/google.png",
            onTap: () {},
          ),
          SizedBox(
            height: containerPadding,
          ),
          CustomBackgroundedButton(
            text: "sign in with facebook",
            image: "images/facebook.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
