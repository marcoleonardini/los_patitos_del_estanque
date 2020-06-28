import 'package:los_patitos_del_estanque/Widgets/ListaCanciones/artist.dart';
import 'package:los_patitos_del_estanque/Widgets/ListaCanciones/tranck.dart';

class Album {
  final int id;
  final String title;
  final String coverMedium;
  final String label;
  final int rating;
  final String tracklist;
  final int duration;

  final Artist artist;
  final List<Track> tracks;

  Album(
      {this.id,
      this.title,
      this.coverMedium,
      this.label,
      this.rating,
      this.tracklist,
      this.duration,
      this.artist,
      this.tracks});
  factory Album.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['tracks']['data'] as List;
    return Album(
        id: parsedJson['id'],
        title: parsedJson['title'],
        coverMedium: parsedJson['cover_medium'],
        label: parsedJson['label'],
        rating: parsedJson['rating'],
        tracklist: parsedJson['tracklist'],
        duration: parsedJson['duration'],
        artist: Artist.fromJson(parsedJson['artist']),
        tracks: list.map((data) => Track.fromJson(data)).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "coverMedium": coverMedium,
      "label": label,
      "rating": rating,
      "tracklist": tracklist,
      "duration": duration,
    };
  }
}
