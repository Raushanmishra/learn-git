import 'package:flutter/material.dart';

class ZoomedImagePage extends StatelessWidget {
  final String imagePath;

  ZoomedImagePage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoomed Image'),
      ),
      body: Center(
        child: Image.network(imagePath),
      ),
    );
  }
}
