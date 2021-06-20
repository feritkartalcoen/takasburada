import 'dart:io';

import 'package:flutter/material.dart' hide AppBar, IconButton, SnackBar;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/bordered_text_field.dart';
import 'package:takasburada/widgets/colored_button.dart';
import 'package:takasburada/widgets/icon_button.dart';
import 'package:takasburada/widgets/image_tile.dart';
import 'package:takasburada/widgets/label.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers;
import 'package:takasburada/widgets/snack_bar.dart';

class Create extends StatefulWidget {
  final VoidCallback? onTap;
  const Create({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  File givenProductPhoto = File("");
  File desiredProductPhoto = File("");
  final TextEditingController givenProductNameController = TextEditingController();
  final TextEditingController desiredProductNameController = TextEditingController();
  final TextEditingController informationController = TextEditingController();

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
                icon: CustomIcons.back,
                onTap: widget.onTap,
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.symmetric(horizontal: containerPadding),
              children: [
                Label(label: "what are you giving"),
                SizedBox(height: containerPadding),
                BorderedTextField(
                  textEditingController: givenProductNameController,
                  hint: "type here",
                ),
                SizedBox(height: containerPadding),
                ColoredButton(
                  text: "add product photo",
                  onTap: () {
                    context.read<providers.ImageProvider>().selectImage().then(
                      (value) {
                        if (value == null) {
                          print("no image selected");
                        } else {
                          setState(() {
                            givenProductPhoto = value;
                          });
                          print("image selected");
                        }
                        SnackBar.show(context, value == null ? "no image selected" : "image selected");
                      },
                    );
                  },
                  isPrimary: true,
                ),
                SizedBox(height: containerPadding),
                Label(label: "what do you want"),
                SizedBox(height: containerPadding),
                BorderedTextField(
                  textEditingController: desiredProductNameController,
                  hint: "type here",
                ),
                SizedBox(height: containerPadding),
                ColoredButton(
                  text: "add product photo",
                  onTap: () {
                    context.read<providers.ImageProvider>().selectImage().then(
                      (value) {
                        if (value == null) {
                          print("no image selected");
                        } else {
                          setState(() {
                            desiredProductPhoto = value;
                          });
                          print("image selected");
                        }
                        SnackBar.show(context, value == null ? "no image selected" : "image selected");
                      },
                    );
                  },
                  isPrimary: true,
                ),
                SizedBox(height: containerPadding),
                Row(
                  children: [
                    Expanded(
                      child: ImageTile(
                        photo: givenProductPhoto.path,
                      ),
                    ),
                    SizedBox(width: containerPadding),
                    Expanded(
                      child: ImageTile(
                        photo: desiredProductPhoto.path,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: containerPadding),
                Label(label: "information"),
                SizedBox(height: containerPadding),
                BorderedTextField(
                  textEditingController: informationController,
                  hint: "type here",
                ),
                SizedBox(height: containerPadding),
                ColoredButton(
                  text: "complete",
                  isPrimary: false,
                  onTap: () {
                    context
                        .read<providers.FirebaseProvider>()
                        .createAd(
                          givenProductName: givenProductNameController.text,
                          givenProductPhoto: givenProductPhoto,
                          desiredProductName: desiredProductNameController.text,
                          desiredProductPhoto: desiredProductPhoto,
                          information: informationController.text,
                        )
                        .then(
                      (value) {
                        print(value);
                        /* givenProductNameController.clear();
                        desiredProductNameController.clear();
                        informationController.clear();
                        setState(() {
                          givenProductPhoto = File("");
                          desiredProductPhoto = File("");
                        }); */
                        SnackBar.show(context, value);
                        /* if (value == "ad created") {
                          
                        } */
                      },
                    );
                  },
                ),
                SizedBox(height: containerPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
