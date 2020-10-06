import 'package:bcgdvtest/src/model/song_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const int _trackId = 99;
  const String _trackName = 'track';
  const String _artistName = 'artist';
  const String _collectionName = 'collection';
  const String _previewUrl = 'previewUrl';
  const String _artworkUrl = 'artworkUrl';
  const bool _isSelected = false;

  group('SongModel test', () {
    test('initiate with constructor', () {
      final songModel = SongModel(
          trackId: _trackId,
          trackName: _trackName,
          artistName: _artistName,
          collectionName: _collectionName,
          previewUrl: _previewUrl,
          artworkUrl: _artworkUrl,
          isSelected: _isSelected);

      expect(songModel.trackId, equals(_trackId));
      expect(songModel.trackName, equals(_trackName));
      expect(songModel.artistName, equals(_artistName));
      expect(songModel.collectionName, equals(_collectionName));
      expect(songModel.previewUrl, equals(_previewUrl));
      expect(songModel.artworkUrl, equals(_artworkUrl));
      expect(songModel.isSelected, equals(_isSelected));
    });

    test('initiate with Json', () {
      final jsonResponse = {
        'trackId': _trackId,
        'trackName': _trackName,
        'artistName': _artistName,
        'collectionName': _collectionName,
        'previewUrl': _previewUrl,
        'artworkUrl100': _artworkUrl
      };

      final costumizedResponse = {
        'trackId': _trackId,
        'trackName': _trackName,
        'artistName': _artistName,
        'collectionName': _collectionName,
        'previewUrl': _previewUrl,
        'artworkUrl100': _artworkUrl,
        'isSelected': false,
      };

      final songModel = SongModel.fromJson(jsonResponse);
      final songStringJson = songModel.toJson().toString();

      expect(songModel.trackId, equals(_trackId));
      expect(songModel.trackName, equals(_trackName));
      expect(songModel.artistName, equals(_artistName));
      expect(songModel.collectionName, equals(_collectionName));
      expect(songModel.previewUrl, equals(_previewUrl));
      expect(songModel.artworkUrl, equals(_artworkUrl));
      expect(songModel.isSelected, equals(_isSelected));

      expect(songStringJson, equals(costumizedResponse.toString()));
    });
  });
}
