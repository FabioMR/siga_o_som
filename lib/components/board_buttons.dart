import 'package:flutter/material.dart';
import './board_button.dart';
import '../models/game_play.dart';

class BoardButtons extends StatelessWidget {
  final GamePlay gamePlay;

  BoardButtons({
    @required this.gamePlay,
  });

  createButton(BuildContext context, int index) {
    final colors = [Colors.blue, Colors.red, Colors.green, Colors.yellow];

    return BoardButton(
      index: index,
      active: gamePlay.activeIndex == index,
      color: colors[index],
      onPressed: (int index) => gamePlay.pressButton(context, index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(child: createButton(context, 0)),
                SizedBox(width: 8),
                Expanded(child: createButton(context, 1)),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(child: createButton(context, 2)),
                SizedBox(width: 8),
                Expanded(child: createButton(context, 3)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
