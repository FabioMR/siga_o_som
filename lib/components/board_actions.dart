import 'package:flutter/material.dart';
import '../models/status.dart';

class BoardActions extends StatelessWidget {
  final Status status;
  final Function onPlay;

  BoardActions({this.status, this.onPlay});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.stopped:
        return RaisedButton(
          child: Text('INICIAR'),
          onPressed: onPlay,
        );
      case Status.showing:
        return Text('Memorize...');
      case Status.playing:
        return Text('Sua vez!');
      default:
        return Container();
    }
  }
}
