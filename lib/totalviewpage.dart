import 'package:flutter/material.dart';

void main() {
  runApp(Totalviewpage());
}

class Totalviewpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TotalViewsPage(),
    );
  }
}

class TotalViewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Views'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.remove_red_eye, // You can use a different icon here
              size: 100.0,
              color: Colors.blue, // Customize the icon color
            ),
            SizedBox(height: 20.0),
            Text(
              'Total Views',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '10,000', // Replace with your actual total views count
              style: TextStyle(
                fontSize: 36.0,
                color: Colors.blue, // Customize the text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
