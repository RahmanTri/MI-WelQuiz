import 'Question.dart';

//membuat class quiz brain sebagai logika quiz
class QuizBrain{
  int _questionNumber = 0; //menginisialisasikan nomor quiz agar 0

  //list soal dan jawaban
  List <Question> _questionBank = [
    Question(q: 'HIMTI adalah nama Himpunan Mahasiswa Manajemen Informatika', a: false),
    Question(q: 'Fakultas Vokasi berada di kampus Lidah Wetan', a: false),
    Question(q: 'Visual Studio Code adalah software visual editor', a: false),
    Question(q: 'Di D4 Manajemen Informatika di ajarkan pembuatan WEB', a: true),
    Question(q: 'Masuk D4 Manajemen Informatika wajib bisa ngoding', a: false),
    Question(q: 'D4 Manajemen Informatika harus bisa memperbaiki AC dan Kipas Angin', a: false),
    Question(q: 'Pembelajaran di D4 Manajemen Informatika berbasis proyek', a: true),
    Question(q: 'S.Kom dan S.Tr.Kom itu sama', a: false),
    Question(q: 'Kaprodi D4 Manajemen Informatika adalah pak Faris', a: false),
    Question(q: 'D4 Manajemen Informatika mempunyai Lab Komputer pribadi', a: true),
    Question(q: 'Ketika semester 1, Mahasiswa D4 Manajemen Informatika bisa menjabat sebagai ketua himpunan', a: false),
    Question(q: 'Unreal Engine merupakan mesin kendaraan', a: false)
  ];

  // fungsi untuk soal berikutnya dengan cara menambah nomor soal jika no soal < jumlah soal pada question bank
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  // fungsi untuk mengambil jumlah soal pada question bank
  int questionBankLength() {
    return _questionBank.length;
  }

  // fungsi untuk mengambil no soal
  int getQuestionNumber() {
    return _questionNumber;
  }

  // fungsi untuk reset quiz
  void resetQuiz() {
    _questionNumber = 0;
  }

  // fungsi untuk mengambil soal dengan cara mengambil soal pada question bank sesuai dengan no soal
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

  // fungsi untuk mengambil jawaban dengan cara mengambil jawaban pada question bank sesuai dengan no soal
  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
}