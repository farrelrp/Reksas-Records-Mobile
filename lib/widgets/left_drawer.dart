import 'package:flutter/material.dart';
import 'package:reksas_records_mobile/screens/menu.dart';
import 'package:reksas_records_mobile/screens/vinlyentry_form.dart';
import 'package:reksas_records_mobile/screens/list_vinyl.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(children: [
              Text(
                'Reksa Records',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                "Ayo beli vinilmu disini!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ]),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline_rounded),
            title: const Text('Tambah Vinyl'),
            // Bagian redirection ke VinylEntryFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VinylEntryFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.music_note),
            title: const Text('Daftar Vinyl'),
            onTap: () {
              // Route menu ke halaman vinyl
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VinylEntryPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
