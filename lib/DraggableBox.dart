import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DraggableBox(),
    );
  }
}

class DraggableBox extends StatefulWidget {
  @override
  _DraggableBoxState createState() => _DraggableBoxState();
}

class _DraggableBoxState extends State<DraggableBox> {
  Offset _position = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Box Example'),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: _position.dx,
              top: _position.dy,
              child: Draggable(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Drag me!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                feedback: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue.withOpacity(0.7),
                  child: Center(
                    child: Text(
                      'Drag me!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onDraggableCanceled: (velocity, offset) {
                  setState(() {
                    _position = offset;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
