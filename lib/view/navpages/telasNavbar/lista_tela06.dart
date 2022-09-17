import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../model/anime.dart';

class ListaTela06 extends StatefulWidget {
  const ListaTela06({Key? key}) : super(key: key);

  @override
  State<ListaTela06> createState() => _ListaTela06State();
}

class _ListaTela06State extends State<ListaTela06> {
  late List<Anime> animes;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // ------------------------------------------- APP BAR -----------------------------------------
          title: Center(
              child: SizedBox(
                  height: 65,
                  width: 65,
                  child: Image.asset("assets/img/logo3.png"))),
          bottom: const TabBar(isScrollable: true, tabs: [
            Tab(text: 'Watching'),
            Tab(text: 'Completed'),
            Tab(text: 'Dropped'),
            Tab(text: 'Plan to Watch'),
          ]),
          backgroundColor: const Color.fromARGB(255, 10, 34, 57),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
          Center(child: Text('1')),
          Center(child: Text('2')),
          Center(child: Text('3')),
          Center(child: Text('4')),
        ]),
      ),
    );
  }
}
