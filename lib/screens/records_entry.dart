import 'package:flutter/material.dart';
import 'package:reksas_records_mobile/widgets/left_drawer.dart';

class RecordEntryFormPage extends StatefulWidget {
  const RecordEntryFormPage({super.key});

  @override
  State<RecordEntryFormPage> createState() => _RecordEntryFormPageState();
}

class _RecordEntryFormPageState extends State<RecordEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _albumName = "";
  String _artist = "";
  String _genre = "";
  double _price = 0.0;
  String _description = "";
  String _albumCoverLink = "";

  final List<Map<String, String>> _genres = [
    {'value': 'rock', 'label': 'Rock'},
    {'value': 'pop', 'label': 'Pop'},
    {'value': 'jazz', 'label': 'Jazz'},
    {'value': 'classical', 'label': 'Classical'},
    {'value': 'hiphop', 'label': 'Hip Hop'},
    {'value': 'indie', 'label': 'Indie'},
    {'value': 'electronic', 'label': 'Electronic'},
    {'value': 'country', 'label': 'Country'},
    {'value': 'rhythm_and_blues', 'label': 'Rhythm and Blues'},
    {'value': 'other', 'label': 'Other'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add New Record Form',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Album Name",
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
                      return "Album Name tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Artist",
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
                      return "Artist tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Select Genre",
                    hintStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _genre.isEmpty ? null : _genre,
                  items: _genres.map((Map<String, String> genre) {
                    return DropdownMenuItem<String>(
                      value: genre['value'],
                      child: Text(genre['label']!),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _genre = newValue!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Genre tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = double.tryParse(value!) ?? 0.0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Price tidak boleh kosong!";
                    }
                    if (double.tryParse(value) == null) {
                      return "Price harus berupa angka!";
                    }
                    if (double.tryParse(value)! < 0) {
                      return "Price harus berupa angka positif!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Album Cover Link",
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: "Album Cover Link",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _albumCoverLink = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Album Cover Link tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Album Description",
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelText: "Album Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Description tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ],
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Album berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Album Name: $_albumName'),
                                    Text('Artist: $_artist'),
                                    Text('Genre: $_genre'),
                                    Text('Price: $_price'),
                                    Text('Album Cover Link: $_albumCoverLink'),
                                    Text('Description: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}