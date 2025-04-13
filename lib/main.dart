import 'package:flutter/material.dart';
import 'splash.dart';
import 'QuizBrain.dart';
import 'result.dart';

QuizBrain quizBrain = QuizBrain(); // inisialisasi object quizBrain yang dibuat menggunakan QuizBrain()

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
              child: QuizPage(), // memanggil class QuizPage sebagai sebagai body dari aplikasi
            ),
          ),
        ),
      ),
    );
  }
}

// membuat quiz page menggunakan stateful
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState(); // menghubungkan stateful dengan state pada class _QuizPageState
}

// membuat class _QuizPageState sebagai state dari QuizPage
class _QuizPageState extends State<QuizPage> {
  List<Color> indicators = []; // List indikator untuk setiap soal

  // menggunakan initState untuk menginisialisasi data awal
  @override
  void initState() {
    super.initState(); // memastikan fungsi initState dijalankan sepenuhnya
    indicators = List<Color>.generate(
        quizBrain.questionBankLength(), (index) => Colors.grey); // indikator warna defult grey
  }

  // membuat fungsi checkanswer sebagai logika pencocokan jawaban
  void checkAnswer(bool userPickedAnswer) { // mengambil data jawaban user
    bool correctAnswer = quizBrain.getQuestionAnswer(); // mengambil jawaban dari quizBrain
    int currentIndex = quizBrain.getQuestionNumber(); // mengambil nomor soal dari quizBrain

    // Update indikator berdasarkan jawaban user menggunakan setState
    setState(() {
      if (userPickedAnswer == correctAnswer) { // jika jawaban user/picked = corect answer (benar)
        indicators[currentIndex] = Colors.green; // indikator hijau
      } else { // jika salah
        indicators[currentIndex] = Colors.red; // indikator merah
      }

      // membuat logika untuk menentukan apkaah quiz berakhir atau belum
      if (currentIndex >= quizBrain.questionBankLength() - 1) { // menghitung nomor saat ini jika > banyaknya soal pada quizBrain
        Navigator.pushReplacement( // mengganti halaman ke result pada result.dart
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              correctAnswers: indicators.where((color) => color == Colors.green).length, // membuat variabel jumlah jawaban benar dengan menghitung jumlah indikator hijau
              totalQuestions: quizBrain.questionBankLength(), // menghitung jumlah soal pada quizBrain
            ),
          ),
        );
      } else {
        // Lanjut ke soal berikutnya
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  // membangun UI dari aplikasi
  Widget build(BuildContext context) {
    return Column( // menggunakan column agar tertata vertikal
      children: [

        // padding 1 sebagai no soal dan indikator
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0), // nilai padding
          child: Row( // row agar konten horizontal
            spacing: 20,
            children: [

              // Nomor soal di pojok kiri atas
              Expanded(
                flex: 1, // Rasio 1
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // align center
                  children: [

                    // text soal no.
                    Text(
                      "Soal No.",
                      style: TextStyle( // styling soal no
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    SizedBox(height: 10),

                    // no soal
                    Text(
                      "${quizBrain.getQuestionNumber() + 1}", // mengambil no soal saat ini pada quizBrain dan +1
                      style: TextStyle( // styling nomor soal
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ],
                ),
              ),

              // Indikator soal di pojok kanan atas
              Expanded(
                flex: 4, // Rasio untuk indikator soal
                child: SingleChildScrollView(
                  child: Wrap( // menggunakan warp agar indikator tertata rapih
                    spacing: 8.0, // Jarak horizontal antar elemen
                    runSpacing: 8.0, // Jarak vertikal antar baris
                    alignment: WrapAlignment.start, // Posisi elemen di awal baris
                    // membuat list indikator sebagai panjang soal pada quizBrain
                    children: List.generate(quizBrain.questionBankLength(), (index) {
                      return Container(
                        width: 40, // Lebar indikator
                        height: 40, // Tinggi indikator
                        decoration: BoxDecoration( //styling indikator
                          color: indicators[index], // warna sesuai dari indikator pada QuizPageState
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text( // text no soal pada indikator
                            "${index + 1}",
                            style: TextStyle( // styling text
                              // warna mengecek dari indikator, jika indikator grey, maka text hitam dan jika indikator selain grey, text putih
                              color: indicators[index] == Colors.grey ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),


        // Bagian Tengah: Teks soal menggunakan expanded agar mengisi semua ruang kosong
        Expanded(
          child: Center( // konten agar di tengah
            child: Padding( // menggunakan padding untuk bungkus soal
              padding: const EdgeInsets.all(10.0),
              child: Text( // text  soal
                quizBrain.getQuestionText(), // mengambil dari quizBrain menggunakan getQuiestionText
                textAlign: TextAlign.center,
                style: TextStyle( // tyling
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),


        // Bagian Bawah: Tombol Benar dan Salah menggunakan padding
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column( // menggunakan column agar tertatat vertikal
            children: [

              // padding 1 sebagai bungkus tombol beanr
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: TextButton(
                  style: TextButton.styleFrom( // styling text button
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    checkAnswer(true); // jika di klik mengisi checkAnswer dengan nilai True
                  },
                  child: Padding( // text dalam button
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
                      child: Text(
                        "Benar",
                        style: TextStyle( // styling text
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // padding 2 untuk tombol salah
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: TextButton(
                  style: TextButton.styleFrom( // styling text button
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    checkAnswer(false); // jika di klik mengisi checkAnswer dengan nilai False
                  },
                  child: Padding( // text dalam tombol
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
                      child: Text(
                        "Salah",
                        style: TextStyle( // styling text
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}