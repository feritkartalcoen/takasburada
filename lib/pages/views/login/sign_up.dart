import 'package:flutter/material.dart' hide SnackBar;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/home.dart';
import 'package:takasburada/widgets/backgrounded_button.dart';
import 'package:takasburada/widgets/bordered_text_field.dart';
import 'package:takasburada/widgets/colored_button.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers;
import 'package:takasburada/widgets/snack_bar.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding: EdgeInsets.all(containerPadding),
      children: [
        Row(
          children: [
            Expanded(
              child: BorderedTextField(
                hint: "name",
                textEditingController: nameController,
              ),
            ),
            SizedBox(
              width: containerPadding,
            ),
            Expanded(
              child: BorderedTextField(
                hint: "surname",
                textEditingController: surnameController,
              ),
            ),
          ],
        ),
        SizedBox(
          height: containerPadding,
        ),
        BorderedTextField(
          hint: "email",
          textEditingController: emailController,
        ),
        SizedBox(
          height: containerPadding,
        ),
        BorderedTextField(
          hint: "password",
          textEditingController: passwordController,
        ),
        SizedBox(
          height: containerPadding,
        ),
        ColoredButton(
          text: "continue",
          isPrimary: true,
          onTap: () {
            context
                .read<providers.Authentication>()
                .signUp(
                  name: nameController.text,
                  surname: surnameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                )
                .then((value) {
              print(value);
              SnackBar.show(context, value);
              if (value == "signed up") {
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
          text: "sign up with google",
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
          text: "sign up with facebook",
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
