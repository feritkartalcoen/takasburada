import 'package:flutter/material.dart' hide AppBar, IconButton;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/bordered_text_field.dart';
import 'package:takasburada/widgets/colored_button.dart';
import 'package:takasburada/widgets/icon_button.dart';
import 'package:takasburada/widgets/image_tile.dart';
import 'package:takasburada/widgets/label.dart';

class Create extends StatelessWidget {
  final VoidCallback? onTap;
  const Create({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            withTitle: false,
            children: [
              IconButton(
                icon: "images/back.png",
                onTap: onTap,
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.symmetric(horizontal: containerPadding),
              children: [
                Label(label: "what are you giving"),
                SizedBox(height: containerPadding),
                BorderedTextField(hint: "type here"),
                SizedBox(height: containerPadding),
                ColoredButton(
                    text: "add product photo", onTap: () {}, isPrimary: true),
                SizedBox(height: containerPadding),
                Label(label: "what do you want"),
                SizedBox(height: containerPadding),
                BorderedTextField(hint: "type here"),
                SizedBox(height: containerPadding),
                ColoredButton(
                    text: "add product photo", onTap: () {}, isPrimary: true),
                SizedBox(height: containerPadding),
                Row(
                  children: [
                    Expanded(
                      child: ImageTile(image: "images/miBand4.png"),
                    ),
                    SizedBox(width: containerPadding),
                    Expanded(
                      child: ImageTile(image: "images/iPhone11.png"),
                    ),
                  ],
                ),
                SizedBox(height: containerPadding),
                Label(label: "information"),
                SizedBox(height: containerPadding),
                BorderedTextField(hint: "type here"),
                SizedBox(height: containerPadding),
                ColoredButton(text: "complete", onTap: () {}, isPrimary: false),
                SizedBox(height: containerPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
