import 'package:flutter/material.dart';
import 'welcome.dart';

// membuat class splash screen untuk tampilan awal
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // menggunakan gesture detector untuk mendeteksi gerakan pada layar
      body: GestureDetector(
        onTap: () { // jika layar di tekan
          Navigator.pushReplacement( // akan di arahkan ke welcome page pada welcome.dart
            context,
            MaterialPageRoute(builder: (context) => WelcomePage()),
          );
        },
        // container sebagai tubuh splash screen
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splash_screen.png'), // menggunakan gambar sebagai splash screen
              fit: BoxFit.cover, // Agar gambar memenuhi layar
            ),
          ),
        ),
      ),
    );
  }
}