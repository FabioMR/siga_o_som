import 'package:flutter/material.dart';
import '../components/board.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siga o som'),
      ),
      backgroundColor: Colors.teal,
      body: Board()
    );
  }
}
