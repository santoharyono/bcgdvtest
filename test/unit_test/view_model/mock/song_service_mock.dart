import 'package:bcgdvtest/src/model/song_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bcgdvtest/src/services/song_service.dart';

class SongServiceMock extends SongService {
  @override
  Future<List<SongModel>> getSongList(String artistKey) {
    List<SongModel> songListResponse = [];
    songListResponse.add(SongModel(
        trackId: 1,
        trackName: 'track1',
        artistName: 'artist1',
        collectionName: 'collection1',
        artworkUrl: 'artwork1',
        previewUrl: 'previewUrl',
        isSelected: false));
    return Future.delayed(Duration.zero, () {
      return songListResponse;
    });
  }

  @override
  Future<int> pause(AudioPlayer audioPlayer) {
    return Future.delayed(Duration.zero, () {
      return 1;
    });
  }

  @override
  Future<int> play(AudioPlayer audioPlayer, Duration position,
      Duration duration, String url) {
    return Future.delayed(Duration.zero, () {
      return 1;
    });
  }

  @override
  Future<int> stop(AudioPlayer audioPlayer) {
    return Future.delayed(Duration.zero, () {
      return 1;
    });
  }

  @override
  Future<int> setPlaybackRate(AudioPlayer audioPlayer) {
    return Future.delayed(Duration.zero, () {
      return 1;
    });
  }
}
