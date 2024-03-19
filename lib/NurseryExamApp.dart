import 'package:flutter/material.dart';

void main() {
  runApp(NurseryExamApp());
}

class NurseryExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nursery Class Exam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddQuestionPage(),
    );
  }
}

class AddQuestionPage extends StatefulWidget {
  @override
  _AddQuestionPageState createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  List<Question> questions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Nursery Exam Questions'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: questionController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: answerController,
              decoration: InputDecoration(labelText: 'Answer'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add the question to the list
                questions.add(Question(
                  question: questionController.text,
                  answer: answerController.text,
                ));

                // Clear the text fields
                questionController.clear();
                answerController.clear();
              },
              child: Text('Add Question'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Question: ${questions[index].question}'),
                    subtitle: Text('Answer: ${questions[index].answer}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final String answer;

  Question({required this.question, required this.answer});
}
