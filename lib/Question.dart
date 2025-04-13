class Question{
  //atribut dari question
  //questionText diset blank sebagai default soal
  //questionAnswer diset true sebagai default answer
  String questionText = 'blank';
  bool questionAnswer = true;

  //constructor untuk question = q dan answer = a
  //parameter q digunakan untuk mengisi artibut questionText
  //parameter a digunakan untuk mengisi atribut questionAnswer
  Question({required String q,required bool a}){
    questionText = q;
    questionAnswer = a;
  }
}