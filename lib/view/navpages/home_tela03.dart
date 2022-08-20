import 'package:flutter/material.dart';
import 'package:torakka_anime/requests/mal_queries.dart';
import 'package:torakka_anime/utils/aux_func.dart';
import 'package:torakka_anime/utils/constants.dart';
import 'package:torakka_anime/view/widgets/top_anime.dart';
import 'package:torakka_anime/view/widgets/top_container.dart';

import '../../model/generic_data_model/generic_data.dart';

class HomeTela03 extends StatefulWidget {
  const HomeTela03({Key? key}) : super(key: key);

  @override
  State<HomeTela03> createState() => _HomeTela03State();
}

class _HomeTela03State extends State<HomeTela03> {
  GenericData? rankAiring;
  GenericData? rankTop;
  GenericData? rankUpcoming;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //rank = Rank.fromJson(MalQuery().getRank('airing'));
    getData();
  }

  Future _onSignOutPress(BuildContext context) async {
    final response = await supabase.auth.signOut();
    if (response.error != null) {
      showToastMessage(response.error!.message);
    }
  }

  getData() async {
    rankAiring = await MalQuery().getRank('airing');
    rankUpcoming = await MalQuery().getRank('upcoming');
    rankTop = await MalQuery().getRank('all');
    if (rankAiring != null && rankTop != null && rankUpcoming != null) {
      if (this.mounted) {
        setState(() {
          isLoaded = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //print(rank?.data?.elementAt(1).node?.title ?? 'some default');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // ------------------------------------------- APP BAR -----------------------------------------
        titleSpacing: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              _onSignOutPress(context);
            },
            child: const Text(
              "Sign Out",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          )
        ],
        title: Center(
            child: SizedBox(
                height: 65,
                width: 65,
                child: Image.asset("assets/img/logo3.png"))),
        toolbarHeight: 50,
        backgroundColor: const Color.fromARGB(255, 10, 34, 57),
      ),
      backgroundColor: Colors.white,
      // ================================================================= BODY ========================================================================
      body: ListView(
        children: [
          const SizedBox(height: 30),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                //============================================================== TOP AIRING ANIME======================================================
                height: 400,

                width: 365,

                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),

                child: Column(children: <Widget>[
                  const TopContainer(nome: 'Top Airing Anime'),
                  const SizedBox(height: 7),
                  for (int i = 0; i < 3; i++)
                    
                    TopAnime(
                        // ========================================================== TOP ===============================================
                        numero: i,
                        imgLink: rankAiring?.data
                                ?.elementAt(i)
                                .node
                                ?.mainPicture
                                ?.medium ??
                            '',
                        nome: rankAiring?.data?.elementAt(i).node?.title ?? '',
                        desc: ""),
                    
                ]),

              ),
              
              const SizedBox(height: 30),
              Container(
                //============================================================== TOP ANIME======================================================
                height: 400,
                width: 365,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(children: [
                  const TopContainer(nome: 'Top Anime'),
                  const SizedBox(height: 7),
                  for (int i = 0; i < 3; i++)
                    TopAnime(
                        // ========================================================== TOP ===============================================
                        numero: i,
                        imgLink: rankTop?.data
                                ?.elementAt(i)
                                .node
                                ?.mainPicture
                                ?.medium ??
                            '',
                        nome: rankTop?.data?.elementAt(i).node?.title ?? '',
                        desc: ""),
                ]),
              ),
              const SizedBox(height: 30),
              Container(
                //============================================================== TOP UPCOMING ANIME======================================================
                height: 400,
                width: 365,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(children: [
                  const TopContainer(nome: 'Top Upcoming Anime'),
                  const SizedBox(height: 7),
                  for (int i = 0; i < 3; i++)
                    TopAnime(
                        // ========================================================== TOP ===============================================
                        numero: i,
                        imgLink: rankUpcoming?.data
                                ?.elementAt(i)
                                .node
                                ?.mainPicture
                                ?.medium ??
                            '',
                        nome:
                            rankUpcoming?.data?.elementAt(i).node?.title ?? '',
                        desc: ""),
                ]),
              ),
              const SizedBox(height: 30),
            ],
          ),
  
        ],
      ),
    );
  }
}
