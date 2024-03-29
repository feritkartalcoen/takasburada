import 'package:flutter/material.dart' hide SnackBar;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/models/user.dart';
import 'package:takasburada/pages/home.dart';
import 'package:takasburada/widgets/backgrounded_button.dart';
import 'package:takasburada/widgets/bordered_text_field.dart';
import 'package:takasburada/widgets/colored_button.dart';
import 'package:takasburada/widgets/snack_bar.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding: EdgeInsets.all(containerPadding),
      children: [
        BorderedTextField(
          textInputType: TextInputType.emailAddress,
          textEditingController: emailController,
          hint: "email",
        ),
        SizedBox(
          height: containerPadding,
        ),
        BorderedTextField(
          textInputType: TextInputType.visiblePassword,
          textEditingController: passwordController,
          hint: "password",
        ),
        SizedBox(
          height: containerPadding,
        ),
        ColoredButton(
          text: "continue",
          isPrimary: true,
          onTap: () {
            User.signIn(
              email: emailController.text,
              password: passwordController.text,
            ).then((result) {
              print(result);
              SnackBar.show(context, result);
              if (result == "signed in") {
                emailController.clear();
                passwordController.clear();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              }
            });
          },
        ),
        SizedBox(
          height: containerPadding,
        ),
        BackgroundedButton(
          text: "sign in with google",
          image: "images/google.png",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
        ),
        SizedBox(
          height: containerPadding,
        ),
        BackgroundedButton(
          text: "sign in with facebook",
          image: "images/facebook.png",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
        ),
      ],
    );
  }
}
