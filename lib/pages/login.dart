import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/backgrounded_button.dart';
import 'package:takasburada/widgets/apptitle.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(containerPadding),
        width: double.infinity,
        height: double.infinity,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: AppTitle(),
                ),
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
            ]),
      ),
    );
  }
}
