import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:my_project/Tictactoe.dart';
import 'package:my_project/VideoAlbumPage.dart';
import 'package:my_project/balancepage.dart';
import 'package:my_project/emoji.dart';
import 'package:my_project/followerspage%20.dart';
import 'package:my_project/imagepage.dart';
import 'package:my_project/listview.dart';
import 'package:my_project/notificationpage.dart';
import 'package:my_project/settingpage.dart';

void main() {
  runApp(Newdashboard());
}

class Newdashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Dashboard'),
        backgroundColor: Colors.purple, // Customize the app bar color
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageGallery()),
              );
            },
            child: DashboardCard(
              title: 'ImageGallery',
              value: '100',
              color: Color.fromARGB(255, 33, 82, 243),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TicTacToe()),
              );
            },
            child: DashboardCard(
              title: 'TicTacToe',
              value: 'game',
              color: Color.fromARGB(255, 101, 76, 175),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notificationpage()),
              );
            },
            child: DashboardCard(
              title: 'Notifications',
              value: '10',
              color: Color.fromARGB(255, 255, 153, 0),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Balancepage()),
              );
            },
            child: DashboardCard(
              title: ' Bank Balance',
              value: '\$1,000',
              color: Color.fromARGB(255, 244, 67, 54),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settingspage()),
              );
            },
            child: DashboardCard(
              title: 'Settings',
              value: 'Edit',
              color: Color.fromARGB(255, 0, 150, 135),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoAlbumPage(
                          videos: [
                            VideoData(
                              title: 'Lal gaghra',
                              thumbnail:
                                  'https://via.placeholder.com/800x600/FFD700/000000?text=Beach',
                              link:
                                  'https://youtu.be/qZId59qml_4?si=qpnwBxcCS4jNXl3E',
                            ),
                            VideoData(
                              title: 'Rasgulla ',
                              thumbnail:
                                  'https://via.placeholder.com/800x600/87CEEB/000000?text=Scenery',
                              link:
                                  'https://youtu.be/oJOKRI3ThwA?si=fD-XSl5ZdCLFb-4M',
                            ),
                            // Add more VideoData objects for other videos.
                          ],
                        )),
              );
            },
            child: DashboardCard(
              title: 'Videos',
              value: '2',
              color: Color.fromARGB(255, 33, 233, 30),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  DashboardCard(
      {required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      gradient: LinearGradient(
        colors: [color.withOpacity(0.8), color],
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
