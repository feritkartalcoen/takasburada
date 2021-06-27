import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takasburada/models/ad.dart';
import 'package:takasburada/models/message.dart';
import 'package:takasburada/models/user.dart';

class Conversation {
  Conversation({
    required this.id,
    required this.adId,
    this.messages,
  });

  Conversation.fromFirestore(Map<String, Object?> conversation)
      : this(
          id: conversation["id"] as String,
          adId: conversation["adId"] as String,
        );

  final String id;
  final String adId;
  List<Message>? messages;

  Map<String, Object> get toFirestore {
    return {
      "id": id,
      "adId": adId,
    };
  }

  static CollectionReference<Conversation> _conversationsReference() => FirebaseFirestore.instance.collection("conversations").withConverter(
        fromFirestore: (snapshot, _) => Conversation.fromFirestore(snapshot.data()!),
        toFirestore: (Conversation conversation, options) => conversation.toFirestore,
      );

  static Future<String> createConversation({required Ad ad, required String text}) async {
    var conversation = _conversationsReference().doc("${ad.id}-${ad.userId}-${User.currentUserId}");
    bool conversationExists = false;
    await conversation.get().then(
      (snapshot) {
        if (snapshot.exists) {
          conversationExists = true;
        }
      },
    );
    if (conversationExists) {
      return "conversation exists";
    } else {
      try {
        await conversation.set(Conversation(
          id: conversation.id,
          adId: ad.id,
        ));
        await Message.createMessage(
          conversationId: conversation.id,
          text: text,
        );
        return "conversation created";
      } on FirebaseException catch (e) {
        return e.message!;
      }
    }
  }

  static Stream<DocumentSnapshot<Conversation>> getConversation({required String conversationId}) {
    return _conversationsReference().doc(conversationId).snapshots();
  }

  static Stream<QuerySnapshot<Conversation>> getConversations() {
    return _conversationsReference().snapshots();
  }

  static Future<void> deleteConversation({required String conversationId}) async {
    return _conversationsReference().doc(conversationId).delete();
  }

  Message? get lastMessage {
    return messages!.last;
  }
}
