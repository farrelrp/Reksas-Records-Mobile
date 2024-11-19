import 'package:flutter/material.dart';
import 'package:reksas_records_mobile/models/vinyl_entry.dart';
import 'package:reksas_records_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class VinylEntryPage extends StatefulWidget {
  const VinylEntryPage({super.key});

  @override
  State<VinylEntryPage> createState() => _VinylEntryPageState();
}

class _VinylEntryPageState extends State<VinylEntryPage> {
  Future<List<VinylEntry>> fetchVinyl(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');

    // Decode the response menjadi json
    var data = response;

    // Convert json data to VinylEntry objects
    List<VinylEntry> listVinyl = [];
    for (var d in data) {
      if (d != null) {
        listVinyl.add(VinylEntry.fromJson(d));
      }
    }
    return listVinyl;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vinyl Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchVinyl(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data vinyl pada reksa records.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  var vinyl = snapshot.data![index];
                  return Center( // Center the card in the screen
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      width: MediaQuery.of(context).size.width * 0.9, // Set card width to 90% of screen
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                        children: [
                          // Make the album cover smaller with a max size
                          Center(
                            child: SizedBox(
                              width: 350, // Set max width
                              height: 350, // Set max height
                              child: Image.network(
                                vinyl.fields.image,
                                fit: BoxFit.cover, // Cover the entire area
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text('Failed to load image'),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Album title with larger font
                          Text(
                            vinyl.fields.albumName,
                            style: const TextStyle(
                              fontSize: 22.0, // Bigger font for title
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Artist name
                          Text(vinyl.fields.artist[0].toUpperCase() + vinyl.fields.artist.substring(1)),
                          const SizedBox(height: 5),
                          // Genre
                          Text(vinyl.fields.genre[0].toUpperCase() + vinyl.fields.genre.substring(1)),
                          const SizedBox(height: 5),
                          // Price
                          Text('\$${vinyl.fields.price.toString()}'),
                          const SizedBox(height: 5),
                          // Description
                          Text(vinyl.fields.description),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
