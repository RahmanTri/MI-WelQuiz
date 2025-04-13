import 'package:flutter/material.dart';
import 'main.dart';
import 'instructions.dart';

// membuat class welcome page/home
class WelcomePage extends StatelessWidget {
  @override
  // membuat widget dasar
  Widget build(BuildContext context) {
    return Scaffold( // menggunakan scaffold sebagai dasar widget
      body: Container( // digunakan sebagai tubuh dari welcome/home
        color: Colors.white,
        child: Center(
          // menggunakan column agar kontent disusun vertikal
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 80),

              // menampilkan gambar selamat datang
              Image.asset(
                'assets/welcome_text.png',
                width: 300,
              ),
              SizedBox(height: 50),

              // menampilkan logo
              Image.asset(
                'assets/logo.png',
                width: 200,
              ),
              SizedBox(height: 70),

              // membuat button mulai quiz
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton( // menggunakan elevated button
                  style: ElevatedButton.styleFrom( // styling button
                    backgroundColor: Color(0xFF4A90E2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Mulai Quiz',
                    style: TextStyle( // styling text dalam button
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () { // ketika button di klik
                    Navigator.push( // diarahkan ke WellQuiz/main.dart
                      context,
                      MaterialPageRoute(builder: (context) => WellQuiz()),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // membuat button petunjuk
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton( // menggunakan elevated button
                  style: ElevatedButton.styleFrom( // styling button
                    backgroundColor: Color(0xFF4A90E2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Petunjuk Quiz',
                    style: TextStyle( // styling text dalam button
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () { // ketika button di klik
                    Navigator.push( // di arahkan intruction page/intruction.dart
                      context,
                      MaterialPageRoute(builder: (context) => QuizInstructionsPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}