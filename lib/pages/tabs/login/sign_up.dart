import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/custom_backgrounded_button.dart';
import 'package:takasburada/widgets/custom_bordered_text_field.dart';
import 'package:takasburada/widgets/custom_colored_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: containerPadding,
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: CustomBorderedTextField(
                  hint: "name",
                ),
              ),
              SizedBox(
                width: containerPadding,
              ),
              Expanded(
                child: CustomBorderedTextField(
                  hint: "surname",
                ),
              ),
            ],
          ),
          SizedBox(
            height: containerPadding,
          ),
          CustomBorderedTextField(
            hint: "username",
          ),
          SizedBox(
            height: containerPadding,
          ),
          CustomBorderedTextField(
            hint: "email",
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
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
          ),
          SizedBox(
            height: containerPadding,
          ),
          CustomBackgroundedButton(
            text: "sign up with google",
            image: "images/google.png",
            onTap: () {},
          ),
          SizedBox(
            height: containerPadding,
          ),
          CustomBackgroundedButton(
            text: "sign up with facebook",
            image: "images/facebook.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
