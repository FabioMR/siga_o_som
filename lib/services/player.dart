import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';

// monitorNotificationStateHandler(AudioPlayerState value) {}

class Player {
  static play(String sound) {
    // AudioPlayer().monitorNotificationStateChanges(monitorNotificationStateHandler);
    AudioCache(prefix: 'audio/').play(sound);
  }
}
