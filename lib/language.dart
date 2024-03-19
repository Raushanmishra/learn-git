// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(EnglishToHindiTranslator());
}

class EnglishToHindiTranslator extends StatefulWidget {
  @override
  _EnglishToHindiTranslatorState createState() =>
      _EnglishToHindiTranslatorState();
}

class _EnglishToHindiTranslatorState extends State<EnglishToHindiTranslator> {
  TextEditingController _textEditingController = TextEditingController();
  String _translatedText = "";

  get http => null;

  Future<void> translateToHindi(String text) async {
    final apiKey = 'YOUR_API_KEY_HERE'; // Replace with your API key
    final apiUrl =
        'https://translate.yandex.net/api/v1.5/tr.json/translate?key=$apiKey&text=$text&lang=en-hi';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _translatedText = data['text'][0];
      });
    } else {
      throw Exception('Failed to load translation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('English to Hindi Translator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Enter English Text',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  final text = _textEditingController.text;
                  if (text.isNotEmpty) {
                    translateToHindi(text);
                  }
                },
                child: Text('Translate to Hindi'),
              ),
              SizedBox(height: 20.0),
              Text(
                'Translated Text:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(_translatedText),
            ],
          ),
        ),
      ),
    );
  }
}
