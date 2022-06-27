import 'package:faceflutter/telas/home.dart';
import 'package:faceflutter/telas/principal.dart';
import 'package:faceflutter/utils/paleta_cores.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: PaletaCores.scaffold
      ),
      // home: const Home()
      home: Principal()
    );
  }
}