import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/backgrounded_button.dart';
import 'package:takasburada/widgets/bordered_text_field.dart';
import 'package:takasburada/widgets/primary_colored_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: containerPadding,
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BorderedTextField(
            hint: "username or email",
          ),
          SizedBox(
            height: containerPadding,
          ),
          BorderedTextField(
            hint: "password",
          ),
          SizedBox(
            height: containerPadding,
          ),
          PrimaryColoredButton(
            text: "continue",
            onTap: () {},
          ),
          SizedBox(
            height: containerPadding,
          ),
          BackgroundedButton(
            text: "sign in with google",
            image: "images/google.png",
            onTap: () {},
          ),
          SizedBox(
            height: containerPadding,
          ),
          BackgroundedButton(
            text: "sign in with facebook",
            image: "images/facebook.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
