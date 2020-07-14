import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siga o som',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}


// import 'package:audioplayers/audio_cache.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Siga o som',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final player = AudioCache(prefix: 'audio/');

//   final maxAttempts = 10;
//   final secondsToRestart = 5;
//   int attempts = 0;

//   Widget createButton({Color color, String sound}) {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.zero,
//         shape: BoxShape.rectangle,
//         boxShadow: const <BoxShadow>[
//           BoxShadow(
//             color: Colors.purple,
//             blurRadius: 30.0,
//             spreadRadius: 1.0,
//           )
//         ],
//       ),
//       child: FlatButton(
//         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         child: Container(
//           width: 50,
//           height: 50,
//         ),
//         onPressed: () {
//           setState(() {
//             attempts++;
//           });

//           if (attempts < maxAttempts) {
//             player.play(sound);
//           } else {
//             player.play('screaming.wav');
//             Future.delayed(Duration(seconds: secondsToRestart), () {
//               setState(() {
//                 attempts = 0;
//               });
//             });
//           }
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> buttons = [
//       createButton(color: Colors.blue, sound: 'sound1.wav'),
//       createButton(color: Colors.red, sound: 'sound2.wav'),
//       createButton(color: Colors.green, sound: 'sound3.wav'),
//       createButton(color: Colors.yellow, sound: 'sound4.wav'),
//     ];

//     final scaffold = Scaffold(
//       appBar: AppBar(
//         title: Text('Siga o som'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: buttons,
//         ),
//       ),
//     );

//     final scare = Container(
//       color: Colors.black87,
//       child: Center(
//         child: Image.asset('assets/images/scare.jpg'),
//       ),
//     );

//     return attempts < maxAttempts ? scaffold : scare;
//   }
// }
