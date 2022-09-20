import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:torakka_anime/requests/mal_queries.dart';
import 'package:torakka_anime/view/navpages/telasInternas/lista.dart';

import '../../../model/anime.dart';

class ListaTela06 extends StatefulWidget {
  const ListaTela06({Key? key}) : super(key: key);

  @override
  State<ListaTela06> createState() => _ListaTela06State();
}

class _ListaTela06State extends State<ListaTela06> {
  List<Anime>? animes;
  //var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    Anime anime1 = await MalQuery().getAnime(41084);
    animes?.add(anime1);
    Anime anime2 = await MalQuery().getAnime(36296);
    animes?.add(anime2);
    print('tamanho dentro da função add to list ${animes?.length}');
    if (animes != null) {
      if (this.mounted) {
        setState(() {});
      }
    }
  }

  addAnimeToList() async {}

  @override
  Widget build(BuildContext context) {
    print('anime tela anime tamanho: ${animes?.length}');
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
          Lista(animes: animes),
          Center(child: Text('2')),
          Center(child: Text('3')),
          Center(child: Text('4')),
        ]),
      ),
    );
  }
}
