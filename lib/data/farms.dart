import 'package:flutter/material.dart';

class Farms {
  int id;
  String nome;
  String endereco;
  String status;
  IconData icone;

  Farms({
    required this.id,
    required this.nome,
    required this.endereco,
    required this.status,
    required this.icone,
  });

  //Método para conseguir uma fazenda por ID, passado nas Plantations...
  static Farms? getFarmById(String id) {
    return farmsList.firstWhere(
      (farm) => farm.id.toString() == id
    );
  }
}

final List<Farms> farmsList = [
  Farms(
    id: 1,
    nome: "Recanto Feliz",
    endereco: "Rodovia Raposo Tavares, KM 560",
    status: "",
    icone: Icons.agriculture,
  ),
  Farms(
    id: 2,
    nome: "Maharara",
    endereco: "Rodovia Raposo Tavares, KM 563",
    status: "",
    icone: Icons.agriculture,
  ),
];
