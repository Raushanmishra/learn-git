import 'package:flutter/material.dart';

void main() {
  runApp(Followerspage());
}

class Followerspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FollowersPage(),
    );
  }
}

class FollowersPage extends StatelessWidget {
  // Example list of follower names
  final List<String> followers = [
    'Follower 1',
    'Follower 2',
    'Follower 3',
    'Follower 4',
    'Follower 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers'),
      ),
      body: ListView.builder(
        itemCount: followers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              // You can use profile pictures instead of initials
              child: Text(followers[index][0]), // Display initials
            ),
            title: Text(followers[index]),
            onTap: () {
              // Handle tapping on a follower (e.g., navigate to the follower's profile)
              // You can customize this action according to your needs.
            },
          );
        },
      ),
    );
  }
}
