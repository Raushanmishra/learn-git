import 'package:flutter/material.dart';

void main() {
  runApp(Bookmarkpage());
}

class Bookmarkpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookmarkPage(
        
      ),
    );
  }
}

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  // Example list of bookmarked items
  List<String> bookmarks = [
    'Bookmark 1',
    'Bookmark 2',
    'Bookmark 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: ListView.builder(
        itemCount: bookmarks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(bookmarks[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Remove the bookmark when the delete button is pressed
                setState(() {
                  bookmarks.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new bookmark
          setState(() {
            bookmarks.add('New Bookmark');
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
