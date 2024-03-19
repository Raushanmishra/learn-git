import 'package:flutter/material.dart';
import 'package:my_project/New%20dashboard.dart';

class Notificationpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Newdashboard()),
            );

            //Navigate back
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          NotificationItem(
            title: 'New Message',
            message: 'You have a new message from John.',
          ),
          NotificationItem(
            title: 'Order Shipped',
            message: 'Your order has been shipped.',
          ),
          NotificationItem(
            title: 'Special Offer',
            message: 'Today is a special day!',
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;

  NotificationItem({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications),
      title: Text(title),
      subtitle: Text(message),
    );
  }
}
