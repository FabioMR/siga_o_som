import 'package:flutter/material.dart';
import './board_button.dart';
import '../pages/screaming.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final maxAttempts = 10;
  int attempts = 0;

  bool canTrigger(BuildContext context, int index) {
    attempts++;

    if (attempts >= maxAttempts) {
      attempts = 0;
      Screaming.show(context);
      return false;
    }

    return true;
  }

  createBoardButton(int index) {
    final colors = [Colors.blue, Colors.red, Colors.green, Colors.yellow];

    return BoardButton(
      index: index,
      color: colors[index - 1],
      sound: 'sound$index.wav',
      canTrigger: (int index) => canTrigger(context, index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              createBoardButton(1),
              SizedBox(width: 10),
              createBoardButton(2),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              createBoardButton(3),
              SizedBox(width: 10),
              createBoardButton(4),
            ],
          ),
        ],
      ),
    );

    // return Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       createBoardButton(1),
    //       createBoardButton(2),
    //       createBoardButton(3),
    //       createBoardButton(4),
    //     ],
    //   ),
    // );
  }
}
