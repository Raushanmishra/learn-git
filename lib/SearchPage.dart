import 'package:flutter/material.dart';
import 'package:my_project/imagepage.dart';
import 'package:my_project/slideimagepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> names = [
    "Name1",
    "Name2",
    "Name3",
    "Name4",
    "Name5",
    "Name6",
    "Name7",
    "Name8",
    "Name9",
    "Name10",
    "Name11",
    "Name12",
    "Name13",
    "Name14",
    "Name15",
    // Add more names here
  ];

  List<String> filteredNames = [];

  @override
  void initState() {
    super.initState();
    filteredNames = names;
  }

  void filterNames(String query) {
    List<String> searchResults = names
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredNames = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search Name",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: filterNames,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredNames[index]),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CommonCustomBottomBar(
        currentIndex: 1, // Set the index for image slider page
        onTap: (int index) {
          // Handle navigation to other pages here
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImageGallery()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => slideimagepage()),
            );
            // No action needed, already on the image slider page
          }
        },
      ),
    );
  }
}
