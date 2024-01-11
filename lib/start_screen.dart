
import 'package:flutter/material.dart';




class StartScreen extends StatelessWidget{



  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;


  @override
  Widget build(context) {

    return Center(

      child: Column(

          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: 0.8,
              child: Image.asset("assets/images/quiz-logo.png",width: 300),
            ),
            const SizedBox(height: 40),

            const Text("Learn The Flutter Fun Way!",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:Colors.white
            ),),
            const SizedBox(height: 40,),

           OutlinedButton.icon(onPressed: startQuiz,
               style: OutlinedButton.styleFrom(
                 foregroundColor: Colors.white,
                 backgroundColor: Colors.indigo
               ),
               icon: const Icon(Icons.arrow_right_alt),

               label: const Text("Start Quiz"))

          ],
        )
      );

  }


  }