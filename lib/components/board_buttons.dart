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
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: [
        createButton(context, 0),
        createButton(context, 1),
        createButton(context, 2),
        createButton(context, 3),
      ],
    );
  }
}
