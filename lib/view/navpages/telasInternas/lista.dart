import 'package:flutter/material.dart';
import 'package:torakka_anime/view/widgets/list_anime.dart';
import 'package:torakka_anime/view/widgets/top_anime.dart';
import '../../../model/anime_list_model/data.dart';

class Lista extends StatefulWidget {
  const Lista({Key? key, required this.animes}) : super(key: key);

  final List<Data>? animes;

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  get animes => widget.animes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              for (int i = 0; i < widget.animes!.length; i++)
                ListAnime(
                    idList: widget.animes?.elementAt(i).idAnimeList ?? '',
                    totalEps: widget.animes?.elementAt(i).aNIME?.totalEps ?? 0,
                    epsWatch: widget.animes?.elementAt(i).episodesWatched ?? 0,
                    imgLink:
                        widget.animes?.elementAt(i).aNIME?.mainPictureMedium ??
                            '',
                    nome: widget.animes?.elementAt(i).aNIME?.title ?? '',
                    id: widget.animes?.elementAt(i).aNIME?.idExt ?? 0)
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
