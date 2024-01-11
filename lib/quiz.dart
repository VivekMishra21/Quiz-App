import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/resultscreen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/ques.dart';


class Quiz extends StatefulWidget{
  const Quiz({super.key});



  @override
  State<Quiz> createState(){
    return _QuizState();
  }



}


class _QuizState extends State<Quiz>{

   List<String> selectedAnswer=[];
   var activeScreen="startScreen";


  // @override
  // void initState(){
  //   activeScreen=StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen(){
    setState(() {
      activeScreen="questions";
    });
  }

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);
    if(selectedAnswer.length == questions.length){
      setState(() {
        activeScreen="result-Screen";
      });

    }
  }
   void restartQuiz() {
     setState(() {

       activeScreen = 'startScreen';
     });
   }

  @override
  Widget build(context){

    Widget screenWidget=StartScreen(switchScreen);
         if(activeScreen=="questions"){
           screenWidget=Questions(onSelectAnswer: chooseAnswer);
         }
    if(activeScreen=="result-Screen"){
      screenWidget= ResultScreen(choosenAnswer:selectedAnswer,onRestart: restartQuiz,);
    }



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
              colors:[Colors.blue,
                Colors.deepPurple

               ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight
            )
          ),
          child:screenWidget,
        ),

      ),
    );
  }
}