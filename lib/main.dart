import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/pages/home.dart';
import 'package:takasburada/pages/login.dart';
import 'package:takasburada/providers/providers.dart' as providers;

// Uygulamanın başladığı fonksiyondur.
// Firebase.initializeApp metodu Firebase
// pluginlerini (Firebase Authentication,
// Firebase Cloud Firestore ve Firebase Storage)
// kullanabilmemiz için gereklidir.
// runApp metodu parametre olarak aldığı Widget'ı
// (bu durumda App widget'ını) ekrana çizmeye başlar.
// Böylece uygulama başlamış olur.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Burada provider'lar yani sağlayıcılar oluşturulmuştur.
      // Buradaki sağlayıcıların görevi uygulamadaki state
      // management'ı yani durum yönetimini kolaylaştırmaktır.
      providers: [
        StreamProvider(
          create: (context) => FirebaseAuth.instance.userChanges(),
          initialData: null,
        ),
        ChangeNotifierProvider(create: (_) => providers.IndexProvider()),
        Provider(
          create: (_) => providers.ImageProvider(),
        ),
      ],
      // MaterialApp flutter'ın ekrana widgetları
      // ekrana hatasız çizmesi için gereklidir. 
      child: MaterialApp(
        // Debug modunda ekranda sağ üstte bulunan
        // "Debug mode" bayrağını etkisizleştirir.
        debugShowCheckedModeBanner: false,
        // Temamızı aydınlık tema olarak ayarladık.
        theme: ThemeData.light().copyWith(
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
              TargetPlatform.fuchsia: FadeThroughPageTransitionsBuilder(),
              TargetPlatform.iOS: FadeThroughPageTransitionsBuilder(),
              TargetPlatform.linux: FadeThroughPageTransitionsBuilder(),
              TargetPlatform.macOS: FadeThroughPageTransitionsBuilder(),
              TargetPlatform.windows: FadeThroughPageTransitionsBuilder(),
            },
          ),
        ),
        // Sisteme giriş yapmış kullanıcı yok ise Giriş yapma ekranını
        // eğer var ise de Anasayfayı döndürür.
        home: FirebaseAuth.instance.currentUser == null ? Login() : Home(),
      ),
    );
  }
}
