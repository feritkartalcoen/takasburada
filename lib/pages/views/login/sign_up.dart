import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/backgrounded_button.dart';
import 'package:takasburada/widgets/bordered_text_field.dart';
import 'package:takasburada/widgets/colored_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.all(containerPadding),
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
          ColoredButton(
            text: "continue",
            isPrimary: true,
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
          ),
          SizedBox(
            height: containerPadding,
          ),
          BackgroundedButton(
            text: "sign up with google",
            image: "images/google.png",
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
          ),
          SizedBox(
            height: containerPadding,
          ),
          BackgroundedButton(
            text: "sign up with facebook",
            image: "images/facebook.png",
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
          ),
        ],
      ),
    );
  }
}
