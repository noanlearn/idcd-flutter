import 'package:codelab_3/detail_screen.dart';
import 'package:codelab_3/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bandung',
      theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}
