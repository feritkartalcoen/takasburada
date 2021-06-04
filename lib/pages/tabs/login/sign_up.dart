import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/backgrounded_button.dart';
import 'package:takasburada/widgets/bordered_text_field.dart';
import 'package:takasburada/widgets/primary_colored_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
          Row(
            children: [
              Expanded(
                child: BorderedTextField(
                  hint: "name",
                ),
              ),
              SizedBox(
                width: containerPadding,
              ),
              Expanded(
                child: BorderedTextField(
                  hint: "surname",
                ),
              ),
            ],
          ),
          SizedBox(
            height: containerPadding,
          ),
          BorderedTextField(
            hint: "username",
          ),
          SizedBox(
            height: containerPadding,
          ),
          BorderedTextField(
            hint: "email",
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
            text: "sign up with google",
            image: "images/google.png",
            onTap: () {},
          ),
          SizedBox(
            height: containerPadding,
          ),
          BackgroundedButton(
            text: "sign up with facebook",
            image: "images/facebook.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
