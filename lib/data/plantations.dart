import 'farms.dart';

class PlantationImage {
  String id;
  String data;
  String cultura;
  String idFarm;
  String drone;
  String imagem;
  String recomendacaoIA;
  bool pragas;
  bool doencas;
  bool nutrientesOK;
  bool precisaIrrigar;

  PlantationImage({
    required this.id,
    required this.data,
    required this.cultura,
    required this.idFarm,
    required this.drone,
    required this.imagem,
    required this.recomendacaoIA,
    required this.pragas,
    required this.doencas,
    required this.nutrientesOK,
    required this.precisaIrrigar,
  });

  //Método para atulizar os status das fazendas
  static void updateStatus() {
    for (Farms farm in farmsList) {
      List<PlantationImage> imagesForFarm = plantationImages
          .where((image) => image.idFarm == farm.id.toString())
          .toList();

      bool allutrientesOK = imagesForFarm.every((image) => image.nutrientesOK);
      bool anyPragas = imagesForFarm.any((image) => image.pragas);
      bool anyDoencas = imagesForFarm.any((image) => image.doencas);
      bool anyPrecisaIrrigar = imagesForFarm.any((image) => image.precisaIrrigar);

      if (allutrientesOK && !anyPragas && !anyDoencas && !anyPrecisaIrrigar) {
        farm.status = "OK";
      } else {
        farm.status = "Alerta";
      }
    }
  }
}

List<PlantationImage> plantationImages = [
    PlantationImage(
      id: "ID195515435616",
      data: "06/06/2023 12:00",
      cultura: "Soja",
      idFarm: "1",
      drone: "Drone001",
      imagem: "assets/images/plantationsImages/plantationImage001.jpg",
      recomendacaoIA: "Nenhuma",
      pragas: false,
      doencas: false,
      nutrientesOK: true,
      precisaIrrigar: false,
    ),
    PlantationImage(
      id: "ID195515435617",
      data: "06/06/2023 12:10",
      cultura: "Soja",
      idFarm: "1",
      drone: "Drone001",
      imagem: "assets/images/plantationsImages/plantationImage002.jpg",
      recomendacaoIA: "Nenhuma",
      pragas: false,
      doencas: false,
      nutrientesOK: true,
      precisaIrrigar: false,
    ),
    PlantationImage(
      id: "ID195515435618",
      data: "06/06/2023 12:20",
      cultura: "Soja",
      idFarm: "1",
      drone: "Drone001",
      imagem: "assets/images/plantationsImages/plantationImage003.jpg",
      recomendacaoIA: "Nenhuma",
      pragas: false,
      doencas: false,
      nutrientesOK: true,
      precisaIrrigar: false,
    ),
    PlantationImage(
      id: "ID195515435619",
      data: "06/06/2023 12:30",
      cultura: "Soja",
      idFarm: "1",
      drone: "Drone001",
      imagem: "assets/images/plantationsImages/plantationImage004.jpg",
      recomendacaoIA: "Nenhuma",
      pragas: false,
      doencas: false,
      nutrientesOK: true,
      precisaIrrigar: false,
    ),
    PlantationImage(
      id: "ID195515435620",
      data: "06/06/2023 12:40",
      cultura: "Soja",
      idFarm: "1",
      drone: "Drone001",
      imagem: "assets/images/plantationsImages/plantationImage005.jpg",
      recomendacaoIA: "Nenhuma",
      pragas: false,
      doencas: false,
      nutrientesOK: true,
      precisaIrrigar: false,
    ),
    PlantationImage(
      id: "ID195515435621",
      data: "06/06/2023 13:00",
      cultura: "Trigo",
      idFarm: "2",
      drone: "Drone002",
      imagem: "assets/images/plantationsImages/plantationImage006.jpg",
      recomendacaoIA:
          "Foram localizadas ervas daninhas na plantação, é prudente removê-las.",
      pragas: true,
      doencas: false,
      nutrientesOK: true,
      precisaIrrigar: false,
    ),
    PlantationImage(
      id: "ID195515435622",
      data: "06/06/2023 13:10",
      cultura: "Trigo",
      idFarm: "2",
      drone: "Drone002",
      imagem: "assets/images/plantationsImages/plantationImage007.jpg",
      recomendacaoIA:
          "Foram localizados fungos nas folhas da plantação, é recomendado tratar fungos detectados na plantação.",
      pragas: false,
      doencas: true,
      nutrientesOK: true,
      precisaIrrigar: false,
    ),
    PlantationImage(
      id: "ID195515435623",
      data: "06/06/2023 13:20",
      cultura: "Trigo",
      idFarm: "2",
      drone: "Drone002",
      imagem: "assets/images/plantationsImages/plantationImage008.jpg",
      recomendacaoIA:
          "Solo deficiente em nutrientes, é recomendado adicionar mais nutrientes ao solo.",
      pragas: false,
      doencas: false,
      nutrientesOK: false,
      precisaIrrigar: false,
    ),
    PlantationImage(
      id: "ID195515435624",
      data: "06/06/2023 13:30",
      cultura: "Trigo",
      idFarm: "2",
      drone: "Drone002",
      imagem: "assets/images/plantationsImages/plantationImage009.jpg",
      recomendacaoIA: "O solo está seco, é recomendado irrigar a plantação.",
      pragas: false,
      doencas: false,
      nutrientesOK: true,
      precisaIrrigar: true,
    ),
    PlantationImage(
      id: "ID195515435625",
      data: "06/06/2023 13:40",
      cultura: "Trigo",
      idFarm: "2",
      drone: "Drone002",
      imagem: "assets/images/plantationsImages/plantationImage010.jpg",
      recomendacaoIA:
          "Foram localizadas duas situações com a plantação: Pragas e Falta de Nutrientes, considere tratar o solo com pesticidas, e nutrir o solo.",
      pragas: true,
      doencas: false,
      nutrientesOK: false,
      precisaIrrigar: false,
    ),
  ];



