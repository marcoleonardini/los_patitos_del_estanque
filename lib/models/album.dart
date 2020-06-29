// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
    Album({
        this.id,
        this.title,
        this.upc,
        this.link,
        this.share,
        this.cover,
        this.coverSmall,
        this.coverMedium,
        this.coverBig,
        this.coverXl,
        this.genreId,
        this.genres,
        this.label,
        this.nbTracks,
        this.duration,
        this.fans,
        this.rating,
        this.releaseDate,
        this.recordType,
        this.available,
        this.tracklist,
        this.explicitLyrics,
        this.explicitContentLyrics,
        this.explicitContentCover,
        this.contributors,
        this.artist,
        this.type,
        this.tracks,
    });

    int id;
    String title;
    String upc;
    String link;
    String share;
    String cover;
    String coverSmall;
    String coverMedium;
    String coverBig;
    String coverXl;
    int genreId;
    Genres genres;
    String label;
    int nbTracks;
    int duration;
    int fans;
    int rating;
    DateTime releaseDate;
    String recordType;
    bool available;
    String tracklist;
    bool explicitLyrics;
    int explicitContentLyrics;
    int explicitContentCover;
    List<Contributor> contributors;
    Artist artist;
    String type;
    Tracks tracks;

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        title: json["title"],
        upc: json["upc"],
        link: json["link"],
        share: json["share"],
        cover: json["cover"],
        coverSmall: json["cover_small"],
        coverMedium: json["cover_medium"],
        coverBig: json["cover_big"],
        coverXl: json["cover_xl"],
        genreId: json["genre_id"],
        genres: Genres.fromJson(json["genres"]),
        label: json["label"],
        nbTracks: json["nb_tracks"],
        duration: json["duration"],
        fans: json["fans"],
        rating: json["rating"],
        releaseDate: DateTime.parse(json["release_date"]),
        recordType: json["record_type"],
        available: json["available"],
        tracklist: json["tracklist"],
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        contributors: List<Contributor>.from(json["contributors"].map((x) => Contributor.fromJson(x))),
        artist: Artist.fromJson(json["artist"]),
        type: json["type"],
        tracks: Tracks.fromJson(json["tracks"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "upc": upc,
        "link": link,
        "share": share,
        "cover": cover,
        "cover_small": coverSmall,
        "cover_medium": coverMedium,
        "cover_big": coverBig,
        "cover_xl": coverXl,
        "genre_id": genreId,
        "genres": genres.toJson(),
        "label": label,
        "nb_tracks": nbTracks,
        "duration": duration,
        "fans": fans,
        "rating": rating,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "record_type": recordType,
        "available": available,
        "tracklist": tracklist,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "contributors": List<dynamic>.from(contributors.map((x) => x.toJson())),
        "artist": artist.toJson(),
        "type": type,
        "tracks": tracks.toJson(),
    };
}

class Artist {
    Artist({
        this.id,
        this.name,
        this.picture,
        this.pictureSmall,
        this.pictureMedium,
        this.pictureBig,
        this.pictureXl,
        this.tracklist,
        this.type,
    });

    int id;
    String name;
    String picture;
    String pictureSmall;
    String pictureMedium;
    String pictureBig;
    String pictureXl;
    String tracklist;
    ArtistType type;

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"],
        name: json["name"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        tracklist: json["tracklist"],
        type: artistTypeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "tracklist": tracklist,
        "type": artistTypeValues.reverse[type],
    };
}

enum Name { RAP_HIP_HOP, EMINEM }

final nameValues = EnumValues({
    "Eminem": Name.EMINEM,
    "Rap/Hip Hop": Name.RAP_HIP_HOP
});

enum ArtistType { GENRE, ARTIST }

final artistTypeValues = EnumValues({
    "artist": ArtistType.ARTIST,
    "genre": ArtistType.GENRE
});

class Contributor {
    Contributor({
        this.id,
        this.name,
        this.link,
        this.share,
        this.picture,
        this.pictureSmall,
        this.pictureMedium,
        this.pictureBig,
        this.pictureXl,
        this.radio,
        this.tracklist,
        this.type,
        this.role,
    });

    int id;
    Name name;
    String link;
    String share;
    String picture;
    String pictureSmall;
    String pictureMedium;
    String pictureBig;
    String pictureXl;
    bool radio;
    String tracklist;
    ArtistType type;
    String role;

    factory Contributor.fromJson(Map<String, dynamic> json) => Contributor(
        id: json["id"],
        name: nameValues.map[json["name"]],
        link: json["link"],
        share: json["share"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        radio: json["radio"],
        tracklist: json["tracklist"],
        type: artistTypeValues.map[json["type"]],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "link": link,
        "share": share,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "radio": radio,
        "tracklist": tracklist,
        "type": artistTypeValues.reverse[type],
        "role": role,
    };
}

class Genres {
    Genres({
        this.data,
    });

    List<ArtistElement> data;

    factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        data: List<ArtistElement>.from(json["data"].map((x) => ArtistElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ArtistElement {
    ArtistElement({
        this.id,
        this.name,
        this.picture,
        this.type,
        this.tracklist,
    });

    int id;
    String name;
    String picture;
    ArtistType type;
    String tracklist;

    factory ArtistElement.fromJson(Map<String, dynamic> json) => ArtistElement(
        id: json["id"],
        name: json["name"],
        picture: json["picture"] == null ? null : json["picture"],
        type: artistTypeValues.map[json["type"]],
        tracklist: json["tracklist"] == null ? null : json["tracklist"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "picture": picture == null ? null : picture,
        "type": artistTypeValues.reverse[type],
        "tracklist": tracklist == null ? null : tracklist,
    };
}

class Tracks {
    Tracks({
        this.data,
    });

    List<TracksDatum> data;

    factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        data: List<TracksDatum>.from(json["data"].map((x) => TracksDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class TracksDatum {
    TracksDatum({
        this.id,
        this.readable,
        this.title,
        this.titleShort,
        this.titleVersion,
        this.link,
        this.duration,
        this.rank,
        this.explicitLyrics,
        this.explicitContentLyrics,
        this.explicitContentCover,
        this.preview,
        this.artist,
        this.type,
    });

    int id;
    bool readable;
    String title;
    String titleShort;
    TitleVersion titleVersion;
    String link;
    int duration;
    int rank;
    bool explicitLyrics;
    int explicitContentLyrics;
    int explicitContentCover;
    String preview;
    ArtistElement artist;
    PurpleType type;

    factory TracksDatum.fromJson(Map<String, dynamic> json) => TracksDatum(
        id: json["id"],
        readable: json["readable"],
        title: json["title"],
        titleShort: json["title_short"],
        titleVersion: titleVersionValues.map[json["title_version"]],
        link: json["link"],
        duration: json["duration"],
        rank: json["rank"],
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        preview: json["preview"],
        artist: ArtistElement.fromJson(json["artist"]),
        type: purpleTypeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "readable": readable,
        "title": title,
        "title_short": titleShort,
        "title_version": titleVersionValues.reverse[titleVersion],
        "link": link,
        "duration": duration,
        "rank": rank,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "preview": preview,
        "artist": artist.toJson(),
        "type": purpleTypeValues.reverse[type],
    };
}

enum TitleVersion { EMPTY, FROM_8_MILE_SOUNDTRACK }

final titleVersionValues = EnumValues({
    "": TitleVersion.EMPTY,
    "(From \"8 Mile\" Soundtrack)": TitleVersion.FROM_8_MILE_SOUNDTRACK
});

enum PurpleType { TRACK }

final purpleTypeValues = EnumValues({
    "track": PurpleType.TRACK
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
