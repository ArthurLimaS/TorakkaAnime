import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:torakka_anime/model/anime.dart';
import 'package:torakka_anime/model/anime_list_model/data.dart';
import 'package:torakka_anime/requests/mal_queries.dart';
import 'package:torakka_anime/requests/supabase_request.dart';
import 'package:torakka_anime/utils/aux_func.dart';
import 'package:torakka_anime/utils/constants.dart';

class TelaAnime extends StatefulWidget {
  const TelaAnime({Key? key}) : super(key: key);

  @override
  State<TelaAnime> createState() => _TelaAnimeState();
}

class _TelaAnimeState extends State<TelaAnime> {
  late int x;
  Anime? anime;
  Data? animeListRowInfo;
  bool y = true;
  int tamGenero = 3;
  var isLoaded = false;
  List<String> items = ['Watching', 'Plan to Watching', 'Completed', 'Dropped'];
  String? selectedItem = '';

  String? statusAnime(String? status) {
    debugPrint('o status eh $status');
    switch (status) {
      case 'watching':
        status = 'Watching';
        break;
      case 'planToWatching':
        status = 'Plan to Watching';
        break;
      case 'completed':
        status = 'Completed';
        break;
      case 'dropped':
        status = 'Dropped';
        break;
      default:
        status = '';
    }
    return status;
  }

  String statusReverso(String status) {
    switch (status) {
      case 'Watching':
        status = 'watching';
        break;
      case 'Plan to Watching':
        status = 'planToWatching';
        break;
      case 'Completed':
        status = 'completed';
        break;
      case 'Dropped':
        status = 'dropped';
        break;
    }
    return status;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getData();
    //getAnimeListRowData();
  }

  //adiciona um anime na lista
  _onAddAnimeToListPress(String status) async {
    String animeUUID = await SupabaseRequest().getAnimeUuid(anime?.id);

    animeListRowInfo = await SupabaseRequest().setAnimeToList(
        animeUUID, SupabaseRequest().getActiveUser()!.id, status);
    //if (animeListRowInfo != null) {}
  }

  //atualiza o numero de eps assistidos
  _onUpdateEpisodesPress(int? animeTotalEp, [int epNumber = 1]) async {
    if (animeTotalEp == null) {
      return debugPrint(
          'Variavel numEpisodes está vazia - ${anime?.numEpisodes}');
    }

    if (epNumber <= animeTotalEp && epNumber >= 0) {
      animeListRowInfo = await SupabaseRequest()
          .updateAnimeListEpisode(epNumber, animeListRowInfo?.idAnimeList);
      return;
    } else {
      debugPrint('Número de episódios inválido');
      return debugPrint('invalid episode number');
    }
  }

  //muda o status de um anime
  _onStatusChangePress(String status) async {
    if (status == Status.completed.name && anime?.status != 'completed') {
      showToastMessage('Anime isn\'t completed');
      return debugPrint('Anime não foi terminado');
    } else {
      animeListRowInfo = await SupabaseRequest()
          .changeAnimeStatus(status, animeListRowInfo?.idAnimeList);
      return;
    }
  }

  //adiciona ou remove o anime do favorito
  _onAddAnimeToFavoritePress() async {
    switch (animeListRowInfo?.favorite) {
      case null:
        animeListRowInfo = await SupabaseRequest()
            .addAnimeToFavorite(false, animeListRowInfo?.idAnimeList);
        break;
      case false:
        animeListRowInfo = await SupabaseRequest()
            .addAnimeToFavorite(true, animeListRowInfo?.idAnimeList);
        break;
      case true:
        animeListRowInfo = await SupabaseRequest()
            .addAnimeToFavorite(false, animeListRowInfo?.idAnimeList);
        break;
      default:
        debugPrint('nenhuma das alternativas anteriores');
        break;
    }
  }

  getAnimeListRowData() async {
    animeListRowInfo = await SupabaseRequest().getAnimeListRow(anime?.id);

    if (mounted) {
      setState(() {
        selectedItem = statusAnime(animeListRowInfo?.animeStatus);
      });
    }
  }

  getData() async {
    final arg = ModalRoute.of(context)!.settings.arguments;
    anime = await MalQuery().getAnime(int.parse('$arg'));
    getAnimeListRowData();

    if (animeListRowInfo != null) {
      if (mounted) {
        setState(() {});
      }
    }

    if (anime != null) {
      if (anime!.genres!.length > 4) {
        tamGenero = 4;
      } else {
        tamGenero = anime!.genres!.length;
      }
      if (mounted) {
        setState(() {
          isLoaded = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          // ------------------------------------------- APP BAR -----------------------------------------
          title: SizedBox(
              height: 65,
              width: 65,
              child: Image.asset("assets/img/logo3.png")),
          toolbarHeight: 50,
          backgroundColor: const Color.fromARGB(255, 10, 34, 57),
        ),
        backgroundColor: Colors.white,
        body: Builder(builder: (BuildContext) {
          if (isLoaded) {
            return ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      // ================================================================ TITULO ==================================================
                      height: 203,
                      color: const Color.fromARGB(255, 10, 34, 57),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Text(
                                anime?.title ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
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
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          anime?.mainPicture?.large ?? ''),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            // ================================================================================ STATUS DO ANIME =====================================
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 165,
                                  child: DropdownButton<String>(
                                    iconEnabledColor: Colors.white,
                                    dropdownColor:
                                        const Color.fromARGB(255, 10, 34, 57),
                                    value: (selectedItem!.isEmpty)
                                        ? null
                                        : selectedItem,
                                    hint: const Text(
                                      'Add to List',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    items: items
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (item) => setState(() {
                                      selectedItem = item;
                                      if (animeListRowInfo == null) {
                                        _onAddAnimeToListPress(
                                            statusReverso(selectedItem!));
                                      } else if (animeListRowInfo != null) {
                                        _onStatusChangePress(
                                            statusReverso(selectedItem!));
                                      }
                                    }),
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 218, 218, 218),
                                  thickness: 1,
                                ),
                                Container(
                                  // ================================================================================ EPISODES =====================================
                                  height: 80,
                                  width: 140,
                                  child: Column(
                                    children: [
                                      const Center(
                                        child: Text(
                                          'Episodes',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${animeListRowInfo?.episodesWatched ?? '0'}/${(anime?.numEpisodes == 0) ? '??' : anime?.numEpisodes}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {});
                                              },
                                              icon: const Icon(
                                                Icons
                                                    .add_circle_outline_rounded,
                                                color: Colors.white,
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 218, 218, 218),
                                  thickness: 1,
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: Center(
                                    // ================================================================================ ADD FAVORITES =====================================
                                    child: Text(
                                      'Add to Favorites',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 10, 34, 57),
                                        fontSize: 20,
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
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  // ================================================================ INFO DO ANIME/RANK/POPULARITY... =========================================================
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Rank',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 34, 57),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  '#${anime?.rank ?? ''}',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 10, 34, 57),
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const Text(
                                  'Popularity',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 34, 57),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  '#${anime?.popularity ?? ''}',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 10, 34, 57),
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const Text(
                                  'Score',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 10, 34, 57),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  '${anime?.score ?? ''}',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 10, 34, 57),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              VerticalDivider(
                                color: Color.fromARGB(255, 218, 218, 218),
                                thickness: 1,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  anime?.mediaType?.toUpperCase() ?? '',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 10, 34, 57),
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Text(
                                  anime?.status?.replaceAll('_', ' ') ?? '',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 10, 34, 57),
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Text(
                                  '${anime?.numEpisodes ?? ''} episodes',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 10, 34, 57),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(children: [
                    const Divider(
                      color: Color.fromARGB(255, 218, 218, 218),
                      thickness: 1,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      // ================================================ INFO DO ANIME/TEMPORADA/TEMPO POR EP ======================================================
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${anime?.startSeason?.season ?? ''} ${anime?.startSeason?.year ?? ''} • ${anime?.broadcast?.dayOfTheWeek ?? ''} at ${anime?.broadcast?.startTime ?? ''} • ${anime?.getEpisodeDurationMin() ?? ''} min per ep.',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 10, 34, 57),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Divider(
                      color: Color.fromARGB(255, 218, 218, 218),
                      thickness: 1,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      // ================================================ INFO DO ANIME/RATING/SOURCE.. ======================================================
                      child: Column(children: [
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text(
                              'Rating',
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 34, 57),
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.end,
                                anime?.rating
                                        ?.toUpperCase()
                                        .replaceAll('_', ' ') ??
                                    '',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 10, 34, 57),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              'Source',
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 34, 57),
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.end,
                                anime?.source?.replaceAll('_', ' ') ?? '',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 10, 34, 57),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              'Studio',
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 34, 57),
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.end,
                                anime?.studios?.first.name ?? '',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 10, 34, 57),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              'Aired',
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 34, 57),
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.end, //'Jul 6, 2022o ? t',
                                '${anime?.startDate ?? ''} to ${anime?.endDate ?? ''}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 10, 34, 57),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    const SizedBox(height: 15),
                    const Divider(
                      color: Color.fromARGB(255, 218, 218, 218),
                      thickness: 1,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      // ================================================ generos ======================================================
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < tamGenero; i++)
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 11, 53, 205),
                                borderRadius: BorderRadius.circular(1000),
                              ),
                              child: Center(
                                child: Text(
                                  anime?.genres?.elementAt(i).name ?? '',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Divider(
                      color: Color.fromARGB(255, 218, 218, 218),
                      thickness: 1,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      // ================================================ synopsys ======================================================
                      child: Row(
                        children: [
                          Flexible(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Synopsis',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 10, 34, 57),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    anime?.synopsis ?? '',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 10, 34, 57),
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 65),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
