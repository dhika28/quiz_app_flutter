import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/quiz_screen.dart';
import 'result_screen.dart'; // pastikan untuk mengimpor ResultScreen jika belum diimpor sebelumnya

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Ibukota negara Indonesia adalah?',
      'options': ['Jakarta', 'Bandung', 'Surabaya', 'Yogyakarta'],
      'correctAnswer': 'Jakarta'
    },
    {
      'question': 'Pulau terbesar di Indonesia adalah?',
      'options': ['Jawa', 'Sumatera', 'Kalimantan', 'Sulawesi'],
      'correctAnswer': 'Kalimantan'
    },
    {
      'question': 'Gunung tertinggi di Indonesia adalah?',
      'options': [
        'Gunung Rinjani',
        'Gunung Semeru',
        'Gunung Kerinci',
        'Gunung Everest'
      ],
      'correctAnswer': 'Gunung Kerinci'
    },
    {
      'question': 'Provinsi paling barat di Indonesia adalah?',
      'options': [
        'Aceh',
        'Papua Barat',
        'Nusa Tenggara Timur',
        'Sumatera Barat'
      ],
      'correctAnswer': 'Aceh'
    },
    {
      'question': 'Pulau terkecil di Indonesia adalah?',
      'options': ['Pulau Komodo', 'Pulau Rote', 'Pulau Bali', 'Pulau Ternate'],
      'correctAnswer': 'Pulau Komodo'
    },
    {
      'question': 'Laut terbesar di Indonesia adalah?',
      'options': ['Laut Jawa', 'Laut Flores', 'Laut Banda', 'Laut Natuna'],
      'correctAnswer': 'Laut Natuna'
    },
    {
      'question': 'Gunung api tertinggi di Indonesia adalah?',
      'options': [
        'Gunung Merapi',
        'Gunung Tambora',
        'Gunung Bromo',
        'Gunung Agung'
      ],
      'correctAnswer': 'Gunung Tambora'
    },
    {
      'question': 'Provinsi terkecil di Indonesia adalah?',
      'options': ['DKI Jakarta', 'DI Yogyakarta', 'Bali', 'Banten'],
      'correctAnswer': 'Bali'
    },
    {
      'question': 'Sungai terpanjang di Indonesia adalah?',
      'options': [
        'Sungai Kapuas',
        'Sungai Musi',
        'Sungai Citarum',
        'Sungai Mahakam'
      ],
      'correctAnswer': 'Sungai Kapuas'
    },
    {
      'question': 'Pulau terluar di Indonesia adalah?',
      'options': ['Pulau Miangas', 'Pulau Rote', 'Pulau Weh', 'Pulau Natuna'],
      'correctAnswer': 'Pulau Miangas'
    },
  ];

  int currentIndex = 0;
  int correctAnswersCount = 0;
  late Timer timer;
  int timerDuration = 60; // Waktu total dalam detik untuk semua pertanyaan

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerDuration == 0) {
        timer.cancel();
        handleTimeout();
      } else {
        setState(() {
          timerDuration--;
        });
      }
    });
  }

  void handleTimeout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          totalQuestions: questions.length,
          correctAnswers: correctAnswersCount,
        ),
      ),
    );
  }

  void _navigateToQuizScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            QuizScreen(), // Ganti dengan widget layar kuis Anda
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertanyaan ${currentIndex + 1}'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 20.0,
            left: 20.0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'Sisa waktu: $timerDuration detik',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  questions[currentIndex]['question'],
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    questions[currentIndex]['options'].length,
                    (index) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (questions[currentIndex]['options'][index] ==
                                questions[currentIndex]['correctAnswer']) {
                              correctAnswersCount++;
                            }
                            if (currentIndex < questions.length - 1) {
                              currentIndex++;
                            } else {
                              timer.cancel();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                    totalQuestions: questions.length,
                                    correctAnswers: correctAnswersCount,
                                  ),
                                ),
                              );
                            }
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (states) => Colors.white,
                          ),
                        ),
                        child: Text(
                          questions[currentIndex]['options'][index],
                          style: TextStyle(color: Colors.blue),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
    );
  }
}
