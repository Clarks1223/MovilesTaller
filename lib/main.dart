import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_page.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCra1uK8zaTQ9gNqBcVGk8xJx4YnFLghbU",
      authDomain: "fir-app-8c525.firebaseapp.com",
      databaseURL: "https://fir-app-8c525-default-rtdb.firebaseio.com",
      projectId: "fir-app-8c525",
      storageBucket: "fir-app-8c525.appspot.com",
      messagingSenderId: "596289681459",
      appId: "1:596289681459:web:0637c963853848bf034b46",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
