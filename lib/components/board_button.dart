import 'package:flutter/material.dart';
import '../services/player.dart';

class BoardButton extends StatefulWidget {
  final int index;
  final Color color;
  final Function onPressed;

  final Map state = {'text': ''};

  final List<BoxShadow> boxShadow = [];

  BoardButton({
    @required this.index,
    @required this.color,
    @required this.onPressed,
  });

  play() {
    state['text'] = '...';
    Future.delayed(Duration(seconds: 1), () => state['text'] = '');

    final soundNumber = index + 1;
    Player.play('sound$soundNumber.wav');

    boxShadow.add(
      BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: 1),
    );
    Future.delayed(Duration(seconds: 1), () => boxShadow.clear());
  }

  @override
  _BoardButtonState createState() => _BoardButtonState();
}

class _BoardButtonState extends State<BoardButton> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: widget.boxShadow,
      ),
      child: FlatButton(
        child: Container(
          child: Text(widget.state['text']),
        ),
        onPressed: () {
          setState(() {
            widget.onPressed(widget.index);
          });

          Future.delayed(Duration(seconds: 1), () => setState(() {}));
        },
      ),
    );
  }
}
