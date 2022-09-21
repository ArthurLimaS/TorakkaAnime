import 'package:flutter/cupertino.dart';
import 'package:torakka_anime/model/anime.dart';
import 'package:torakka_anime/requests/request_mal.dart';
import 'package:torakka_anime/requests/supabase_request.dart';
import 'package:torakka_anime/utils/constants.dart';

import '../model/generic_data_model/generic_data.dart';

class MalQuery {
  int year = DateTime.now().year;

  Future getRank(String rankingType, {int limit = 3}) async {
    var query = '/ranking?ranking_type=$rankingType&limit=$limit';

    var response = await MalRequest().getAnimeRequest(query);
    var rank = GenericData.fromJson(response);
    //response = jsonDecode(response);
    //Anime anime = Anime.fromJson(response);
    //print(rank.data?.elementAt(1).node?.title);
    return rank;
  }

  Future getAnime(int id) async {
    var query = '/$id$animeFields';
    var response = await MalRequest().getAnimeRequest(query);
    var anime = Anime.fromJson(response);
    SupabaseRequest().insertAnimeToDatabase(anime);

    return anime;
  }

  Future searchAnime(String animeName, {int limit = 3}) async {
    var query = '?q=$animeName&limit=$limit';
    var response = await MalRequest().getAnimeRequest(query);
    var searchList = GenericData.fromJson(response);
    //print(searchList.data?.elementAt(0).node?.title);
    return searchList;
  }

  Future getSeason(String season, int year, {int limit = 3}) async {
    this.year = year;
    var query = '/season/${this.year}/$season?limit=$limit';
    var response = await MalRequest().getAnimeRequest(query);
    var seasonList = GenericData.fromJson(response);
    //print(seasonList.data?.elementAt(0).node?.title);
    debugPrint(response.toString());
    return seasonList;
  }
}
