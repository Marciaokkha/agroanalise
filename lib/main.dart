import 'package:agroanalise/data/plantations.dart';
import 'package:agroanalise/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  //Atualiza o status das plantações dinamicamente antes de carregar nosso app.
  //Pois essa informação será exibida logo na home.
  PlantationImage.updateStatus();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agro AnáliseF',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


