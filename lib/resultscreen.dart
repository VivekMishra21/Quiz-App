import 'package:flutter/material.dart';
import 'package:quiz_app/data/ques.dart';
import 'package:quiz_app/questionSummary/questions_summary.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswer,required this.onRestart});

  final void Function() onRestart;
  final List<String> choosenAnswer;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary=[];


    for(var i=0;i<choosenAnswer.length;i++){
      summary.add({
        'question_index':i ,
        'question': questions[i].text,
        'correct_answer':questions[i].answers[0],//always first answe is correct
        'user_answer':choosenAnswer[i]
      });
    }
       return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;

    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(

      width: double.infinity,
      child: Container(

        margin: const  EdgeInsets.all(40),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
              Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',style:
               const TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(onPressed:onRestart,style:
                TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white
                ),
                icon: const Icon(Icons.home),

                label: const Text("Restart Quiz "))


          ],
        ),
      ),
    );
  }
}
