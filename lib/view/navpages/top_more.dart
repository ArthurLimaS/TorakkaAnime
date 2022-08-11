import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:torakka_anime/view/widgets/top_anime.dart';
import 'package:torakka_anime/view/widgets/top_container.dart';

import '../../model/generic_data_model/generic_data.dart';
import '../../requests/mal_queries.dart';

class TopMore extends StatefulWidget {
  const TopMore({Key? key}) : super(key: key);

  @override
  State<TopMore> createState() => _TopMoreState();
}

class _TopMoreState extends State<TopMore> {
  String? x;
  bool y = true;
  GenericData? rank;

  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //rank = Rank.fromJson(MalQuery().getRank('airing'));
    //getData();
  }

  getData() async {
    if (identical(x, "Top Airing Anime")) {
      rank = await MalQuery().getRank('airing', limit: 50);
    } else if (x == "Top Anime") {
      rank = await MalQuery().getRank('all', limit: 50);
    } else if (x == "Top Upcoming Anime") {
      rank = await MalQuery().getRank('upcoming', limit: 50);
    }
    if (rank != null) {
      if (this.mounted) {
        setState(() {
          isLoaded = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments;
    x = "$arg";
    if (y) {
      getData();
      y = false;
    }
    return Scaffold(
      appBar: AppBar(
        // ------------------------------------------- APP BAR -----------------------------------------
        title: Text(
          "$arg",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        toolbarHeight: 50,
        backgroundColor: const Color.fromARGB(255, 10, 34, 57),
      ),
      backgroundColor: Colors.white,
      // ================================================================= BODY ========================================================================
      body: ListView(children: [
        const SizedBox(height: 20),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            //============================================================== TOP AIRING ANIME======================================================
            height: 5670,
            child: Column(children: <Widget>[
              for (int i = 0; i < 50; i++)
                TopAnime(
                    // ========================================================== TOP ===============================================
                    numero: i,
                    imgLink:
                        rank?.data?.elementAt(i).node?.mainPicture?.medium ??
                            '',
                    nome: rank?.data?.elementAt(i).node?.title ?? '',
                    desc: ""),
            ]),
          ),
        ]),
      ]),
    );
  }
}
