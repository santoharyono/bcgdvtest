import 'package:bcgdvtest/src/screen/home/home_screen.dart';
import 'package:bcgdvtest/src/screen/home/home_view_model.dart';
import 'package:bcgdvtest/src/services/song_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../unit_test/view_model/mock/song_service_mock.dart';

void main() {
  final GetIt injector = GetIt.instance;
  final SongServiceMock songServiceMock = SongServiceMock();
  final SongService songService = songServiceMock;

  injector.registerLazySingleton(() {
    return songService;
  });

  group('Home screen', () {
    testWidgets(
        'home screen will contain app bar with text, search text field and search button',
        (WidgetTester tester) async {
      await tester.pumpWidget(MultiProvider(
        providers: [
          ListenableProvider<HomeViewModel>(create: (_) => HomeViewModel())
        ],
        child: MaterialApp(
          home: HomeScreen(),
        ),
      ));

      await tester.pump();

      // verify the widget increment
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.text('Simple song search preview'), findsOneWidget);
    });
  });
}
