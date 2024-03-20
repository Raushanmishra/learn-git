import 'package:flutter/material.dart';
import 'package:my_project/New%20dashboard.dart';

void main() {
  runApp(Emojipage());
}

class Emojipage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love Emoji Page',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoveEmojiPage(),
      },
    );
  }
}

class LoveEmojiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love Emoji Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Spread the Love!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              '❤️',
              style: TextStyle(
                  fontSize: 120, color: Color.fromARGB(255, 244, 67, 54)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Newdashboard()),
                );
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
//hy
