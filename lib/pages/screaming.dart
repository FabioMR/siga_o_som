import 'package:flutter/material.dart';
import '../services/player.dart';

class Screaming extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.8);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  static show(BuildContext context) {
    Player.play('screaming.wav');

    Navigator.push(context, Screaming());
    Future.delayed(Duration(seconds: 4), () => Navigator.pop(context));
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SafeArea(
      child: FittedBox(
        child: Image.asset('assets/images/scare.jpg'),
        fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
