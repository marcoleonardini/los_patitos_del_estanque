class Track {
  final int id;
  final String title;
  final String titleShort;
  final int duration;
  final String preview;
  Track({this.id, this.title, this.titleShort, this.duration, this.preview});

  factory Track.fromJson(Map<String, dynamic> parsedJson) {
    return Track(
        id: parsedJson['id'] as int,
        title: parsedJson['title'] as String,
        titleShort: parsedJson['title_short'],
        duration: parsedJson['duration'] as int,
        preview: parsedJson['preview'] as String);
  }
}
