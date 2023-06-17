import 'package:agroanalise/constants.dart';
import 'package:agroanalise/pages/plantation_image_history.dart';
import 'package:flutter/material.dart';
import 'package:agroanalise/data/farms.dart';
import 'package:agroanalise/pages/plantation_image_gallery.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCardIndex = -1;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text(
          "Agro Análise",
          style: appBarTitleTextStyle
        ),
        titleSpacing: 20,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/tree.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Verifique a situação das suas plantações através de imagens capturadas por drones, e processadas por I.A:",
                style: primaryBodyTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              //Cada fazenda cadastrada terá um Card com algumas informações, 
              //esse Card será vermelho se a fazenda possui alguma anomalia, ou verde se estiver tudo certo.
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //Farmlist se encontra em data/farms.dart
                itemCount: farmsList.length,
                itemBuilder: (context, index) {
                  Farms farms = farmsList[index];
                  Color cardColor =
                      farms.status == "OK" ? Colors.green : Colors.red;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Card(
                      color: cardColor,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(
                              farms.icone,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    farms.nome,
                                    style: primaryBodyTextStyleAlternative
                                  ),
                                  Text(
                                    farms.endereco,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Status: " + farms.status,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
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
              SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: secondaryColor,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PlantationImageGalleryPage()),
                  );
                },
                child: Text(
                  "Abrir Galeria",
                  style: primaryBodyTextStyleAlternative
                ),
              ),
            ],
          ),
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
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PlantationImageGalleryPage()),
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
