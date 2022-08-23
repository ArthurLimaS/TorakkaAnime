import 'package:flutter/material.dart';

class AnimeImgName extends StatefulWidget {
  final int numero;
  final String imgLink;
  final String nome;
  final String desc;

  const AnimeImgName({super.key, required this.numero, required this.imgLink, required this.nome, required this.desc});

  @override
  State<AnimeImgName> createState() => _AnimeImgNameState();
}

class _AnimeImgNameState extends State<AnimeImgName> {
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
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imgLink),
              ),
            ),
          ),
        ),

        Text(
          nome,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color.fromARGB(255, 10, 34, 57),
              fontWeight: FontWeight.bold,
              fontSize: 17
          ),
        ),
      ],
    );
  }
}