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

  List<String> seasons = <String>['spring', 'summer', 'fall', 'winter'];
  String dropdownvalue = 'spring';
  int yearBar = 1;
  final fieldText = TextEditingController();

  @override
  void initState() {
    super.initState();

    //rank = Rank.fromJson(MalQuery().getRank('airing'));
    if (3 <= mesAtual && mesAtual <= 5) {
      getData('spring', anoAtual);
    } else if (6 <= mesAtual && mesAtual <= 8) {
      getData('summer', anoAtual);
    } else if (9 <= mesAtual && mesAtual <= 11) {
      getData('fall', anoAtual);
    } else if (12 <= mesAtual || mesAtual <= 2) {
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

                          if (3 <= mesAtual && mesAtual <= 5) {
                            getData('spring', anoAtual);
                          } else if (6 <= mesAtual && mesAtual <= 8) {
                            getData('summer', anoAtual);
                          } else if (9 <= mesAtual && mesAtual <= 11) {
                            getData('fall', anoAtual);
                          } else if (12 <= mesAtual || mesAtual <= 2) {
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
                        isLoaded = true;
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
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (isLoaded) {
              if (tab == 0) {
                return GridView.count(
                    padding: const EdgeInsets.only(top: 20),
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
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
                        nome: seasonList?.data?.elementAt(index).node?.title ??
                            '',
                        desc: "",
                      );
                    }));
              } else if (tab == 1) {
                return Center(
                    child: ListView(
                  children: List.generate(7, (index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          const SizedBox(height: 10.0),
                          const Text(
                            "Search by year",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 10, 34, 57),
                                fontWeight: FontWeight.bold,
                                fontSize: 21),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 110,
                                height: 30,
                                child: TextField(
                                  onChanged: (String value) {
                                    try {
                                      yearBar = int.parse(value);
                                    } on Exception catch (_) {
                                      setState(() {
                                        fieldText.clear();
                                      });
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const AlertDialog(
                                                title: Text('Error input'),
                                                content: Text('Only number'),
                                              ));
                                    }
                                  },
                                  controller: fieldText,
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey,
                                    hintText: 'Type here',
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(1000)),
                                  ),
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DropdownButton<String>(
                                  value: dropdownvalue,
                                  items: seasons.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropdownvalue = value!;
                                    });
                                  }),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tab = 2;
                                    isLoaded = false;
                                    getData(dropdownvalue, yearBar);
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 10, 34, 57),
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Search",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    } else {
                      int ano = anoAtual - (index - 1);
                      return Column(children: [
                        const SizedBox(height: 10.0),
                        Text(
                          "$ano",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
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
                      ]);
                    }
                  }),
                ));
              } else {
                return WillPopScope(
                  onWillPop: () async {
                    setState(() {
                      tab = 1;
                    });
                    return false;
                  },
                  child: GridView.count(
                      padding: const EdgeInsets.only(top: 20),
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 4,
                      childAspectRatio: (120 / 140),
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
                          nome:
                              seasonList?.data?.elementAt(index).node?.title ??
                                  '',
                          desc: "",
                        );
                      })),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
