import 'package:flutter/material.dart';
import 'package:torakka_anime/components/auth_required_state.dart';
import 'package:torakka_anime/requests/mal_queries.dart';
import 'package:torakka_anime/requests/supabase_request.dart';
import 'package:torakka_anime/utils/aux_func.dart';
import 'package:torakka_anime/utils/constants.dart';
import 'package:torakka_anime/view/widgets/top_anime.dart';
import 'package:torakka_anime/view/widgets/top_container.dart';
import '../../../model/generic_data_model/generic_data.dart';

class HomeTela03 extends StatefulWidget {
  const HomeTela03({Key? key}) : super(key: key);

  @override
  State<HomeTela03> createState() => _HomeTela03State();
}

class _HomeTela03State extends AuthRequiredState<HomeTela03> {
  GenericData? rankAiring;
  GenericData? rankTop;
  GenericData? rankUpcoming;

  @override
  void initState() {
    super.initState();

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

    //TESTANDO AS FUNCOES DA LISTA DE ANIMES
    //SupabaseRequest().setAnimeToList('34a0569f-8ba3-4df2-95d9-bb1a895c49dc',
    //    supabase.auth.currentUser!.id, Status.watching.name, 10);
    //SupabaseRequest().getAnimeList(SupabaseRequest().getActiveUser()!.id);
    //SupabaseRequest().getAnimeListRow(45653);
    //SupabaseRequest()
    //    .updateAnimeListEpisode(10, 'e8c66675-c7ca-457a-bdb3-edda85d1dca6');
    //SupabaseRequest()
    //    .addAnimeToFavorite(false, 'e8c66675-c7ca-457a-bdb3-edda85d1dca6');
    //SupabaseRequest().getAnimeStatistic();
    //SupabaseRequest()
    //    .deleteAnimeFromList('a0d97695-78c3-4eef-987f-0148d61e03fe');
    if (rankAiring != null && rankTop != null && rankUpcoming != null) {
      if (this.mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // ------------------------------------------- APP BAR -----------------------------------------
        titleSpacing: 0.0,
        title: Stack(
          children: [
            Center(
                child: SizedBox(
                    height: 65,
                    width: 65,
                    child: Image.asset("assets/img/logo3.png"))),
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
        ),
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
                        id: rankAiring?.data?.elementAt(i).node?.id ?? 0,
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
                        id: rankTop?.data?.elementAt(i).node?.id ?? 0,
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
                        id: rankUpcoming?.data?.elementAt(i).node?.id ?? 0,
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
