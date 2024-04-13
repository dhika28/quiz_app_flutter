import 'package:flutter/material.dart';
import 'leaderboard_screen.dart'; // Pastikan untuk mengimpor LeaderboardScreen jika belum diimpor sebelumnya

class ResultScreen extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;

  ResultScreen({
    required this.totalQuestions,
    required this.correctAnswers,
  });

  int? get correctAnswersCount => null;

  @override
  Widget build(BuildContext context) {
    int incorrectAnswers = totalQuestions - correctAnswers;
    double percentage = (correctAnswers / totalQuestions) * 100;

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.blue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz Completed!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Total Questions: $totalQuestions',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 61, 228, 250),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Correct Answers: $correctAnswers',
                  style: TextStyle(fontSize: 18.0, color: Colors.green),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Incorrect Answers: $incorrectAnswers',
                  style: TextStyle(fontSize: 18.0, color: Colors.red),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Percentage: ${percentage.toStringAsFixed(2)}%',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to home screen
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                child: Text('Back to Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                  textStyle: TextStyle(fontSize: 20.0, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  // Simpan skor dan nama pengguna
                  int? userScore =
                      correctAnswersCount; // Menggunakan nilai skor yang diperoleh dari hasil kuis
                  String userName = ''; // Inisialisasi nama pengguna
                  final Map<String, dynamic>? args =
                      ModalRoute.of(context)!.settings.arguments as Map<String,
                          dynamic>?; // Mendapatkan argumen dari navigator
                  if (args != null) {
                    userName = args[
                        'userName']; // Mengambil nama pengguna dari argumen
                  }

                  // Navigasi ke LeaderboardScreen dan kirim data skor serta nama pengguna
                  Navigator.pushReplacementNamed(
                    context,
                    '/leaderboard',
                    arguments: {
                      'userName': userName,
                      'userScore': correctAnswersCount,
                    },
                  );
                },
                child: Text('Submit Score'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                  textStyle: TextStyle(fontSize: 20.0, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
