import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';
import 'questions.dart';
import 'quiz_screen.dart';
import 'result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/home': (context) => HomeScreen(),
        '/quiz': (context) => QuizScreen(),
        '/result': (context) =>
            ResultScreen(totalQuestions: 0, correctAnswers: 0),
        '/question': (context) => QuestionScreen(),
        '/leaderboard': (context) => LeaderboardScreen(
              leaderboardData: [],
              userScore: null, // Tambahkan nilai null untuk parameter userScore
              userName: '', // Tambahkan nilai kosong untuk parameter userName
            ),
        '/profile': (context) => ProfileScreen()
      },
    );
  }
}
