import 'package:flutter/material.dart';
import 'package:my_project/imagepage.dart';

void main() => runApp(gifpage());

class gifpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'gifpage';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
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
          backgroundColor: Colors.green,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 550.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://via.placeholder.com/800x600/87CEEB/000000?text=Scenery'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://via.placeholder.com/800x600/32CD32/000000?text=Nature'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: 240.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://via.placeholder.com/800x600/F08080/000000?text=Sunset'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://via.placeholder.com/800x600/8A2BE2/000000?text=Mountains'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://via.placeholder.com/800x600/FFD700/000000?text=Beach'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
