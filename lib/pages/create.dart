import 'dart:io';

import 'package:flutter/material.dart' hide AppBar, IconButton, SnackBar;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/models/ad.dart';
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
  const Create({
    Key? key,
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
      appBar: AppBar(
        withTitle: false,
        children: [
          IconButton(
            icon: CustomIcons.back,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Expanded(child: SizedBox()),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.symmetric(horizontal: containerPadding),
        children: [
          Row(
            children: [
              Expanded(
                child: ImageTile(
                  photo: givenProductPhoto.path,
                  onTap: () {
                    context.read<providers.ImageProvider>().selectImage(fromCamera: false).then(
                      (photo) {
                        if (photo == null) {
                          print("no image selected");
                        } else {
                          setState(() {
                            givenProductPhoto = photo;
                          });
                          print("image selected");
                        }
                        SnackBar.show(context, photo == null ? "no image selected" : "image selected");
                      },
                    );
                  },
                ),
              ),
              SizedBox(width: containerPadding),
              Expanded(
                child: ImageTile(
                  photo: desiredProductPhoto.path,
                  onTap: () {
                    context.read<providers.ImageProvider>().selectImage(fromCamera: false).then(
                      (photo) {
                        if (photo == null) {
                          print("no image selected");
                        } else {
                          setState(() {
                            desiredProductPhoto = photo;
                          });
                          print("image selected");
                        }
                        SnackBar.show(context, photo == null ? "no image selected" : "image selected");
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: containerPadding),
          Row(
            children: [
              Expanded(
                child: BorderedTextField(
                  textEditingController: givenProductNameController,
                  hint: "yours",
                ),
              ),
              SizedBox(width: containerPadding),
              Expanded(
                child: BorderedTextField(
                  textEditingController: desiredProductNameController,
                  hint: "desired",
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
              Ad.createAd(
                givenProductName: givenProductNameController.text,
                givenProductPhoto: givenProductPhoto,
                desiredProductName: desiredProductNameController.text,
                desiredProductPhoto: desiredProductPhoto,
                information: informationController.text,
              ).then(
                (result) {
                  print(result);
                  SnackBar.show(context, result);
                  if (result == "ad created") {
                    givenProductNameController.clear();
                    desiredProductNameController.clear();
                    informationController.clear();
                    Navigator.pop(context);
                  }
                },
              ).then((value) => Navigator.pop(context));
              showDialog(
                context: context,
                builder: (context) => Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: CircularProgressIndicator(
                      color: tabBarIndicatorColor,
                      strokeWidth: 5,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: containerPadding),
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
