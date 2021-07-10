import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takasburada/models/ad.dart';
import 'package:takasburada/models/message.dart';
import 'package:takasburada/models/user.dart';

// Conversation (Sohbet) sınıfı Id dışında
// ekstra olarak bir adId ve bir de messages
// değişkenlerine sahiptir.
// adId; "conversations" ve "ads" collection'larını
// birbirine bağlamamızı sağlar.
// messages; "ads" collection'ı içerisindeki
// her bir document'da "messages"
// collection'u oluşturur.
// Bu sayede nested collection yani iç içe
// koleksiyon oluşturmuş oluruz.
class Conversation {
  // Conversation sınıfı için varsayılan constructor.
  // Bu sınıftan bir nesne türetmek için
  // "messages" dışında tüm parametreler
  // girilmelidir.
  // Burada "messages" collection'ı oluşturulmaz.
  // İlk önce "conversations" collection'ı içine bir
  // document oluşturulur. Daha sonra Message
  // sınıfındaki bir metod ile bu oluşturulan
  // document içerisine "messages" adında bir
  // colllection oluşturulur.
  Conversation({
    required this.id,
    required this.adId,
    this.messages,
  });

  // .fromFirestore constructor'ı Firebase Cloud Firestore Database'i
  // üzerinden sohbet bilgilerini document olarak çekmek yerine
  // direkt Conversation nesnesi olarak çekmemizi sağlıyor.
  Conversation.fromFirestore(Map<String, Object?> conversation)
      : this(
          id: conversation["id"] as String,
          adId: conversation["adId"] as String,
        );

  // Conversation sınıfına ait değişkenler.
  final String id;
  final String adId;
  List<Message>? messages;

  // toFirestore metodu Conversation sınıfını
  // Firebase Cloud Firestore Database'e
  // document olarak aktarmamızı sağlıyor.
  Map<String, Object> get toFirestore {
    return {
      "id": id,
      "adId": adId,
    };
  }

  // _conversationsReference, Firebase Cloud Firestore Database üzerindeki
  // "conversations" collection'ına erişimi sağlıyor.
  // withConverter metodunu kullanarak da document-nesne
  // değişimini yapmamıza gerek kalmıyor.
  static CollectionReference<Conversation> _conversationsReference() =>
      FirebaseFirestore.instance.collection("conversations").withConverter(
            fromFirestore: (snapshot, _) =>
                Conversation.fromFirestore(snapshot.data()!),
            toFirestore: (Conversation conversation, options) =>
                conversation.toFirestore,
          );

  // createConversation metodu verilen
  // parametrelerle bir sohbet oluşturuyor.
  static Future<String> createConversation({
    required Ad ad,
    required String text,
  }) async {
    var conversation = _conversationsReference()
        .doc("${ad.id}-${ad.userId}-${User.currentUserId}");
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

  // getConversation metodu parametre olarak
  // aldığı Id'ye sahip sohbeti döndürür.
  static Stream<DocumentSnapshot<Conversation>> getConversation(
      {required String conversationId}) {
    return _conversationsReference().doc(conversationId).snapshots();
  }

  // getConversations database'deki
  // tüm sohbetleri döndürür.
  static Stream<QuerySnapshot<Conversation>> getConversations() {
    return _conversationsReference().snapshots();
  }

  // deleteConversation metodu verilen Id'ye
  // sahip sohbeti silmemizi sağlar.
  static Future<void> deleteConversation(
      {required String conversationId}) async {
    return _conversationsReference().doc(conversationId).delete();
  }

  // Nesnenin messages değişkenindeki
  // son mesaj nesnesini döndürür.
  Message? get lastMessage {
    return messages!.last;
  }
}
