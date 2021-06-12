import 'package:flutter/material.dart';
import 'package:takasburada/classes/message.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/message_tile.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(right: containerPadding),
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: messages.length,
      itemBuilder: (context, index) => MessageTile(
        image: messages[index].image,
        sender: messages[index].sender,
        message: messages[index].message,
        onTap: () {},
      ),
      separatorBuilder: (context, index) {
        return SizedBox(
          height: containerPadding,
        );
      },
    );
  }
}
