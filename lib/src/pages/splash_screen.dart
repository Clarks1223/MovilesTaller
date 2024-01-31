import 'package:flutter/material.dart';
import 'package:splashscreen/src/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var duration = const Duration(seconds: 5);
    Future.delayed(duration, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Splash.png"),
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: Text(
                  "Devs: Uchuari Pablo, Moreira Elian, Santillan Erick",
                  textAlign: TextAlign.center,
                ),
              ),
            ))
      ]),
    );
  }
}
