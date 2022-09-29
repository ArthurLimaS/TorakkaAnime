import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:torakka_anime/components/auth_required_state.dart';
import 'package:torakka_anime/requests/supabase_request.dart';
import 'package:torakka_anime/utils/aux_func.dart';
import 'package:torakka_anime/utils/constants.dart';
import 'package:torakka_anime/view/widgets/favorites_anime.dart';

import '../../../model/anime_list_model/data.dart';

class PerfilTela07 extends StatefulWidget {
  const PerfilTela07({Key? key}) : super(key: key);

  @override
  State<PerfilTela07> createState() => _PerfilTela07State();
}

class _PerfilTela07State extends AuthRequiredState<PerfilTela07> {
  List stats = [];
  bool isLoaded = false;
  List<Data>? favorites;

  Future _onSignOutPress(BuildContext context) async {
    final response = await supabase.auth.signOut();
    if (response.error != null) {
      showToastMessage(response.error!.message);
    }
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    stats = await SupabaseRequest()
        .getAnimeStatistic(supabase.auth.currentUser!.id);
    favorites = await SupabaseRequest()
        .getFavorites(SupabaseRequest().getActiveUser()?.id);

    if (mounted) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          // ------------------------------------------- APP BAR -----------------------------------------
          title: Stack(
            children: [
              Center(
                  child: SizedBox(
                      height: 65,
                      width: 65,
                      child: Image.asset("assets/img/logo3.png"))),
              SizedBox(
                height: 65,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        _onSignOutPress(context);
                      },
                      child: const Text(
                        "Exit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    )),
              ),
            ],
          ),

          toolbarHeight: 50,
          backgroundColor: const Color.fromARGB(255, 10, 34, 57),
        ),
        backgroundColor: Colors.white,
        body: Builder(builder: (BuildContext context) {
          if (isLoaded) {
            return ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      height: 217,
                      color: const Color.fromARGB(255, 10, 34, 57),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          child: const Text('My Profile',
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -10))
                                ],
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                decorationThickness: 3,
                              )),
                        ),
                      ),
                    ),
                    Container(
                      height: 400,
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          Container(
                            // ================================================================== IMG DO ANIME =============================================
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Align(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Container(
                                  width: 185,
                                  height: 285,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("assets/img/foto.png"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            // ================================================================================ NOME ==============================================================================
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 20),
                                  height: 50,
                                  width: 140,
                                  child: const Text(
                                    'GG_desu',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 218, 218, 218),
                                  thickness: 1,
                                ),
                                Align(
                                  child: Container(
                                    // ================================================================================ LISTA DE ANIME ======================================================================
                                    height: 40,
                                    width: 140,
                                    child: Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 10, 34, 57),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed("/edit");
                                            },
                                            child: const Text(
                                              'Edit_Profile',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 218, 218, 218),
                                  thickness: 1,
                                ),
                                const SizedBox(height: 70),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  // ================================================================================ STATUS DO ANIME ======================================================================
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Anime Stats',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Text(
                            'Total Entries',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontSize: 18,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.end,
                              '${stats.elementAt(0)}',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 10, 34, 57),
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        // ================================================================================ WATCHING ======================================================================
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            height: 15,
                            width: 15,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 36, 255, 0)),
                          ),
                          const Text(
                            'Watching',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontSize: 18,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.end,
                              '${stats.elementAt(2)}',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 10, 34, 57),
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        // ================================================================================ DROPPED ======================================================================
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            height: 15,
                            width: 15,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 161, 0, 0)),
                          ),
                          const Text(
                            'Dropped',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontSize: 18,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.end,
                              '${stats.elementAt(4)}',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 10, 34, 57),
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        // ================================================================================ COMPLETED ======================================================================
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            height: 15,
                            width: 15,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 11, 54, 205)),
                          ),
                          const Text(
                            'Completed',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontSize: 18,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.end,
                              '${stats.elementAt(1)}',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 10, 34, 57),
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        // ================================================================================ PLAN TO WATCH ======================================================================
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            height: 15,
                            width: 15,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 102, 102, 102)),
                          ),
                          const Text(
                            'Plan to Watch',
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontSize: 18,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.end,
                              '${stats.elementAt(3)}',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 10, 34, 57),
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 15),
                Container(
                  // ================================================================================ FAVORITES ======================================================================
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    'Favorites',
                    style: TextStyle(
                      color: Color.fromARGB(255, 10, 34, 57),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                    height: 150,
                    child: Builder(builder: (BuildContext context) {
                      if (isLoaded) {
                        if (favorites!.isEmpty) {
                          return const Center(child: Text('List Empty'));
                        } else {
                          debugPrint('chegou na lista ${favorites!.length}');
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              const SizedBox(width: 20),
                              for (int i = 0; i < favorites!.length; i++)
                                FavoritesAnime(
                                    id: favorites!.elementAt(i).aNIME!.idExt,
                                    imgLink: favorites!
                                        .elementAt(i)
                                        .aNIME!
                                        .mainPictureMedium)
                            ],
                          );
                        }
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    })),
                const SizedBox(height: 60),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
