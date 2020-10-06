import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bcgdvtest/src/model/song_model.dart';
import 'package:bcgdvtest/src/services/service_injector.dart';
import 'package:bcgdvtest/src/services/song_service.dart';
import 'package:flutter/foundation.dart';

enum SongState { none, success, failed, fetching }
enum PlayerState { stop, play, pause }

class HomeViewModel extends ChangeNotifier {
  final SongService _songService = injector<SongService>();
  SongState _songState = SongState.none;
  List<SongModel> _songList = [];
  PlayerState _playerState = PlayerState.stop;
  Duration _position;
  Duration _duration;
  AudioPlayer _audioPlayer;
  AudioPlayerState _audioPlayerState;
  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerStateSubscription;
  StreamSubscription _playerErrorSubscription;

  get isPlaying => _playerState == PlayerState.play;
  get isPaused => _playerState == PlayerState.pause;
  get isStopped => _playerState == PlayerState.stop;
  get audioPlayerState => _audioPlayerState;

  SongState get songState {
    final currentSongState = _songState;
    _songState = SongState.none;
    return currentSongState;
  }

  Duration get position {
    return _position;
  }

  Duration get duration {
    return _duration;
  }

  List<SongModel> get songList {
    return _songList;
  }

  PlayerState get playerState {
    return _playerState;
  }

  void getSongList({String artist = ''}) {
    _songState = SongState.fetching;
    notifyListeners();
    _songService.getSongList(artist).then((value) {
      _songList = value;
      _songState = SongState.success;
      notifyListeners();
    }, onError: (error) {
      return;
    });
  }

  void initAudio() {
    _audioPlayer = AudioPlayer();
    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      _duration = duration;
      notifyListeners();
    });
    _positionSubscription =
        _audioPlayer.onAudioPositionChanged.listen((position) {
      _position = position;
      notifyListeners();
    });
    _playerCompleteSubscription =
        _audioPlayer.onPlayerCompletion.listen((event) {
      _onComplete();
      _position = _duration;
      notifyListeners();
    });
    _playerErrorSubscription = _audioPlayer.onPlayerError.listen((message) {
      _playerState = PlayerState.stop;
      _duration = Duration(seconds: 0);
      _position = Duration(seconds: 0);
      notifyListeners();
    });
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _audioPlayerState = state;
      notifyListeners();
    });
    _audioPlayer.onNotificationPlayerStateChanged.listen((state) {
      _audioPlayerState = state;
      notifyListeners();
    });
  }

  void playSong(trackUrl) {
    _songService
        .play(_audioPlayer, _position, _duration, trackUrl)
        .then((value) {
      if (value == 1) {
        _playerState = PlayerState.play;
        _songService.setPlaybackRate(_audioPlayer);
      }
      notifyListeners();
    });
  }

  void pauseSong() {
    _songService.pause(_audioPlayer).then((value) {
      _playerState = PlayerState.pause;
    });
    notifyListeners();
  }

  void stopSong() {
    _songService.stop(_audioPlayer).then((value) {
      _playerState = PlayerState.stop;
      _position = Duration();
    });
  }

  void _onComplete() {
    _playerState = PlayerState.stop;
  }

  void disposeSubscription() {
    _audioPlayer.stop();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerStateSubscription?.cancel();
    notifyListeners();
  }
}
