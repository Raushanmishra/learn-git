import 'package:flutter/material.dart';

class Listviewpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatelessWidget {
  final List<String> items = [
    'raushan',
    'santosh',
    'hritik',
    'akshay',
    'harshit',
    'bharat',
    'ankit',
    'rohit',
    'pritam',
    'piyush',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              // Add your item click logic here
              // For example, navigate to a detail page
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(item: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String item;

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Text('Item: $item'),
      ),
    );
  }
}
