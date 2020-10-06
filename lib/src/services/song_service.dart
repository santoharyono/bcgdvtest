import 'package:audioplayers/audioplayers.dart';
import 'package:bcgdvtest/src/model/song_model.dart';

abstract class SongService {
  Future<List<SongModel>> getSongList(String artistKey);
  Future<int> play(AudioPlayer audioPlayer, Duration position,
      Duration duration, String url);
  Future<int> pause(AudioPlayer audioPlayer);
  Future<int> stop(AudioPlayer audioPlayer);
  Future<int> setPlaybackRate(AudioPlayer audioPlayer);
}
