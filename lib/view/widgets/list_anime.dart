import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:torakka_anime/requests/supabase_request.dart';

import '../../utils/aux_func.dart';

class ListAnime extends StatefulWidget {
  const ListAnime({
    Key? key,
    required this.imgLink,
    required this.nome,
    required this.id,
    required this.epsWatch,
    required this.totalEps,
    required this.idList,
  }) : super(key: key);

  final int epsWatch;
  final int totalEps;
  final int id;
  final String idList;
  final String imgLink;
  final String nome;

  @override
  State<ListAnime> createState() => _ListAnimeState();
}

class _ListAnimeState extends State<ListAnime> {
  get id => widget.id;
  get idList => widget.idList;
  get imgLink => widget.imgLink;
  get nome => widget.nome;
  get epsWatch => widget.epsWatch;
  get totalEps => widget.totalEps;

  _onDeletePress() {
    SupabaseRequest().deleteAnimeFromList(idList);
  }

  _onUpdateEpisodesPress(int? animeTotalEp, [int epNumber = 1]) async {
    if (animeTotalEp == null) {
      return debugPrint('Variavel numEpisodes está vazia - $animeTotalEp');
    }

    if ((epNumber <= animeTotalEp && epNumber >= 0) ||
        (animeTotalEp == 0 && epNumber >= 0)) {
      var animeListRowInfo = await SupabaseRequest()
          .updateAnimeListEpisode(epNumber, widget.idList);
      return;
    } else {
      debugPrint('Número de episódios inválido');
      return showToastMessage('invalid episode number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 108,
          child: Row(
            children: [
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/anime", arguments: id);
                },
                child: ClipRRect(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 50,
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            _onUpdateEpisodesPress(totalEps, int.parse(value));
                            Navigator.of(context)
                                .pushReplacementNamed('/listaHome');
                          },
                          decoration: InputDecoration(hintText: '$epsWatch'),
                          textAlign: TextAlign.center,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      Text('/   $totalEps'),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              iconSize: 35,
                              onPressed: () {
                                _onDeletePress();
                                Navigator.of(context)
                                    .pushReplacementNamed('/listaHome');
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.grey,
                              )),
                          const SizedBox(width: 20),
                        ],
                      )),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
        const SizedBox(height: 5),
        const Divider(
          color: Color.fromARGB(255, 218, 218, 218),
          thickness: 1,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
