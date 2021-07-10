import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takasburada/models/user.dart';

class Message {
  // Message sınıfı için varsayılan constructor.
  // Bu sınıftan bir nesne türetmek için tüm
  // parametreler girilmelidir.
  Message({
    required this.id,
    required this.userId,
    required this.text,
    required this.date,
  });

  // .fromFirestore constructor'ı Firebase Cloud Firestore Database'i
  // üzerinden mesaj bilgilerini document olarak çekmek yerine
  // direkt Message nesnesi olarak çekmemizi sağlıyor.
  Message.fromFirestore(Map<String, Object?> message)
      : this(
          id: message["id"] as String,
          userId: message["userId"] as String,
          text: message["text"] as String,
          date: message["date"] as Timestamp,
        );

  // Message sınıfına ait değişkenler.
  final String id;
  final String userId;
  final String text;
  final Timestamp date;

  // toFirestore metodu Message sınıfını
  // Firebase Cloud Firestore Database'e
  // document olarak aktarmamızı sağlıyor.
  Map<String, Object> get toFirestore {
    return {
      "id": id,
      "userId": userId,
      "text": text,
      "date": date,
    };
  }

  // _productsReference, Firebase Cloud Firestore Database
  // üzerindeki "conversations" collection'ı icinde bulunan
  // "messages" collection'ına erişimi sağlıyor.
  // withConverter metodunu kullanarak da document-nesne
  // değişimini yapmamıza gerek kalmıyor.
  static CollectionReference<Message> _messagesReference(
          {required String conversationId}) =>
      FirebaseFirestore.instance
          .collection("conversations")
          .doc(conversationId)
          .collection("messages")
          .withConverter(
            fromFirestore: (snapshot, _) =>
                Message.fromFirestore(snapshot.data()!),
            toFirestore: (Message message, options) => message.toFirestore,
          );

  // createMessage metodu verilen parametrelerle
  // bir mesaj oluşturuyor. Bu mesajlar tabii ki
  // "conversations" collection'undaki belirtilen Id'ye
  // sahip olan document'in içindeki "messages"
  // collection'una ekleniyor.
  static Future<String> createMessage({
    required String conversationId,
    required String text,
  }) async {
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

  // getMessage metodu parametre olarak aldığı
  // conversationId ve messageId'ye sahip mesajı döndürür.
  static Stream<DocumentSnapshot<Message>> getMessage(
      {required String conversationId, required String messageId}) {
    return _messagesReference(conversationId: conversationId)
        .doc(messageId)
        .snapshots();
  }

  // getMessages database'deki tüm mesajları döndürür.
  static Stream<QuerySnapshot<Message>> getMessages(
      {required String conversationId}) {
    return _messagesReference(conversationId: conversationId)
        .orderBy("date", descending: false)
        .snapshots();
  }

  // Parametre olarak alınan conversationId'ye
  // sahip sohbetteki tüm mesajları siler.
  static Future<void> deleteMessages({required String conversationId}) async {
    return _messagesReference(conversationId: conversationId).doc().delete();
  }
}
