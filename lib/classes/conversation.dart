import 'package:takasburada/classes/message.dart';

class Conversation {
  String? id;
  String? userId;
  List<Message?>? messages;

  Conversation({
    this.id,
    this.userId,
    this.messages,
  });
}

List<Conversation> conversations = [
  Conversation(
    userId: "0",
    messages: [
      Message(
        userId: "0",
        text: "merhaba, iyi günler.",
        date: DateTime.parse("2012-02-27 13:27:00"),
      ),
    ],
  ),
  Conversation(
    userId: "1",
    messages: [
      Message(
        userId: "1",
        text: "teşekkürler.",
        date: DateTime.parse("2012-02-27 13:27:00"),
      ),
    ],
  ),
];
