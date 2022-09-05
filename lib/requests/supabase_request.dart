import 'dart:async';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torakka_anime/model/genre.dart';
import 'package:torakka_anime/utils/aux_func.dart';
import 'package:torakka_anime/utils/constants.dart';

import '../model/anime.dart';
import '../model/studio.dart';

Future supabaseInitialize() async {
  //init supabase singleton
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnnonKey);
}

class SupabaseRequest {
  Future<void> createNewUser(
      context, String email, String password, String nickname) async {
    final res = await supabase.auth.signUp(email, password,
        options: AuthOptions(redirectTo: myAuthRedirectUrl));

    if (res.error != null) {
      showToastMessage('Sign up failed: ${res.error!.message}', isError: true);
    } else if (res.data != null) {
      showToastMessage('Registration Success', isError: false);
      Navigator.of(context).pushReplacementNamed("/entrar");
    }
  }

  Future<void> signInExistingUser(
      context, String email, String? password) async {
    final res = await supabase.auth.signIn(
      email: email,
      password: password,
    );

    debugPrint(res.data!.toJson().toString());

    if (res.data != null) {
      showToastMessage('Login Success', isError: false);
      Navigator.pushReplacementNamed(context, '/home');
    } else if (res.error != null) {
      showToastMessage('Erro ${res.error!.message.toString()}', isError: true);
    }
  }

  Future<GotrueResponse> signOutActiveUser(context) async {
    final res = await supabase.auth.signOut();
    Navigator.pushReplacementNamed(context, '/entrar');

    return res;
  }

  User? getActiveUser() {
    final user = supabase.auth.user();

    return user;
  }

//-----------------------------INSERT ANIME TO DB------------------------------------
//iria usar uma stored procedure para inserir, mas acho melhor tratar aqui
  Future insertAnimeToDatabase(Anime anime) async {
    try {
      final res = await supabase.from('ANIME').upsert({
        'id_external_anime': anime.id,
        'title': anime.title,
        'main_picture_medium': anime.mainPicture?.medium,
        'main_picture_large': anime.mainPicture?.large,
        'start_date': anime.startDate,
        'end_date': anime.endDate,
        'synopsis': anime.synopsis,
        'score': anime.score,
        'rank': anime.rank,
        'popularity': anime.popularity,
        'media_type': anime.mediaType,
        'status': anime.status,
        'num_episodes': anime.numEpisodes,
        'start_season_season': anime.startSeason?.season,
        'start_season_year': anime.startSeason?.year,
        'broadcast_day_of_week': anime.broadcast?.dayOfTheWeek,
        'broadcast_start_time': anime.broadcast?.startTime,
        'source': anime.source,
        'episode_duration': anime.averageEpisodeDuration,
        'rating': anime.rating
      }, onConflict: 'id_external_anime').execute();

      if (res.error != null) {
        throw "Failed to insert in DB: ${res.error!.message}";
      }

      final idAnime = res.data[0]['id_anime'];
      if (kDebugMode) {
        print('DB: id_anime - $idAnime');
      }
      addGenreToDb(anime.genres, idAnime);
      addStudioToDb(anime.studios, idAnime);
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  Future addGenreToDb(List<Genre>? genres, idAnime) async {
    for (int i = 0; i < genres!.length; i++) {
      await supabase.rpc('add_genre', params: {
        '_external_id': genres.elementAt(i).id,
        '_name': genres.elementAt(i).name,
        '_id': idAnime
      }).execute();
    }
  }

  Future addStudioToDb(List<Studio>? studios, idAnime) async {
    for (int i = 0; i < studios!.length; i++) {
      await supabase.rpc('add_studio', params: {
        '_external_id': studios.elementAt(i).id,
        '_name': studios.elementAt(i).name,
        '_id': idAnime
      }).execute();
    }
  }

  //-------------------------------SET ANIME LIST--------------------------------------
  //adiciona anime a lista de anime
  Future setAnimeToList(
      String animeId, String userId, String status, int epWatched) async {
    final selectRes =
        await supabase.from('ANIME').select().eq('id_anime', animeId).execute();

    if (selectRes.error != null) {
      showToastMessage(
          'Can\'t add anime to list, error: ${selectRes.error?.message}');
      return;
    }

    try {
      final resUpsert = await supabase.from('ANIME_LIST').upsert({
        'anime_status': status,
        'episodes_watched': epWatched,
        'id_anime': animeId,
        'id_user': userId
      }, onConflict: 'id_anime').execute();

      if (resUpsert.error != null) {
        showToastMessage('error: ${resUpsert.error?.message}');
      }
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  //------------------------------GET ANIME----------------------------------------
  Future getAnimeDB(int animeId) async {
    final animeUuid = await getAnimeUuid(animeId);

    /*final res = await supabase
        .from('ANIME')
        .select('title, GENERO!inner(*), STUDIO!inner(*)')
        .eq('GENERO.id_anime', animeUuid)
        .eq('STUDIO.id_anime', animeUuid)
        .execute();*/

    final res = await supabase
        .from('ANIME')
        .select('title')
        .eq('rank', 41)
        .execute(count: CountOption.exact);

    if (res.error != null) {
      print('erro aqui: ${res.error?.message}');
      print('${res.data}');
    } else {
      print('${res.count}');
    }
    //tentar tratar os dados aqui e colocar em um objeto anime.
    //return res.data;
    return res.count;
  }

  Future getAnimeUuid(int animeId) async {
    final res = await supabase
        .from('ANIME')
        .select('id_anime')
        .eq('id_external_anime', animeId)
        .execute();

    if (res.error != null) {
      print('${res.error?.message}');
    } else {
      print('${res.data[0]['id_anime']}');
    }
    return res.data[0]['id_anime'];
  }

//------------------------------------GET ANIME FROM LIST------------------------
//falta testar
  Future getAnimeList(dynamic idUser) async {
    try {
      final res = await supabase
          .from('ANIME_LIST')
          .select(
              'anime_status, episodes_watched, favorite, ANIME!inner(title, main_picture_medium, media_type, status)')
          .eq('ANIME_LIST.id_user', idUser)
          .eq('ANIME_LIST.id_anime', 'ANIME.id_anime')
          .execute();

      if (res.error != null) {
        showToastMessage(res.error!.message);
      }

      return res.data;
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  Future getAnimeStatistic() async {
    var stats = [];

    try {
      //contagem total de animes na lista
      final res = await supabase
          .from('ANIME_LIST')
          .select('anime_status')
          .execute(count: CountOption.exact);
      stats.add(res.count);

      //contagem animes "completo"
      final resCom = await supabase
          .from('ANIME_LIST')
          .select('anime_status')
          .eq('anime_status', 'completed')
          .execute(count: CountOption.exact);
      stats.add(resCom.count);

      //contagem anime "assistindo"
      final resWat = await supabase
          .from('ANIME_LIST')
          .select('anime_status')
          .eq('anime_status', 'watching')
          .execute(count: CountOption.exact);
      stats.add(resWat.count);

      //contagem anime "planejo assistir"
      final resPlan = await supabase
          .from('ANIME_LIST')
          .select('anime_status')
          .eq('anime_status', 'planToWatching')
          .execute(count: CountOption.exact);
      stats.add(resPlan.count);
      //Contagem anime "dropped"
      final resDrop = await supabase
          .from('ANIME_LIST')
          .select('anime_status')
          .eq('anime_status', 'dropped')
          .execute(count: CountOption.exact);
      stats.add(resDrop.count);
    } catch (e) {
      showToastMessage(e.toString());
    }

    return stats;
  }
}

//Ficara faltando os gets para pegar as infos do banco de dados

/*
Future<GotrueJsonResponse> resetExistingUserPassword(
      String email, String? urlPath) async {
    final res = await supabase.auth.api.resetPasswordForEmail(
      email,
      options: AuthOptions(
        redirectTo: urlPath,
      ),
    );

    return res;
  }*/
