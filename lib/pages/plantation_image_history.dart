import 'package:agroanalise/constants.dart';
import 'package:agroanalise/data/farms.dart';
import 'package:agroanalise/pages/homepage.dart';
import 'package:agroanalise/pages/plantation_image_gallery.dart';
import 'package:flutter/material.dart';
import 'package:agroanalise/data/plantations.dart';
import 'package:agroanalise/pages/plantation_image_analysis.dart';

class PlantationImageHistoryPage extends StatefulWidget {
  @override
  _PlantationImageHistoryPageState createState() =>
      _PlantationImageHistoryPageState();
}

class _PlantationImageHistoryPageState
    extends State<PlantationImageHistoryPage> {
  int _currentIndex = 2;

  //Informações que entrarão nas caixas dos filtros
  String selectedFarm = 'Fazendas';
  String selectedCulture = 'Culturas';
  String selectedStatus = 'Status';
  List<String> farmFilterOptions = ['Fazendas', ...farmsList.map((farm) => farm.nome).toList()];
  List<String> cultureFilterOptions = ['Culturas', ...plantationImages.map((plantation) => plantation.cultura).toSet()];
  List<String> statusFilterOptions = ['Status', 'OK', 'Alerta'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text(
          'Agro Análise - Histórico',
          style: appBarTitleTextStyle,
        ),
      ),
      body: Container(
        color: primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Aqui há a lógica do filtro
            // Professor confesso que aqui eu tive um pouco de ajuda de um projeto que achei no Git, 
            // claro que tive que fazer algumas adaptações, então não sei se está 100% correto, mas está funcionando legal.
            Text(
              'Filtros:',
              style: primaryBodyTextStyle,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedFarm,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedFarm = newValue!;
                          });
                        },
                        items: farmFilterOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCulture,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCulture = newValue!;
                          });
                        },
                        items: cultureFilterOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedStatus,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedStatus = newValue!;
                          });
                        },
                        items: statusFilterOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Histórico de imagens:',
              style: primaryBodyTextStyle,
            ),
            SizedBox(height: 20),
            Expanded(
              //Listagem de do histórico contendo todas as imagens da nossa base
              child: ListView.builder(
                itemCount: plantationImages.length,
                itemBuilder: (context, index) {
                  final plantationImage = plantationImages[index];
                  // Aqui também há uma lógica de filtro
                  if ((selectedFarm == 'Fazendas' || Farms.getFarmById(plantationImage.idFarm)?.nome == selectedFarm) &&
                      (selectedCulture == 'Culturas' || plantationImage.cultura == selectedCulture) &&
                      (selectedStatus == 'Status' || (Farms.getFarmById(plantationImage.idFarm)?.status == selectedStatus))) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlantationImageAnalysisPage(
                              plantation: plantationImages[index],
                            ),
                          ),
                        );
                      },
                      //Um card para cada imagem do nosso histórico de acordo com o filtro
                      child: Card(
                        color: secondaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(plantationImage.imagem),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ID: ${plantationImage.id}',
                                      style: primaryBodyTextStyleAlternative,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Data: ${plantationImage.data}',
                                      style: primaryBodyTextStyleAlternative,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: secondaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PlantationImageGalleryPage()),
            );
          }
        },
        items: navBarIcons,
        selectedLabelStyle: navBarTextStyle,
        unselectedLabelStyle: navBarTextStyle,
      ),
    );
  }
}
