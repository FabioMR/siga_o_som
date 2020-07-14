import 'package:flutter/material.dart';
import '../services/player.dart';

class BoardButton extends StatelessWidget {
  final int index;
  final Color color;
  final String sound;
  final Function canTrigger;

  BoardButton(
      {@required this.index,
      @required this.color,
      @required this.sound,
      @required this.canTrigger});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              spreadRadius: 1
            )
          ],
        ),
        child: FlatButton(
          child: Container(
            height: 100,
          ),
          onPressed: () {
            if (canTrigger(index)) Player.play(sound);
          },
        ),
      ),
    );
  }
}
