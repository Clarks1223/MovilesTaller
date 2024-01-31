import 'package:flutter/material.dart';
import 'package:splashscreen/src/pages/home_screen.dart';
import 'package:splashscreen/src/pages/register_screen.dart';
import 'package:splashscreen/src/pages/splash_screen.dart';
import 'package:splashscreen/src/pages/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  } catch (e) {
    print('Error inicializando Firebase: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: "splash",
        routes: {
          "splash": (context) => const SplashScreen(),
          "home": (context) => const HomeScreen(),
          "login": (context) => LoginScreen(),
          "register": (context) => const RegisterScreen(),
        });
  }
}
