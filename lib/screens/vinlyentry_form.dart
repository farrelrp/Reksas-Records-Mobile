import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reksas_records_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:reksas_records_mobile/screens/menu.dart';

class VinylEntryFormPage extends StatefulWidget {
  const VinylEntryFormPage({super.key});

  @override
  State<VinylEntryFormPage> createState() => _VinylEntryFormPageState();
}

class _VinylEntryFormPageState extends State<VinylEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _albumName = "";
  String _artist = "";
  String _genre = "rock";
  int _price = 0;
  String _description = "";
  String _image = "";

  final List<List<String>> GENRE_CHOICES = [
    ['rock', 'Rock'],
    ['pop', 'Pop'],
    ['jazz', 'Jazz'],
    ['classical', 'Classical'],
    ['hiphop', 'Hip Hop'],
    ['indie', 'Indie'],
    ['electronic', 'Electronic'],
    ['country', 'Country'],
    ['rhythm_and_blues', 'Rhythm and Blues'],
    ['other', 'Other'],
  ];

  late final List<DropdownMenuItem<String>> _genreChoices;

  @override
  void initState() {
    super.initState();
    _genreChoices = GENRE_CHOICES
        .map((genre) => DropdownMenuItem<String>(
              value: genre[0],
              child: Text(genre[1]),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            '🎶 Get your Vinyls here! 🎶',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Abbey Road",
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelText: "Album Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _albumName = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Album Name cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "The Beatles",
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelText: "Artist",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _artist = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Artist cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: _genre,
                decoration: InputDecoration(
                  labelText: "Genre",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                items: _genreChoices,
                onChanged: (String? newValue) {
                  setState(() {
                    _genre = newValue!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Genre cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "The Beatles' 14th studio album",
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                maxLines: 3,
                onChanged: (String? value) {
                  setState(() {
                    _description = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Description cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "100000",
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (String? value) {
                  setState(() {
                    _price = int.tryParse(value!) ?? 0;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Price cannot be empty!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Price must be a number!";
                  }
                  if (_price < 0) {
                    return "Price cannot be negative!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText:
                      "https://upload.wikimedia.org/wikipedia/id/4/42/Beatles_-_Abbey_Road.jpg",
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelText: "Image Cover URL",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _image = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Image Cover URL cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await request.postJson(
                        "http://127.0.0.1:8000/create_vinyl_flutter/",
                        jsonEncode(<String, String>{
                          'album_name': _albumName,
                          'artist': _artist,
                          'genre': _genre,
                          'price': _price.toString(),
                          'description': _description,
                          'image': _image,
                        }),
                      );
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("New vinyl saved successfully!"),
                          ));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                                Text("An error occurred, please try again."),
                          ));
                        }
                      }
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
