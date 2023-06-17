import 'package:agroanalise/constants.dart';
import 'package:flutter/material.dart';
import 'package:agroanalise/data/plantations.dart';
import 'package:agroanalise/data/farms.dart';

class PlantationImageAnalysisPage extends StatelessWidget {
  final PlantationImage plantation;

  //Pega o nome da fazenda usando o idFarm passado no item plantation.
  //Tem um método getFarmById() em data/farms.dart ajudando a gente com isso.
  final String nomeFazenda;
  PlantationImageAnalysisPage({required this.plantation}) : nomeFazenda = Farms.getFarmById(plantation.idFarm)?.nome ?? '';

  //Nessa tela o usuário verá as informações da imagem retirada pelo drone. 
  //As anomalias são exibidas em vermelho, e as normalidade em branco (ex. linha 72)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text(
          'Análise da Imagem',
          style: appBarTitleTextStyle
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detalhes da Imagem:',
                style: primaryBodyTextStyle
              ),
              SizedBox(height: 20),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(plantation.imagem),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'ID: ${plantation.id}',
                style: primaryBodyTextStyle
              ),
              Text(
                'Data: ${plantation.data}',
                style: primaryBodyTextStyle
              ),
              Text(
                'Data: $nomeFazenda',
                style: primaryBodyTextStyle
              ),
              Text(
                'Cultura: ${plantation.cultura}',
                style: primaryBodyTextStyle
              ),
              Text(
                'Drone: ${plantation.drone}',
                style: primaryBodyTextStyle
              ),
              SizedBox(height: 20),
              Text(
                'Status:',
                style: primaryBodyTextStyle,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.bug_report,
                    color: plantation.pragas ? Colors.red : Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    plantation.pragas ? 'Pragas Detectadas' : 'Sem Pragas',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: plantation.pragas ? Colors.red : Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.local_hospital,
                    color: plantation.doencas ? Colors.red : Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    plantation.doencas ? 'Doenças Detectadas' : 'Sem Doenças',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: plantation.doencas ? Colors.red : Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: plantation.nutrientesOK ? Colors.white : Colors.red,
                  ),
                  SizedBox(width: 5),
                  Text(
                    plantation.nutrientesOK ? 'Nutrientes OK' : 'Falta de Nutrientes',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: plantation.nutrientesOK ? Colors.white : Colors.red,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.water,
                    color: plantation.precisaIrrigar ? Colors.red : Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    plantation.precisaIrrigar ? 'Precisa Irrigar' : 'Não Precisa Irrigar',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: plantation.precisaIrrigar ? Colors.red : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Recomendação da IA:',
                style: primaryBodyTextStyleAlternative
              ),
              SizedBox(height: 10),
              Text(
                plantation.recomendacaoIA,
                style: primaryBodyTextStyleAlternative
              ),
            ],
          ),
        ),
      ),
    );
  }
}
