import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:bcgdvtest/src/const/App_const.dart';
import 'package:bcgdvtest/src/model/song_model.dart';
import 'package:bcgdvtest/src/services/song_service.dart';
import 'package:bcgdvtest/src/util/string_util.dart';
import 'package:http/http.dart' as http;

class SongServiceImplementation extends SongService {
  @override
  Future<List<SongModel>> getSongList(String artistKey) async {
    final formattedKey = artistKey.isNotEmpty
        ? StringUtil.replaceWhitespaceWithPlus(artistKey)
        : 'all';
    final String requiredKey = 'term=$formattedKey&media=music';
    final String url = AppUrl.searchUrl;

    String fullyQualifiedUrl = '$url?$requiredKey';

    final response = await http.get(fullyQualifiedUrl);

    final Map body = json.decode(response.body);
    final List songList = body['results'];

    return songList
        .map((e) => SongModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<int> pause(AudioPlayer audioPlayer) async {
    return await audioPlayer.pause();
  }

  @override
  Future<int> play(AudioPlayer audioPlayer, Duration position,
      Duration duration, String url) async {
    final playPosition = (position != null &&
            duration != null &&
            position.inMilliseconds > 0 &&
            position.inMilliseconds < duration.inMilliseconds)
        ? position
        : null;
    return await audioPlayer.play(url, position: playPosition);
  }

  @override
  Future<int> stop(AudioPlayer audioPlayer) async {
    return await audioPlayer.stop();
  }

  @override
  Future<int> setPlaybackRate(AudioPlayer audioPlayer) async {
    return await audioPlayer.setPlaybackRate(playbackRate: 1.0);
  }
}
