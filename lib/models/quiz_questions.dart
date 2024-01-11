class QuizQuestion{
 const QuizQuestion(this.text,this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffleAnswer(){
  final shuffleAnswer= List.of(answers);
  shuffleAnswer.shuffle();
  return shuffleAnswer;

  }


}