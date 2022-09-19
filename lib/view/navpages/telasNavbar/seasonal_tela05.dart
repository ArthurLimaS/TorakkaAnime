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

  double widthValue = 75;
  GenericData? seasonList;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    //rank = Rank.fromJson(MalQuery().getRank('airing'));
    getData();
  }

  getData() async {
    seasonList = await MalQuery().getSeason('summer', 2022, limit: 10);

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
                    setState(() {
                      tab = 0;
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
                childAspectRatio: (120 / 135),
                children: List.generate(10, (index) {
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
            } else {
              return const Text("yay");
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

/*
if (tab == 0){
  return GridView.count(
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
          desc: "",
        ),
      );
    })
  );
} else if (tab == 1) {
  return Center(
    child: ListView(
      children: List.generate(10, (index) {
        int ano = 2022 - index;
        return Column(
          children: [
            const SizedBox(height: 20.0),
            Text(
              "$ano",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 10, 34, 57),
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: widthValue,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 10, 34, 57),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: const Center(
                      child: Text(
                        "Winter",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ), 
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: widthValue,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 10, 34, 57),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: const Center(
                      child: Text(
                        "Spring",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ), 
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: widthValue,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 10, 34, 57),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: const Center(
                      child: Text(
                        "Summer",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ), 
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: widthValue,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 10, 34, 57),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: const Center(
                      child: Text(
                        "Fall",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ), 
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      })
    ),
  );
} else {
  return const Center();
}
*/