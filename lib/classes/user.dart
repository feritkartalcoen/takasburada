import 'package:takasburada/classes/conversation.dart';

class User {
  String? id;
  String? name;
  String? surname;
  String? email;
  String? password;
  String? photo;
  List<Conversation?>? conversations;

  User({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.password,
    this.photo,
    this.conversations,
  });

  String get nameSurname {
    return name! + " " + surname!;
  }
}
