import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'private_info_screen.dart';


class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Controladores para los campos de texto
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login con Firebase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                loginUser(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      showPrivateInfo(context, userCredential.user);
    } on FirebaseAuthException catch (e) {
      print('Error de inicio de sesión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error de inicio de sesión: $e'),
        ),
      );
    }
  }

  void showPrivateInfo(BuildContext context, User? user) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PrivateInfoScreen(user: user),
      ),
    );
  }
}
