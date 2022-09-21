import 'package:flutter/material.dart';
import 'package:torakka_anime/requests/supabase_request.dart';
import 'package:torakka_anime/utils/constants.dart';
import 'package:torakka_anime/view/navpages/telasInternas/lista.dart';
import '../../../model/anime_list_model/data.dart';

class ListaTela06 extends StatefulWidget {
  const ListaTela06({Key? key}) : super(key: key);

  @override
  State<ListaTela06> createState() => _ListaTela06State();
}

class _ListaTela06State extends State<ListaTela06> {
  List<Data>? animes;
  List<Data>? watching;
  List<Data>? planToWatching;
  List<Data>? dropped;
  List<Data>? completed;
  var isLoaded = false;

  List<Data>? getList(List<Data>? animes, String status) {
    List<Data>? list = [];

    for (var animeListRow in animes!) {
      if (animeListRow.animeStatus == status) {
        list.add(animeListRow);
      }
    }

    return list;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    animes = await SupabaseRequest()
        .getAnimeList(SupabaseRequest().getActiveUser()?.id);
    watching = getList(animes, Status.watching.name);
    planToWatching = getList(animes, Status.planToWatching.name);
    dropped = getList(animes, Status.dropped.name);
    completed = getList(animes, Status.completed.name);
    //debugPrint('tamanho dentro da função add to list ${watching?.length}');
    //debugPrint('tamanho dentro da função add to list ${animes?.length}');
    if (animes != null) {
      if (mounted) {
        setState(() {
          isLoaded = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // ------------------------------------------- APP BAR -----------------------------------------
          title: Center(
              child: SizedBox(
                  height: 65,
                  width: 65,
                  child: Image.asset("assets/img/logo3.png"))),
          bottom: const TabBar(isScrollable: true, tabs: [
            Tab(text: 'Watching'),
            Tab(text: 'Completed'),
            Tab(text: 'Dropped'),
            Tab(text: 'Plan to Watch'),
          ]),
          backgroundColor: const Color.fromARGB(255, 10, 34, 57),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Builder(builder: (BuildContext context) {
                if (isLoaded) {
                  if (watching!.isEmpty) {
                    return const Center(child: Text('List Empty'));
                  }
                  return Lista(animes: watching);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
              Builder(builder: (BuildContext context) {
                if (isLoaded) {
                  if (completed!.isEmpty) {
                    return const Center(child: Text('List Empty'));
                  }
                  return Lista(animes: completed);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
              Builder(builder: (BuildContext context) {
                if (isLoaded) {
                  if (dropped!.isEmpty) {
                    return const Center(child: Text('List Empty'));
                  }
                  return Lista(animes: dropped);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
              Builder(builder: (BuildContext context) {
                if (isLoaded) {
                  if (planToWatching!.isEmpty) {
                    return const Center(child: Text('List Empty'));
                  }
                  return Lista(animes: planToWatching);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ]),
      ),
    );
  }
}
