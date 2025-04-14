import 'package:flutter/material.dart';
import 'splash.dart';
import 'page.dart';

void main() => runApp(MyApp());

// class MyApp yang akan dijalankan terlebih dahulu
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // memanggil class splash screen pada splash.dart sebagai tampilan awal
    );
  }
} 

// membuat class WellQuiz sebagai class inti dari aplikasi
class WellQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // menggunakan material app sebagai kerangka dasar dari widget aplikasi
    return MaterialApp(
      home: Scaffold( // scaffold sebagai bungkus dari home
        body: Container( // container sebagai bungkus dari body home
          color: Colors.white,
          child: SafeArea(
            child: Padding( // menggunakan padding sebagai isi konten
              padding: EdgeInsets.symmetric(horizontal: 10.0), // setup padding sebesar 10
              child: QuizPage(), // memanggil class QuizPage dari page.dart sebagai sebagai body dari aplikasi
            ),
          ),
        ),
      ),
    );
  }
}
