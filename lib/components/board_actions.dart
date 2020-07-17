import 'package:flutter/material.dart';
import '../models/game_play.dart';

class BoardActions extends StatelessWidget {
  final GamePlay gamePlay;

  BoardActions({
    @required this.gamePlay,
  });

  @override
  Widget build(BuildContext context) {
    switch (gamePlay.status) {
      case GamePlayStatus.stopped:
        return RaisedButton(
          child: Text('INICIAR'),
          onPressed: gamePlay.start,
        );
      case GamePlayStatus.showing:
        return Text('Memorize...');
      case GamePlayStatus.playing:
        return Text('Sua vez!');
      default:
        return Container();
    }
  }
}
