import 'package:audioplayers/audio_cache.dart';

class Player {
  static play(String sound) {
    AudioCache(prefix: 'audio/').play(sound);
  }
}
