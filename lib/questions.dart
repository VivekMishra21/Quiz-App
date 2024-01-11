import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/ques.dart';


class  Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer;

  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {

  var questionIndex=0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      questionIndex=questionIndex + 1;
    });
  }



  @override
  Widget build(BuildContext context) {
    final currentQuestion=questions[questionIndex];
    return SizedBox(
      width: double.infinity,//whole size take
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,//center all thing
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(currentQuestion.text,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
            )
            ),


            const SizedBox(height: 30,),
            ...currentQuestion.getShuffleAnswer().map((answer){
              return AnswerButton(answerText: answer, onTap:(){
                answerQuestion(answer);
              });
            }
        
            )
        
          ],
        ),
      ),
    );
  }
}
