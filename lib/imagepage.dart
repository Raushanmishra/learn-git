import 'package:flutter/material.dart';
import 'package:my_project/MyHomePage.dart';
import 'package:my_project/ProfilePage.dart';
import 'package:my_project/SearchPage.dart';
import 'package:my_project/TabBarDemo.dart';
import 'package:my_project/emoji.dart';
import 'package:my_project/gifpage.dart';
import 'package:my_project/slideimagepage.dart';
import 'package:my_project/zoomimage.dart';

// Import your custom side drawer
// void main() {
//   runApp(ImageGallery());
// }
class ImageGallery extends StatefulWidget {
  const ImageGallery({Key? key}) : super(key: key);

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final List<String> imagePaths = [
    'https://via.placeholder.com/400x300/69c7db/000000?text=Image+1',
    'https://via.placeholder.com/800x600/FFD700/000000?text=Beach',
    'https://via.placeholder.com/800x600/8A2BE2/000000?text=Mountains',
    'https://via.placeholder.com/800x600/F08080/000000?text=Sunset',
    'https://via.placeholder.com/800x600/32CD32/000000?text=Nature',
    'https://via.placeholder.com/800x600/87CEEB/000000?text=Scenery',
    'https://via.placeholder.com/400x300/69c7db/000000?text=Image+1',
    'https://via.placeholder.com/800x600/FFD700/000000?text=Beach',
    'https://via.placeholder.com/800x600/8A2BE2/000000?text=Mountains',
    'https://via.placeholder.com/800x600/F08080/000000?text=Sunset',
    'https://via.placeholder.com/800x600/32CD32/000000?text=Nature',
    'https://via.placeholder.com/800x600/87CEEB/000000?text=Scenery',
    'https://via.placeholder.com/400x300/69c7db/000000?text=Image+1',
    'https://via.placeholder.com/800x600/FFD700/000000?text=Beach',
    'https://via.placeholder.com/800x600/8A2BE2/000000?text=Mountains',
    'https://via.placeholder.com/800x600/F08080/000000?text=Sunset',
    'https://via.placeholder.com/800x600/32CD32/000000?text=Nature',
    'https://via.placeholder.com/800x600/87CEEB/000000?text=Scenery',
    'https://via.placeholder.com/400x300/69c7db/000000?text=Image+1',
    'https://via.placeholder.com/800x600/FFD700/000000?text=Beach',
    'https://via.placeholder.com/800x600/8A2BE2/000000?text=Mountains',
    'https://via.placeholder.com/800x600/F08080/000000?text=Sunset',
    'https://via.placeholder.com/800x600/32CD32/000000?text=Nature',
    'https://via.placeholder.com/800x600/87CEEB/000000?text=Scenery',

    // Add paths for all 10 images
  ];
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Add navigation logic for each tab here
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImageGallery()),
      );
      // Navigate to Home Page
      // Example: Navigator.pushNamed(context, '/home');
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
      // Navigate to Search Page
      // Example: Navigator.pushNamed(context, '/search');
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => slideimagepage()),
      );
      // Navigate to Image Slider Page
      // Example: Navigator.pushNamed(context, '/imageSlider');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
        backgroundColor: const Color.fromARGB(255, 92, 39, 176),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: CommonSideDrawer(), // Use the common Side Drawer
      bottomNavigationBar: CommonCustomBottomBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
      //bottomNavigatorBar
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ZoomedImagePage(
                    imagePath: imagePaths[index],
                  ),
                ),
              );
            },
            child: Image.network(imagePaths[index]),
          );
        },
      ),
    );
  }
}

class CommonCustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CommonCustomBottomBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'Image Slider',
        ),
      ],
    );
  }
}

class CommonSideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Raushan Mishra"), // Replace with the user's name
            accountEmail:
                Text("ykomishra60@gmail.com"), // Replace with the user's email
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child:
                  Icon(Icons.person), // You can use a user's profile image here
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('TabBar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TabBarDemo()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.face),
            title: Text('Profile gif view'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => awesome()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.face),
            title: Text('Photo gif slider'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => gifpage()),
              );
            },
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}
