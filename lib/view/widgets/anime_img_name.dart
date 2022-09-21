import 'package:flutter/material.dart';

class AnimeImgName extends StatefulWidget {
  final int numero;
  final String imgLink;
  final String nome;
  final String desc;
  final int id;

  const AnimeImgName({
    super.key,
    required this.numero,
    required this.imgLink,
    required this.nome,
    required this.desc,
    required this.id,
  });

  @override
  State<AnimeImgName> createState() => _AnimeImgNameState();
}

class _AnimeImgNameState extends State<AnimeImgName> {
  get id => widget.id;
  get numero => widget.numero;
  get imgLink => widget.imgLink;
  get nome => widget.nome;
  get x => numero + 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Container(
            width: 120,
            height: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imgLink),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/anime", arguments: id);
              },
            ),
          ),
        ),
        Text(
          nome,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color.fromARGB(255, 10, 34, 57),
              fontWeight: FontWeight.bold,
              fontSize: 13),
        ),
      ],
    );
  }
}
