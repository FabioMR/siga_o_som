import 'package:flutter/material.dart';
import './board_buttons.dart';
import './board_actions.dart';
import '../models/game_play.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  GamePlay gamePlay;

  _BoardState() {
    gamePlay = GamePlay(onSetState: setState);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: BoardButtons(
            gamePlay: gamePlay,
          ),
        ),
        Container(
          color: Colors.black38,
          height: 64,
          child: Center(
            child: BoardActions(
              gamePlay: gamePlay,
            ),
          ),
        ),
      ],
    );
  }
}
