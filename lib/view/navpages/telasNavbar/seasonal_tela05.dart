import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:torakka_anime/view/widgets/anime_img_name.dart';
import 'package:torakka_anime/view/widgets/top_anime.dart';
import '../../../model/generic_data_model/generic_data.dart';
import 'package:torakka_anime/requests/mal_queries.dart';

class SeasonalTela05 extends StatefulWidget {
  const SeasonalTela05({Key? key}) : super(key: key);

  @override
  State<SeasonalTela05> createState() => _SeasonalTela05State();
}

class _SeasonalTela05State extends State<SeasonalTela05> {
  double fontSize = 22;
  int tab = 0;
  // 0 caso na tela "This Season"
  // 1 caso na tela "Search Season"
  // 2 caso na tela "Search Season/season_X"

  double widthValue = 75;
  GenericData? seasonList;
  bool isLoaded = false;
  int? listSize = 0;

  int anoAtual = DateTime.now().year;
  int mesAtual = DateTime.now().month;
  //Map<int, Map<String, String>> generator;

  @override
  void initState() {
    super.initState();

    //rank = Rank.fromJson(MalQuery().getRank('airing'));
    if(3 <= mesAtual && mesAtual <= 5){
      getData('spring', anoAtual);
    } else if(6 <= mesAtual && mesAtual <= 8){
      getData('summer', anoAtual);
    } else if(9 <= mesAtual && mesAtual <= 11){
      getData('fall', anoAtual);
    } else if(12 <= mesAtual || mesAtual <= 2){
      getData('winter', anoAtual);
    }
  }

  getData(String season, int ano) async {
    seasonList = await MalQuery().getSeason(season, ano, limit: 500);

    listSize = seasonList?.data?.length;

    if (this.mounted) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  buttonSeasons(String season, int ano) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tab = 2;
          isLoaded = false;
          getData(season, ano);
        });
      },
      child: Container(
        height: 30,
        width: widthValue,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 10, 34, 57),
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Center(
          child: Text(
            season,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ), 
          ),
        ),
      ),
    );
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
                    setState(() {
                      if (tab != 0) {
                        tab = 0;
                        isLoaded = false;

                        if(3 <= mesAtual && mesAtual <= 5){
                          getData('spring', anoAtual);
                        } else if(6 <= mesAtual && mesAtual <= 8){
                          getData('summer', anoAtual);
                        } else if(9 <= mesAtual && mesAtual <= 11){
                          getData('fall', anoAtual);
                        } else if(12 <= mesAtual || mesAtual <= 2){
                          getData('winter', anoAtual);
                        }
                      }
                    });
                  },
                  child: Text(
                    "This Season",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize),
                  ),
                ),
                const SizedBox(width: 26),
                TextButton(
                  onPressed: () {
                      setState(() {
                        tab = 1;
                      });
                  },
                  child: Text(
                    "Search Season",
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
      body: Builder(
        builder: (BuildContext context) {
          if (isLoaded) {
            if (tab == 0) {
              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (120 / 150),
                children: List.generate(listSize!, (index) {
                  return AnimeImgName(
                    id: seasonList?.data?.elementAt(index).node?.id ?? 0,
                    numero: index,
                    imgLink: seasonList?.data
                            ?.elementAt(index)
                            .node
                            ?.mainPicture
                            ?.medium ??
                        '',
                    nome: seasonList?.data?.elementAt(index).node?.title ?? '',
                    desc: "",
                  );
                })
              );
            } else if (tab == 1) {
              return Center(
                child: ListView(
                  children: List.generate(11, (index) {
                    int ano = anoAtual - index;
                    return Column(
                      children: [
                        const SizedBox(height: 10.0),
                        Text(
                          "$ano",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buttonSeasons("winter", ano),
                            buttonSeasons("spring", ano),
                            buttonSeasons("summer", ano),
                            buttonSeasons("fall", ano)
                          ],
                        ),
                        const SizedBox(height: 10.0),
                      ]
                    );
                  }),
                )
              );
            } else {
              return WillPopScope(
                onWillPop: () async {
                  setState(() {
                    tab = 0;
                    isLoaded = false;
                    
                    if(3 <= mesAtual && mesAtual <= 5){
                      getData('spring', anoAtual);
                    } else if(6 <= mesAtual && mesAtual <= 8){
                      getData('summer', anoAtual);
                    } else if(9 <= mesAtual && mesAtual <= 11){
                      getData('fall', anoAtual);
                    } else if(12 <= mesAtual || mesAtual <= 2){
                      getData('winter', anoAtual);
                    }
                  });
                  return false;
                },
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (120 / 150),
                  children: List.generate(listSize!, (index) {
                    return AnimeImgName(
                      id: seasonList?.data?.elementAt(index).node?.id ?? 0,
                      numero: index,
                      imgLink: seasonList?.data
                              ?.elementAt(index)
                              .node
                              ?.mainPicture
                              ?.medium ??
                          '',
                      nome: seasonList?.data?.elementAt(index).node?.title ?? '',
                      desc: "",
                    );
                  })
                ),
              );
              
              
            }
          } else {
            return const Center(
              child: CircularProgressIndicator()
            );
          }
        },
      )
    );
  }
}