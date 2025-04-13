import 'package:flutter/material.dart';

// membuat class quiz intruction page
class QuizInstructionsPage extends StatelessWidget {
  @override
  // membuat widget menggunakan scaffold
  Widget build(BuildContext context) {
    return Scaffold(

      // app bar sebagai header/judul
      appBar: AppBar(
        title: Text(
          'Petunjuk Quiz',
          style: TextStyle( // styling text pada app bar
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),

      // body menggunakan padding untuk mengatur ruang kosong
      body: Padding(
        padding: EdgeInsets.all(16.0), // settup padding
        // menggunakan column agar konten vertikal
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // dmulai dari atas
          crossAxisAlignment: CrossAxisAlignment.center, // kontent berada di tengah horizontal
          children: [
            SizedBox(height: 50),
            // menggunakan container sebagai tubuh dari ruang kosong padding
            Container(
              decoration: BoxDecoration( // styling container
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Posisi bayangan
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.0), // mengatur padding pada container
              // menggunakan column agar konten vertikal
              child: Column(
                children: [

                  // text petunjuk
                  Text(
                    'Petunjuk MI WelQuiz:',
                    style: TextStyle( // styling text petunjuk
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  SizedBox(height: 10),

                  // text petunjuk
                  Text(
                    '- Baca doa terlebih dahulu\n'
                        '- Baca soal Quiz dengan teliti\n'
                        '- Pilih jawaban "Benar" atau "Salah" sesuai dengan soal Quiz\n'
                        '- Jawaban akan dikoreksi otomatis dan skor akan muncul di akhir',
                    style: TextStyle( // styling text petunjuk
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 30),

                  // text selamat mengerjakan
                  Text(
                    'Selamat Mengerjakan Quiz',
                    style: TextStyle( // styling text selamat mengerjakan
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 150),

            // menampilkan image
            Image.asset(
              'assets/goodluck.png', // Gambar emoji "Good Luck!"
              width: 300
            ),
          ],
        ),
      ),
    );
  }
}