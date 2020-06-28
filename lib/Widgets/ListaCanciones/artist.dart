class Artist {
  final int id;
  final String name;
  final String pictureMedium;

  Artist({this.pictureMedium, this.id, this.name});

  factory Artist.fromJson(Map<String, dynamic> parsedJson) {
    return Artist(
        id: parsedJson['id'],
        name: parsedJson['name'],
        pictureMedium: parsedJson['picture_medium']);
  }
}
