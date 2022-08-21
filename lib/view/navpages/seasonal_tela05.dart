import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:torakka_anime/view/widgets/anime_img_name.dart';
import 'package:torakka_anime/view/widgets/top_anime.dart';
import '../../model/generic_data_model/generic_data.dart';
import 'package:torakka_anime/requests/mal_queries.dart';

class SeasonalTela05 extends StatefulWidget {
  const SeasonalTela05({Key? key}) : super(key: key);

  @override
  State<SeasonalTela05> createState() => _SeasonalTela05State();
}

class _SeasonalTela05State extends State<SeasonalTela05> {
  String thisSeason = "This Season";
  String searchSeason = "Search Season";
  double fontSize = 22;
  int tab = 0;

  GenericData? seasonList;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //rank = Rank.fromJson(MalQuery().getRank('airing'));
    getData();
  }

  getData() async {
    seasonList = await MalQuery().getSeason('Summer', 2022);

    if (this.mounted) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ------------------------------------------- APP BAR -----------------------------------------
        automaticallyImplyLeading: false,
        title: Column(
          children: <Widget>[
            Center(
              child: SizedBox(
                height: 65,
                width: 65,
                child: Image.asset("assets/img/logo3.png"))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    tab = 0;
                  },
                  child: Text(
                    thisSeason,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    tab = 1;
                  },
                  child: Text(
                    searchSeason,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize),
                  ),
                ),
              ],
            ),
          ],
        ),
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 10, 34, 57),
      ),
      //backgroundColor: Color.fromARGB(255, 0, 34, 255),
      backgroundColor: Colors.white,
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          return Center(
            child: AnimeImgName(
            numero: index,
            imgLink: seasonList?.data
                    ?.elementAt(index)
                    .node
                    ?.mainPicture
                    ?.medium ??
                '',
            nome: seasonList?.data?.elementAt(index).node?.title ?? '',
            desc: "",),
          );
        })
      )
    );
  }
}
