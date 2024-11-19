// To parse this JSON data, do
//
//     final vinylEntry = vinylEntryFromJson(jsonString);

import 'dart:convert';

List<VinylEntry> vinylEntryFromJson(String str) => List<VinylEntry>.from(json.decode(str).map((x) => VinylEntry.fromJson(x)));

String vinylEntryToJson(List<VinylEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VinylEntry {
    String model;
    String pk;
    Fields fields;

    VinylEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory VinylEntry.fromJson(Map<String, dynamic> json) => VinylEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String image;
    String albumName;
    String artist;
    String genre;
    int price;
    String description;
    List<dynamic> favoritedBy;

    Fields({
        required this.user,
        required this.image,
        required this.albumName,
        required this.artist,
        required this.genre,
        required this.price,
        required this.description,
        required this.favoritedBy,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        image: json["image"],
        albumName: json["album_name"],
        artist: json["artist"],
        genre: json["genre"],
        price: json["price"],
        description: json["description"],
        favoritedBy: List<dynamic>.from(json["favorited_by"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "image": image,
        "album_name": albumName,
        "artist": artist,
        "genre": genre,
        "price": price,
        "description": description,
        "favorited_by": List<dynamic>.from(favoritedBy.map((x) => x)),
    };
}
