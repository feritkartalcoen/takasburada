import 'package:takasburada/classes/conversation.dart';

class User {
  String? id;
  String? name;
  String? surname;
  String? username;
  String? email;
  String? password;
  String? photo;
  List<Conversation?>? conversations;

  User({
    this.id,
    this.name,
    this.surname,
    this.username,
    this.email,
    this.password,
    this.photo,
    this.conversations,
  });

  String get nameSurname {
    return name! + " " + surname!;
  }
}

List<User> users = [
  User(
    id: "0",
    name: "meriç",
    surname: "kartal",
    photo: "images/meric.png",
  ),
  User(
    id: "1",
    name: "burcu",
    surname: "bitkin",
    photo: "images/burcu.png",
  ),
];
