import 'package:flutter/material.dart';
import 'package:reksas_records_mobile/screens/menu.dart';
import 'package:reksas_records_mobile/screens/records_entry.dart';

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
            child: const Column(
              children: [
                Text(
                  "Reksa's Records",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Add your favorite music here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  ),
                ),
              ]
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
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
            leading: const Icon(Icons.music_note),
            title: const Text('Add Records'),
            // Bagian redirection ke RecordEntryFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecordEntryFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}