import 'package:json_annotation/json_annotation.dart';

part 'song_model.g.dart';

@JsonSerializable()
class SongModel {
  SongModel(
      {this.trackId,
      this.trackName,
      this.artistName,
      this.collectionName,
      this.previewUrl,
      this.artworkUrl,
      this.isSelected});

  final int trackId;

  @JsonKey(name: 'trackName', defaultValue: 'Unavailable')
  final String trackName;

  @JsonKey(name: 'artistName', defaultValue: 'Unavailable')
  final String artistName;

  @JsonKey(name: 'collectionName', defaultValue: 'Unavailable')
  final String collectionName;

  @JsonKey(name: 'previewUrl')
  final String previewUrl;

  @JsonKey(name: 'artworkUrl100', defaultValue: null)
  final String artworkUrl;

  @JsonKey(defaultValue: false)
  bool isSelected;

  /// Create SongModel from json Map<String, dynamic>
  static SongModel fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);

  /// generate json Map<String, dynamic> from SongModel
  Map<String, dynamic> toJson() => _$SongModelToJson(this);
}
