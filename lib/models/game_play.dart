import 'package:flutter/material.dart';
import '../pages/screaming.dart';
import '../services/player.dart';

enum GamePlayStatus { stopped, showing, playing }

class GamePlay {
  final Function onSetState;

  final duration = Duration(milliseconds: 300);

  Screaming screaming = Screaming();
  GamePlayStatus status = GamePlayStatus.stopped;
  int activeIndex;

  GamePlay({
    @required this.onSetState,
  });

  start() {
    onSetState(() => status = GamePlayStatus.playing);
  }

  stop() {
    onSetState(() => status = GamePlayStatus.stopped);
  }

  pressButton(BuildContext context, int index) {
    if (status != GamePlayStatus.playing) return;

    if (screaming.show(context)) {
      screaming = Screaming();
      stop();
      return;
    }

    Player.play('sound$index.wav');

    onSetState(() => activeIndex = index);
    Future.delayed(duration, () {
      onSetState(() => activeIndex = null);
    });
  }
}
