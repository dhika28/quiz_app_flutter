import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? userName; // Variabel untuk menyimpan nama pengguna
  String? selectedCategory; // Variabel untuk menyimpan kategori yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.blue],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter Your Name:',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    userName = value; // Simpan nama pengguna saat diubah
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Select Quiz Category:',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                value: selectedCategory,
                items: ['Sejarah', 'Geografi', 'Sains'].map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child:
                        Text(category, style: TextStyle(color: Colors.black)),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedCategory =
                        value; // Simpan kategori yang dipilih saat diubah
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Select Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (userName != null && selectedCategory != null) {
                    // Navigasi ke QuestionScreen dengan membawa nama pengguna dan kategori yang dipilih
                    Navigator.pushNamed(
                      context,
                      '/question',
                      arguments: {
                        'userName': userName,
                        'selectedCategory': selectedCategory,
                      },
                    );
                  } else {
                    // Tampilkan pesan kesalahan jika nama pengguna atau kategori tidak dipilih
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text(
                              'Please enter your name and select a category.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    'Start Quiz',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
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
