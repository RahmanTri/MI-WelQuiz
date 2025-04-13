import 'package:flutter/material.dart';
import 'welcome.dart';
import 'main.dart';


// membuat class result page menggunakam satateless
class ResultPage extends StatelessWidget {
  // menggunakan final agar isi variabel total jawaban benar dan total soal tidak berubah dalam class ini
  final int correctAnswers;
  final int totalQuestions;

  // memamastikan jawaban benar dan total soal terisi menggunakan required
  ResultPage({required this.correctAnswers, required this.totalQuestions});

  @override
  // menggunakan build sebagai pembangun UI
  Widget build(BuildContext context) {
    int wrongAnswers = totalQuestions - correctAnswers; // Hitung jawaban salah
    double accuracy = (correctAnswers / totalQuestions) * 100; // Hitung akurasi jawaban

    // menggunakan scaffold sebagai dasar widget
    return Scaffold(
      body: Column( // menggunakan column agar tertara vertikal
        children: [

          // container 1 sebagai header dari page
          Container(
            width: double.infinity, // memastikan width mengambil seluruh lebar layar
            padding: EdgeInsets.symmetric(vertical: 40.0),
            decoration: BoxDecoration( // styling header
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 4.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            // text dalam header
            child: Center(
              child: Text(
                'Hasil MI WelQuiz',
                style: TextStyle( // text styling
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 100),

          // menggunakan expanded sebagai dasar isi page
          Expanded(
            // container pembungkus isi
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Center( // memastikan konten ditengah
                child: Column( // menggunakan column agar tertata vertikal
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    // container kotak hasil quiz
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8, // lebar mengambil 80% lebar layar
                      decoration: BoxDecoration( // styling box
                        color: Colors.lightGreenAccent.shade700,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                      child: Column( // column untuk text dalam box
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          // text jawaban benar
                          Text(
                            'Jawaban Benar:',
                            style: TextStyle( // styling
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          // jumlah jawaban benar
                          Text(
                            '$correctAnswers', // mengambil variabel correctAnswer
                            style: TextStyle( // styling
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),

                          // text jawaban salah
                          Text(
                            'Jawaban Salah:',
                            style: TextStyle( // styling
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          // jumlah jawaban salah
                          Text(
                            '$wrongAnswers', // mengambil dari variabel wrongAnswer
                            style: TextStyle( // styling
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 10),

                          // text total benar dari soal
                          Text(
                            '$correctAnswers dari $totalQuestions soal berhasil terjawab', // mengambil dari variabel correctAnswe dan totalQuestion
                            textAlign: TextAlign.center,
                            style: TextStyle( // styling
                              fontSize: 18.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 10),

                          // garis horizontal
                          Divider(
                            color: Colors.blue.shade900, // Warna garis
                            thickness: 4,       // Ketebalan garis
                            indent: 20,         // Jarak dari sisi kiri
                            endIndent: 20,      // Jarak dari sisi kanan

                          ),

                          // text akurasi jawaban
                          Text(
                            'Akurasi Jawaban:',
                            style: TextStyle( // styling
                              fontSize: 18.0,
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // akurasi jawaban
                          Text(
                            // mengambil nilai akurasi dari variabel accuracy dan dijadikan string menggunakan toStringAsFixed dengan 2 angka dibelakang koma
                            '${accuracy.toStringAsFixed(2)}%',
                            style: TextStyle( // styling
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 70),


                    // Tombol navigasi home
                    SizedBox(
                      // ukuran w.h
                      width: 200,
                      height: 50,
                      child: ElevatedButton( // menggunakan elevated button
                        style: ElevatedButton.styleFrom( // tyling button
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text( // text dalam button
                          'Kembali ke Home',
                          style: TextStyle( // styling text
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () { // jika tombol di klik
                          Navigator.pushReplacement( // akan menggantikan tampilan page saat ini dengan page welcomepage pada welcome.dart
                            context,
                            MaterialPageRoute(builder: (context) => WelcomePage()),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),


                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton( // menggunakan elevated buttton sebagai tombol
                        style: ElevatedButton.styleFrom( // styling
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        // text dalam button
                        child: Text(
                          'Restart Quiz',
                          style: TextStyle( // styling
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () { // jika tombol di klik
                          quizBrain.resetQuiz(); // Reset nomor soal menggunakan resetQuiz yang ada di quizBrain
                          Navigator.pushReplacement( // mengganti halaman ke WellQuiz pada main.dart
                            context,
                            MaterialPageRoute(builder: (context) => WellQuiz()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}