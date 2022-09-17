import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:torakka_anime/model/anime.dart';
import 'package:torakka_anime/view/widgets/top_anime.dart';

class Lista extends StatefulWidget {
  const Lista({Key? key, required this.animes}) : super(key: key);

  final List<Anime> animes;

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
              for (int i = 0; i < widget.animes.length; i++)
                TopAnime(
                    numero: i,
                    imgLink:
                        widget.animes.elementAt(i).mainPicture?.medium ?? '',
                    nome: widget.animes.elementAt(i).title ?? '',
                    desc: '',
                    id: widget.animes.elementAt(i).id ?? 0)
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
