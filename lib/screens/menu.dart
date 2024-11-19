import 'package:flutter/material.dart';
import 'package:reksas_records_mobile/widgets/item_card.dart';
import 'package:reksas_records_mobile/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("List Vinyl", Icons.music_note),
    ItemHomepage("Add Records", Icons.add_circle_outline_rounded),
    ItemHomepage("Logout", Icons.logout),
  ];

  final List<Color> itemColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reksa's Records",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                'Hi! What do you want to do today?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GridView.builder(
                  primary: true,
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // Jumlah kolom
                    mainAxisSpacing: 10, // Jarak antar item
                    crossAxisSpacing: 10, // Jarak antar item
                    mainAxisExtent: 100, // Height tiap item
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ItemCard(
                      items[index],
                      backgroundColor: itemColors[index % itemColors.length],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
