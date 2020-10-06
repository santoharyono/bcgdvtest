import 'package:bcgdvtest/src/screen/home/home_view_model.dart';
import 'package:bcgdvtest/src/services/song_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'mock/song_service_mock.dart';

void main() {
  final GetIt injector = GetIt.instance;
  group('home view model', () {
    final SongServiceMock serviceMock = SongServiceMock();
    final SongService service = serviceMock;
    injector.registerLazySingleton(() => service);

    final HomeViewModel homeViewModel = HomeViewModel();

    test('get song list', () {
      homeViewModel.getSongList();
      Future.delayed(Duration(milliseconds: 100),
          () => expect(homeViewModel.songList.length, 1));
    });

    test('play song', () {
      homeViewModel.playSong('trackUrl');
      Future.delayed(Duration(milliseconds: 100),
          () => expect(homeViewModel.isPlaying, true));
    });

    test('pause song', () {
      homeViewModel.pauseSong();
      Future.delayed(Duration(milliseconds: 100),
          () => expect(homeViewModel.isPaused, true));
    });
  });
}
