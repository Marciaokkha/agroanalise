import 'package:flutter/material.dart';

const primaryColor = Colors.blue;
const secondaryColor = Colors.green;

const appBarTitleTextStyle = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const primaryBodyTextStyle = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 18,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

const primaryBodyTextStyleAlternative = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 18,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

const navBarIcons = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.photo_album),
    label: 'Galeria',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.history),
    label: 'Histórico',
  ),
];

const navBarTextStyle = TextStyle(
  fontFamily: 'Comfortaa',
  fontWeight: FontWeight.bold,
);
