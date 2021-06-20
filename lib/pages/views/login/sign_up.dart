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
                textInputType: TextInputType.text,
                hint: "name",
                textEditingController: nameController,
              ),
            ),
            SizedBox(
              width: containerPadding,
            ),
            Expanded(
              child: BorderedTextField(
                textInputType: TextInputType.text,
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
          textInputType: TextInputType.emailAddress,
          hint: "email",
          textEditingController: emailController,
        ),
        SizedBox(
          height: containerPadding,
        ),
        BorderedTextField(
          textInputType: TextInputType.visiblePassword,
          hint: "password",
          textEditingController: passwordController,
        ),
        SizedBox(
          height: containerPadding,
        ),
        Row(
          children: [
            Expanded(
              child: ColoredButton(
                text: "add${context.watch<providers.ImageOrVideo>().file.path == "" ? " " : " another "}photo",
                onTap: () {
                  context.read<providers.ImageOrVideo>().selectImage().then(
                    (value) {
                      print(value);
                      SnackBar.show(context, value);
                    },
                  );
                },
                isPrimary: true,
              ),
            ),
            if (context.watch<providers.ImageOrVideo>().file.path != "") SizedBox(width: containerPadding),
            if (context.watch<providers.ImageOrVideo>().file.path != "")
              Material(
                elevation: elevation,
                borderRadius: BorderRadius.circular(buttonBorderRadius),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                  child: Image.file(
                    context.watch<providers.ImageOrVideo>().file,
                    width: buttonHeight,
                    height: buttonHeight,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
          ],
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
                  photo: context.read<providers.ImageOrVideo>().file,
                )
                .then((value) {
              print(value);
              nameController.clear();
              surnameController.clear();
              emailController.clear();
              passwordController.clear();
              context.read<providers.ImageOrVideo>().resetFile();
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
