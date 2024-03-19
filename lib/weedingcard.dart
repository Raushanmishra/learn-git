import 'package:flutter/material.dart';

class WeddingCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wedding Card Generator',
      home: WeddingCardPage(),
    );
  }
}

class WeddingCardPage extends StatefulWidget {
  @override
  _WeddingCardPageState createState() => _WeddingCardPageState();
}

class _WeddingCardPageState extends State<WeddingCardPage> {
  String brideName = '';
  String groomName = '';
  String weddingDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wedding Card Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Bride\'s Name:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  brideName = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Brida/-Name',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Groom\'s - Name',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  groomName = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter groom\'s name',
              ),
            ),
            SizedBox(height: 16),
            Text(
              '01/01/2024:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  weddingDate = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter wedding date',
              ),
            ),
            SizedBox(height: 32),
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Wedding Invitation',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'You are cordially invited to the wedding of',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '$brideName & $groomName',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'on',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '$weddingDate',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
