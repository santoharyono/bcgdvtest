import 'package:bcgdvtest/src/component/song_item.component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  testWidgets('song item component', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(MaterialApp(
        home: SongItem(
          songTitle: 'SongTitle',
          album: 'album',
          artist: 'artist',
          onTap: () {},
          playSignWidget: Container(),
          imageUrl: '',
        ),
      ));

      await tester.pump();
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(3));
    });
  });
}
