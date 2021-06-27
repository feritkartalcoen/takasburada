import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takasburada/models/user.dart';

class Message {
  Message({
    required this.id,
    required this.userId,
    required this.text,
    required this.date,
  });

  Message.fromFirestore(Map<String, Object?> message)
      : this(
          id: message["id"] as String,
          userId: message["userId"] as String,
          text: message["text"] as String,
          date: message["date"] as Timestamp,
        );

  final String id;
  final String userId;
  final String text;
  final Timestamp date;

  Map<String, Object> get toFirestore {
    return {
      "id": id,
      "userId": userId,
      "text": text,
      "date": date,
    };
  }

  static CollectionReference<Message> _messagesReference({required String conversationId}) => FirebaseFirestore.instance.collection("conversations").doc(conversationId).collection("messages").withConverter(
        fromFirestore: (snapshot, _) => Message.fromFirestore(snapshot.data()!),
        toFirestore: (Message message, options) => message.toFirestore,
      );

  static Future<String> createMessage({required String conversationId, required String text}) async {
    if (text != "") {
      try {
        var messages = _messagesReference(conversationId: conversationId);
        var message = messages.doc();
        await messages.add(
          Message(
            id: message.id,
            userId: User.currentUserId,
            text: text,
            date: Timestamp.now(),
          ),
        );
        return "message created";
      } on FirebaseException catch (e) {
        return e.message!;
      }
    }
    return "please type something";
  }

  static Stream<DocumentSnapshot<Message>> getMessage({required String conversationId, required String messageId}) {
    return _messagesReference(conversationId: conversationId).doc(messageId).snapshots();
  }

  static Stream<QuerySnapshot<Message>> getMessages({required String conversationId}) {
    return _messagesReference(conversationId: conversationId).orderBy("date", descending: false).snapshots();
  }

  static Future<void> deleteMessages({required String conversationId}) async {
    return _messagesReference(conversationId: conversationId).doc().delete();
  }
}
