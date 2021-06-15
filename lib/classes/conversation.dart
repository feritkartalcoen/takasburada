import 'package:takasburada/classes/message.dart';

class Conversation {
  String? id;
  String? adId;
  List<Message?>? messages;

  Conversation({
    this.id,
    this.adId,
    this.messages,
  });
}

List<Conversation> conversations = [
  Conversation(
    adId: "ad1",
    messages: [
      Message(
        userId: "user1",
        text: "merhaba, iyi günler.",
        date: DateTime.parse("2012-02-27 13:27:00"),
      ),
    ],
  ),
  Conversation(
    adId: "ad2",
    messages: [
      Message(
        userId: "user2",
        text: "saat kaçta müsaitsiniz?",
        date: DateTime.parse("2012-02-27 13:27:00"),
      ),
    ],
  ),
  Conversation(
    adId: "ad3",
    messages: [
      Message(
        userId: "user1",
        text: "teşekkürler.",
        date: DateTime.parse("2012-02-27 13:27:00"),
      ),
    ],
  ),
];
