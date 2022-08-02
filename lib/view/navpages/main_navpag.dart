import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:torakka_anime/view/navpages/discover_tela04.dart';
import 'package:torakka_anime/view/navpages/home_tela03.dart';
import 'package:torakka_anime/view/navpages/lista_tela06.dart';
import 'package:torakka_anime/view/navpages/perfil_tela07.dart';
import 'package:torakka_anime/view/navpages/seasonal_tela05.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({Key? key}) : super(key: key);

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  List pages = [
    Home_Tela03(),
    Discover_Tela04(),
    Seasonal_Tela05(),
    Lista_Tela06(),
    Perfil_Tela07(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          iconSize: 40,
          selectedItemColor: Color.fromARGB(255, 0, 0, 0),
          unselectedItemColor: Color.fromARGB(255, 110, 110, 110),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Discover"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Seasonal"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
