import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:torakka_anime/components/auth_required_state.dart';
import 'package:torakka_anime/requests/mal_queries.dart';
import 'package:torakka_anime/utils/aux_func.dart';
import 'package:torakka_anime/utils/constants.dart';
import 'package:torakka_anime/view/widgets/topAnime.dart';

import '../../model/generic_data_model/generic_data.dart';

class Home_Tela03 extends StatefulWidget {
  const Home_Tela03({Key? key}) : super(key: key);

  @override
  State<Home_Tela03> createState() => _Home_Tela03State();
}

class _Home_Tela03State extends AuthRequiredState<Home_Tela03> {
  GenericData? rank;

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
    rank = await MalQuery().getRank('airing');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //print(rank?.data?.elementAt(1).node?.title ?? 'some default');
    return Scaffold(
      appBar: AppBar(
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
                child: Column(children: [
                  Container(
                    height: 50,
                    color: const Color.fromARGB(255, 10, 34, 57),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Text(
                          "Top Airing Anime",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                              )),
                              onPressed: () {},
                              child: const Text('More',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  TopAnime(
                      // ========================================================== TOP 1 ===============================================
                      numero: '1',
                      imgLink:
                          rank?.data?.elementAt(0).node?.mainPicture?.medium ??
                              '',
                      nome: rank?.data?.elementAt(0).node?.title ?? 'default',
                      desc: ""),
                  const SizedBox(
                    height: 5,
                  ),
                  TopAnime(
                      // ========================================================== TOP 2 ===============================================
                      numero: '2',
                      imgLink:
                          rank?.data?.elementAt(1).node?.mainPicture?.medium ??
                              '',
                      nome: rank?.data?.elementAt(1).node?.title ?? 'default',
                      desc: ""),
                  const SizedBox(height: 5),
                  TopAnime(
                      // ========================================================== TOP 3 ===============================================
                      numero: '3',
                      imgLink:
                          rank?.data?.elementAt(2).node?.mainPicture?.large ??
                              '',
                      nome: rank?.data?.elementAt(2).node?.title ?? 'default',
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
                  Container(
                    height: 50,
                    color: const Color.fromARGB(255, 10, 34, 57),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Text(
                          "Top Anime",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                              )),
                              onPressed: () {},
                              child: const Text('More',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  const TopAnime(
                      // ========================================================== TOP 1 ===============================================
                      numero: '1',
                      imgLink: '',
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                  const SizedBox(
                    height: 5,
                  ),
                  const TopAnime(
                      // ========================================================== TOP 2 ===============================================
                      numero: '2',
                      imgLink: '',
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                  const SizedBox(height: 5),
                  const TopAnime(
                      // ========================================================== TOP 3 ===============================================
                      numero: '3',
                      imgLink: '',
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
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
                  Container(
                    height: 50,
                    color: const Color.fromARGB(255, 10, 34, 57),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Text(
                          "Top Upcoming Anime",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                              )),
                              onPressed: () {},
                              child: const Text('More',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  const TopAnime(
                      // ========================================================== TOP 1 ===============================================
                      numero: '1',
                      imgLink: '',
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                  const SizedBox(
                    height: 5,
                  ),
                  const TopAnime(
                      // ========================================================== TOP 2 ===============================================
                      numero: '2',
                      imgLink: '',
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
                  const SizedBox(height: 5),
                  const TopAnime(
                      // ========================================================== TOP 3 ===============================================
                      numero: '3',
                      imgLink: '',
                      nome: "Kingdom 4th Season",
                      desc: "TV, 26 eps, scored 8.81"),
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
