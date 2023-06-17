import 'package:agroanalise/constants.dart';
import 'package:agroanalise/data/plantations.dart';
import 'package:agroanalise/pages/homepage.dart';
import 'package:agroanalise/pages/plantation_image_history.dart';
import 'package:flutter/material.dart';
import 'package:agroanalise/pages/plantation_image_analysis.dart';

class PlantationImageGalleryPage extends StatefulWidget {
  @override
  _PlantationImageGalleryPageState createState() =>
      _PlantationImageGalleryPageState();
}

class _PlantationImageGalleryPageState
    extends State<PlantationImageGalleryPage> {
  int _currentIndex = 1; 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text(
          'Agro Análise - Galeria',
          style: appBarTitleTextStyle
        ),
      ),
      body: Container(
        color: primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Imagens recentes:',
              style: primaryBodyTextStyle,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                //Lista apenas as imagens mais recentes
                itemCount: 6,
                itemBuilder: (context, index) {
                  // Obter dados da lista de plantationImages
                  // plantationImage se encontra em data/plantations.dart
                  final plantationImage = plantationImages[index];
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
                    //Cada imagem ganha um card com as informações dessas imagens
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
                                    style: primaryBodyTextStyleAlternative
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Data: ${plantationImage.data}',
                                    style: primaryBodyTextStyleAlternative
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: secondaryColor,
        selectedItemColor:Colors.black, 
        unselectedItemColor:Colors.white, 
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PlantationImageHistoryPage()),
            );
          }
        },
        items: navBarIcons,
        selectedLabelStyle: navBarTextStyle,
        unselectedLabelStyle: navBarTextStyle
      ),
    );
  }
}
