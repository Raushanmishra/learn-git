import 'package:flutter/material.dart';
import 'package:my_project/imagepage.dart';

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImageGallery()),
            );
            // Handle back button press here.
          },
        ),
        actions: [
          isEditing
              ? IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    // Handle save button press here.
                    // Save the edited information and update the UI.
                    setState(() {
                      isEditing = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Enable editing mode when the edit button is pressed.
                    setState(() {
                      isEditing = true;
                    });
                  },
                ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundColor: Color.fromARGB(255, 158, 158, 158),
              child: Stack(
                children: <Widget>[
                  // Profile Photo
                  ClipOval(
                    child: Image.network(
                      'https://via.placeholder.com/800x600/8A2BE2/000000?text=Mountains',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Camera Icon (Edit)
                  isEditing
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.camera_alt),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              onPressed: () {
                                // Handle edit profile photo here.
                              },
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                enabled: isEditing,
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                enabled: isEditing,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Add more text fields for other profile information as needed.
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
