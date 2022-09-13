import 'package:flutter/material.dart';

class TopAnime extends StatefulWidget {
  const TopAnime({
    Key? key,
    required this.numero,
    required this.imgLink,
    required this.nome,
    required this.desc,
  }) : super(key: key);

  final int numero;
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
  get x => numero + 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 108,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/anime");
            },
            child: Row(children: [
              const SizedBox(width: 15),
              SizedBox(
                width: 35,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '$x',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 10, 34, 57),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Container(
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(imgLink),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 10, 34, 57),
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    desc,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 0),
                  ),
                ],
              )),
            ]),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
