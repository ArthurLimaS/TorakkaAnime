import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:torakka_anime/view/navpages/telasNavbar/discover_tela04.dart';
import 'package:torakka_anime/view/navpages/telasNavbar/home_tela03.dart';
import 'package:torakka_anime/view/navpages/telasNavbar/lista_tela06.dart';
import 'package:torakka_anime/view/navpages/telasNavbar/perfil_tela07.dart';
import 'package:torakka_anime/view/navpages/telasNavbar/seasonal_tela05.dart';
import 'package:torakka_anime/view/navpages/telasNavbar/seasonal_tela05.dart';

class MainNavPage extends StatefulWidget {
  MainNavPage({Key? key, this.currentIndex}) : super(key: key);

  int? currentIndex;

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  get currentIndex => widget.currentIndex;

  List pages = [
    const HomeTela03(),
    const DiscoverTela04(),
    const SeasonalTela05(),
    const ListaTela06(),
    const PerfilTela07(),
  ];

  void onTap(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          iconSize: 30,
          selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
          unselectedItemColor: const Color.fromARGB(255, 110, 110, 110),
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
