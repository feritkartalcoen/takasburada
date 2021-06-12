class Message {
  String image;
  String sender;
  String message;

  Message({
    required this.image,
    required this.sender,
    required this.message,
  });
}

List<Message> messages = [
  Message(
    image: "images/meric.png",
    sender: "meriç kartal",
    message: "merhaba, iyi günler.",
  ),
  Message(
    image: "images/burcu.png",
    sender: "burcu bitkin",
    message: "teşekkürler.",
  ),
];
