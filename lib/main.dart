import 'package:flutter/material.dart';
import 'package:reksas_records_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appBarTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );

    return MaterialApp(
      title: 'Reksa Records',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.lightBlueAccent[400]),
        appBarTheme: AppBarTheme(
          titleTextStyle: appBarTextStyle,
          centerTitle: true,
        ),
      ),
      home: MyHomePage(),
    );
  }
}
