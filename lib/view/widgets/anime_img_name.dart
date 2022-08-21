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
    return Image(
      image: NetworkImage(imgLink)
    );
  }
}