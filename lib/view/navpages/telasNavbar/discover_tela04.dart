import 'package:flutter/material.dart';
import 'package:torakka_anime/view/widgets/top_anime.dart';
import '../../../model/generic_data_model/generic_data.dart';
import 'package:torakka_anime/requests/mal_queries.dart';
import 'package:torakka_anime/model/generic_data_model/data.dart';

class DiscoverTela04 extends StatefulWidget {
  const DiscoverTela04({Key? key}) : super(key: key);

  @override
  State<DiscoverTela04> createState() => _DiscoverTela04State();
}

class _DiscoverTela04State extends State<DiscoverTela04> {
  GenericData? searchList;
  bool searchDone = false;
  int? listSize = 0;


  @override
  void initState() {
    super.initState();

    //rank = Rank.fromJson(MalQuery().getRank('airing'));
    getData('');
  }

  getData(String search) async {
    if (search.isEmpty) {
      searchList = await MalQuery().getRank('airing', limit: 30);
    } else {
      searchList = await MalQuery().searchAnime(search, limit: 30);
    }

    listSize = searchList?.data?.length;

    if(this.mounted){
      setState(() {
        searchDone = true;
      });
    }
  }

  TopAnime getElement(Data element){
    return TopAnime(
      id: element.node?.id ?? 0,
      numero: 0,
      imgLink: element.node?.mainPicture?.medium ?? '',
      nome: element.node?.title ?? '',
      desc: ""
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // ------------------------------------------- APP BAR -----------------------------------------
        title: Column(
          children: [
            SizedBox(
              width: 10000,
              child: Center(
                  child: SizedBox(
                      height: 45,
                      width: 65,
                      child: Image.asset("assets/img/logo3.png"))),
            ),
            SizedBox(
              width: 400,
              height: 30,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Discover',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(60, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1000)
                  )
                ),
                onSubmitted: (value) {
                  setState(() {
                    searchDone = false;
                  });
                  getData(value);
                },
              ),
            ),
          ],
        ),
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 10, 34, 57),
      ),
      
      backgroundColor: Colors.white,
      
      body: Builder(
        builder: ((BuildContext context) {
          if (searchDone) {
            return ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 7),
                    if (listSize! < 30)
                      for (int i = 0; i < listSize!; i++)
                        TopAnime(
                          id: searchList?.data?.elementAt(i).node?.id ?? 0,
                          numero: i,
                          imgLink: searchList?.data
                                  ?.elementAt(i)
                                  .node
                                  ?.mainPicture
                                  ?.medium ??
                              '',
                          nome: searchList?.data?.elementAt(i).node?.title ?? '',
                          desc: ""
                        ),
                    if (listSize! >= 30)
                      for (int i = 0; i < 30; i++)
                        TopAnime(
                          id: searchList?.data?.elementAt(i).node?.id ?? 0,
                          numero: i,
                          imgLink: searchList?.data
                                  ?.elementAt(i)
                                  .node
                                  ?.mainPicture
                                  ?.medium ??
                              '',
                          nome: searchList?.data?.elementAt(i).node?.title ?? '',
                          desc: ""
                        ),
                  ],
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      )
    );
  }
}
