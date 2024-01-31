import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PrivateInfoScreen extends StatelessWidget {
  final User? user;

  const PrivateInfoScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${user?.email}!'),
            ElevatedButton(
              onPressed: () {
                // Cerrar sesión
                FirebaseAuth.instance.signOut();
                Navigator.pop(context); 
              },
              child: Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
