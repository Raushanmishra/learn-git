import 'package:flutter/material.dart';

class Balancepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BalancePage(),
    );
  }
}

class BalancePage extends StatelessWidget {
  // Example balance data
  final double balance = 1000.00; // Replace with your actual balance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Balance'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your Current Balance',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '\$$balance', // Display the balance with a currency symbol
              style: TextStyle(
                fontSize: 36.0,
                color: Colors.green, // Customize the text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
