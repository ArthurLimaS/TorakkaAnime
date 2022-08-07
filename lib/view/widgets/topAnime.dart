import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopAnime extends StatefulWidget {
  const TopAnime({
    Key? key,
    required this.numero,
    required this.imgLink,
    required this.nome,
    required this.desc,
  }) : super(key: key);

  final String numero;
  final String imgLink;
  final String nome;
  final String desc;

  @override
  State<TopAnime> createState() => _TopAnimeState();
}

class _TopAnimeState extends State<TopAnime> {
  get numero => widget.numero;
  get imgLink => widget.imgLink;
  get nome => widget.nome;
  get desc => widget.desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      //============================================================== TOP 1 ======================================================
      height: 108,
      child: Row(children: [
        const SizedBox(width: 10),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            numero,
            style: const TextStyle(
                color: Color.fromARGB(255, 10, 34, 57),
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ),
        const SizedBox(width: 40),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Image.network(imgLink),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nome,
              style: const TextStyle(
                  color: Color.fromARGB(255, 10, 34, 57),
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            const SizedBox(height: 20),
            Text(
              desc,
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 0),
            ),
          ],
        )),
      ]),
    );
  }
}
