import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavoritesAnime extends StatefulWidget {
  const FavoritesAnime({
    Key? key,
    required this.id,
    required this.imgLink,
  }) : super(key: key);

  final int? id;
  final String? imgLink;

  @override
  State<FavoritesAnime> createState() => _FavoritesAnimeState();
}

class _FavoritesAnimeState extends State<FavoritesAnime> {
  get id => widget.id;
  get imgLink => widget.imgLink;

  @override
  Widget build(BuildContext context) {
    debugPrint('entrou na funcao favorites');
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("/anime", arguments: id);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Container(
              width: 115,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imgLink),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
