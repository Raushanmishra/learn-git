import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      home: TicTacToe(),
    );
  }
}

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<String> board = List.filled(9, ''); // Initialize an empty board
  String currentPlayer = 'X';
  String winner = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tic-Tac-Toe',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _onTileTapped(index),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: board[index] == 'X'
                            ? Colors.red
                            : board[index] == 'O'
                                ? const Color.fromARGB(255, 244, 54, 197)
                                : const Color.fromARGB(255, 54, 244, 67)),
                    child: Center(
                      child: Text(
                        board[index],
                        style: TextStyle(
                            fontSize: 36, color: Colors.lime), // Text color
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              winner.isNotEmpty
                  ? 'Winner: $winner'
                  : 'Current Player: $currentPlayer',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetBoard,
              child: Text('Reset Game'),
            ),
          ],
        ),
      ),
    );
  }

  void _onTileTapped(int index) {
    if (board[index].isEmpty && winner.isEmpty) {
      setState(() {
        board[index] = currentPlayer;
        if (_checkWinner()) {
          winner = currentPlayer;
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkWinner() {
    // Check rows, columns, and diagonals
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] == currentPlayer &&
          board[i * 3 + 1] == currentPlayer &&
          board[i * 3 + 2] == currentPlayer) {
        return true;
      }
      if (board[i] == currentPlayer &&
          board[i + 3] == currentPlayer &&
          board[i + 6] == currentPlayer) {
        return true;
      }
    }
    if ((board[0] == currentPlayer &&
            board[4] == currentPlayer &&
            board[8] == currentPlayer) ||
        (board[2] == currentPlayer &&
            board[4] == currentPlayer &&
            board[6] == currentPlayer)) {
      return true;
    }
    return false;
  }

  void _resetBoard() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
      winner = '';
    });
  }
}
