import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './board_button.dart';
import '../pages/screaming.dart';
import '../models/status.dart';
import './board_actions.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final maxAttempts = 100;
  int attempts = 0;

  Status status = Status.stopped;

  List<BoardButton> buttons;

  _BoardState() {
    buttons = [
      createButton(0),
      createButton(1),
      createButton(2),
      createButton(3),
    ];
  }

  buttonPressed(BuildContext context, int index) {
    if (status != Status.playing) {
      return;
    }

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

  play() {
    setState(() {
      status = Status.playing;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          child: Center(
            child: BoardActions(
              status: status,
              onPlay: play,
            ),
          ),
        ),
      ],
    );
  }
}
