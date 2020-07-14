import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './board_button.dart';
import '../pages/screaming.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final maxAttempts = 100;
  int attempts = 0;

  List<BoardButton> buttons;

  buttonPressed(BuildContext context, int index) {
    attempts++;

    if (attempts >= maxAttempts) {
      attempts = 0;
      Screaming.show(context);
    } else {
      buttons[index].play();
    }
  }

  createButton(int index) {
    final colors = [Colors.blue, Colors.red, Colors.green, Colors.yellow];

    return BoardButton(
      index: index,
      color: colors[index],
      onPressed: (int index) => buttonPressed(context, index),
    );
  }

  @override
  Widget build(BuildContext context) {
    buttons = [
      createButton(0),
      createButton(1),
      createButton(2),
      createButton(3),
    ];

    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: buttons,
          ),
        ),
        Container(
          color: Colors.black38,
          height: 100,
        ),
      ],
    );
  }
}
