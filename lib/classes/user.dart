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

String currentUserId = "currentUser";

List<User> users = [
  User(
    id: "currentUser",
    name: "ferit",
    surname: "kartal",
    photo: "images/ferit.png",
  ),
  User(
    id: "user1",
    name: "meriç",
    surname: "kartal",
    photo: "images/meric.png",
  ),
  User(
    id: "user2",
    name: "burcu",
    surname: "bitkin",
    photo: "images/burcu.png",
  ),
];
