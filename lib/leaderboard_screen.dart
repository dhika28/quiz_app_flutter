import 'package:flutter/material.dart';

class LeaderboardEntry {
  final String name;
  final int score;

  LeaderboardEntry({required this.name, required this.score});
}

class LeaderboardScreen extends StatefulWidget {
  final List<LeaderboardEntry> leaderboardData;
  final String? userName;
  final int? userScore;

  LeaderboardScreen({
    required this.leaderboardData,
    required this.userName,
    required this.userScore,
  });

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  void initState() {
    super.initState();
    addQuizResultToLeaderboard();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Jika perlu, tambahkan logika penambahan data di sini
  }

  void addQuizResultToLeaderboard() {
    if (widget.userName != null &&
        widget.userName!.isNotEmpty &&
        widget.userScore != null &&
        widget.userScore! > 0) {
      setState(() {
        widget.leaderboardData.add(
          LeaderboardEntry(name: widget.userName!, score: widget.userScore!),
        );
        widget.leaderboardData.sort((a, b) => b.score.compareTo(a.score));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.blue],
          ),
        ),
        child: ListView.builder(
          itemCount: widget.leaderboardData.length,
          itemBuilder: (context, index) {
            final entry = widget.leaderboardData[index];
            return ListTile(
              title: Text('${index + 1}. ${entry.name} - ${entry.score}'),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            IconButton(
              icon: Icon(Icons.leaderboard, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
