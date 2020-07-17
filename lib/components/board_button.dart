import 'package:flutter/material.dart';
import '../services/player.dart';

class BoardButton extends StatefulWidget {
  final int index;
  final Color color;
  final Function onPressed;

  final Map state = {'active': false};
  final duration = Duration(milliseconds: 300);

  BoardButton({
    @required this.index,
    @required this.color,
    @required this.onPressed,
  });

  play() {
    final soundNumber = index + 1;
    Player.play('sound$soundNumber.wav');

    state['active'] = true;
    Future.delayed(duration, () => state['active'] = false);
  }

  @override
  _BoardButtonState createState() => _BoardButtonState();
}

class _BoardButtonState extends State<BoardButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AnimatedPhysicalModel(
        duration: widget.duration,
        elevation: widget.state['active'] ? 0 : 5,
        shape: BoxShape.rectangle,
        shadowColor: Colors.black,
        color: widget.state['active'] ? widget.color : widget.color.withAlpha(180),
        child: Container()
      ),
      onTap: () {
        setState(() {
          widget.onPressed(widget.index);
        });

        Future.delayed(widget.duration, () => setState(() {}));
      },
    );
  }
}
