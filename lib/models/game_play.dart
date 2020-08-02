import 'package:flutter/material.dart';
import '../pages/screaming.dart';
import '../pages/game_over.dart';
import '../services/player.dart';
import 'dart:math';

enum GamePlayStatus { stopped, showing, playing }

class GamePlay {
  final Function onSetState;
  final screamingCount = 10;

  GamePlayStatus status = GamePlayStatus.stopped;
  int activeIndex;

  int showCount = 0;
  int playCount = 0;
  List plays = [];

  GamePlay({
    @required this.onSetState,
  });

  start() {
    showCount = 0;
    playCount = 0;
    plays = [];

    _startShowMode();
  }

  pressButton(BuildContext context, int index) async {
    if (status != GamePlayStatus.playing) return;

    playCount++;

    if (playCount == screamingCount) {
      showScreaming(context);
      _stop();
      return;
    }

    if (plays[playCount - 1] != index) {
      showGameOver(context);
      _stop();
      return;
    }

    _activeButton(index);

    if (playCount == showCount) {
      _startShowMode();
    }
  }

  _activeButton(int index) {
    Player.play('sound$index.wav');

    onSetState(() => activeIndex = index);
    Future.delayed(Duration(milliseconds: 300), () {
      onSetState(() => activeIndex = null);
    });
  }

  _startShowMode() async {
    if (showCount > 0) await Future.delayed(Duration(seconds: 1));
    onSetState(() => status = GamePlayStatus.showing);

    showCount++;
    plays.add(Random().nextInt(3));
    await Future.delayed(Duration(seconds: 1));

    for (var play in plays) {
      _activeButton(play);
      await Future.delayed(Duration(seconds: 1));
    }

    _startPlayMode();
  }

  _startPlayMode() {
    playCount = 0;
    onSetState(() => status = GamePlayStatus.playing);
  }

  _stop() {
    onSetState(() => status = GamePlayStatus.stopped);
  }
}
