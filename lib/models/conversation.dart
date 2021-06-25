import 'package:takasburada/models/message.dart';

class Conversation {
  String? id;
  String? adId;
  List<Message?>? messages;

  Conversation({
    this.id,
    this.adId,
    this.messages,
  });

  Message? get lastMessage {
    return messages!.last!;
  }
}
