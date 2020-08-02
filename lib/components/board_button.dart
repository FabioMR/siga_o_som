import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  final int index;
  final bool active;
  final Color color;
  final Function onPressed;

  BoardButton({
    @required this.index,
    @required this.active,
    @required this.color,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AnimatedPhysicalModel(
        duration: Duration(milliseconds: 300),
        elevation: active ? 0 : 5,
        shape: BoxShape.rectangle,
        shadowColor: Colors.black,
        color: active ? color : color.withAlpha(180),
        child: Container(),
      ),
      onTap: () => onPressed(index),
    );
  }
}
