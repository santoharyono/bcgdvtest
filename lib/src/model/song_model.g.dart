// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongModel _$SongModelFromJson(Map<String, dynamic> json) {
  return SongModel(
    trackId: json['trackId'] as int,
    trackName: json['trackName'] as String ?? 'Unavailable',
    artistName: json['artistName'] as String ?? 'Unavailable',
    collectionName: json['collectionName'] as String ?? 'Unavailable',
    previewUrl: json['previewUrl'] as String,
    artworkUrl: json['artworkUrl100'] as String,
    isSelected: json['isSelected'] as bool ?? false,
  );
}

Map<String, dynamic> _$SongModelToJson(SongModel instance) => <String, dynamic>{
      'trackId': instance.trackId,
      'trackName': instance.trackName,
      'artistName': instance.artistName,
      'collectionName': instance.collectionName,
      'previewUrl': instance.previewUrl,
      'artworkUrl100': instance.artworkUrl,
      'isSelected': instance.isSelected,
    };
