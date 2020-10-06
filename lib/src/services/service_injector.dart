import 'package:bcgdvtest/src/screen/home/home_view_model.dart';
import 'package:bcgdvtest/src/services/song_service.dart';
import 'package:bcgdvtest/src/services/song_service_implementation.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

void initInjectService() {
  injector.registerLazySingleton(() {
    final SongService service = SongServiceImplementation();
    return service;
  });

  injector.registerFactory(() => HomeViewModel());
}
