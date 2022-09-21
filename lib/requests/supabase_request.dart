import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torakka_anime/model/anime_list_model/anime_list.dart';
import 'package:torakka_anime/model/anime_list_model/data.dart';
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
    try {
      final user = supabase.auth.user();
      debugPrint('func getActiveUser - active user: ${user!.id}');

      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  Future updateActiveUser(String name) async {
    try {
      final res = await supabase
          .from('USER')
          .update({'name': name})
          .eq('id_user', getActiveUser())
          .execute();
      if (res.error != null) {
        showToastMessage('Error - ${res.error!.message}');
      }
    } catch (e) {
      showToastMessage(e.toString());
    }
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
        //print('supabaseRequest class - DB: id_anime - $idAnime');
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

  //------------------------------GET ANIME----------------------------------------
  //ainda não usada
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

  //pega o UUID do anime no BD através do ID externo do anime(que vem da API)
  Future getAnimeUuid(int? animeId) async {
    try {
      final res = await supabase
          .from('ANIME')
          .select('id_anime')
          .eq('id_external_anime', animeId)
          .execute();

      if (res.error != null) {
        debugPrint('${res.error?.message}');
      } else {
        debugPrint(
            'func getanimeuuid - internal id anime: ${res.data[0]['id_anime']}');
      }

      return res.data[0]['id_anime'];
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

//--------------------------------------Funcoes ANIME LIST--------------------------------------
  //-------------------------------SET ANIME LIST--------------------------------------
  //adiciona anime a lista de anime
  //se já existir na lista, não irá adicionar
  Future setAnimeToList(String animeId, String userId,
      [String status = 'watching', int epWatched = 0]) async {
    //verifico se existe anime com esse id no banco de dados
    final selectRes =
        await supabase.from('ANIME').select().eq('id_anime', animeId).execute();

    if (selectRes.error != null) {
      showToastMessage(
          'Can\'t add anime to list, error: ${selectRes.error?.message}');
      return;
    }

    //verifico se esse anime já foi adicionado na lista
    final selectAnimeList = await supabase
        .from('ANIME_LIST')
        .select('*')
        .eq('id_anime', animeId)
        .eq('id_user', userId)
        .execute();

    if (selectAnimeList.error != null) {
      showToastMessage('can\'t add anime');
      return debugPrint('error - ${selectAnimeList.error!.message}');
    }

    if (selectAnimeList.data.toString() != '[]') {
      return debugPrint('Anime já existe na lista - ${selectAnimeList.data}');
    }

    try {
      final resUpsert = await supabase.from('ANIME_LIST').insert({
        'anime_status': status,
        'episodes_watched': epWatched,
        'id_anime': animeId,
        'id_user': userId
      }).execute();

      if (resUpsert.error != null) {
        showToastMessage('can\'t add anime');
        return debugPrint('error: ${resUpsert.error?.message}');
      }
      showToastMessage('Anime adicionado com sucesso');
      debugPrint('Anime adicionado com sucesso ${resUpsert.data}');
      var animeListRow = Data.fromJson(resUpsert.data[0]);
      return animeListRow;
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  //FUNCAO QUE ADICIONA OU REMOVE ANIME AOS FAVORITOS
  Future addAnimeToFavorite(bool favorite, String? uuidAnimeList) async {
    try {
      final response = await supabase
          .from('ANIME_LIST')
          .update({'favorite': favorite})
          .eq('id_anime_list', uuidAnimeList)
          .execute();

      if (response.error != null) {
        debugPrint('error: ${response.error!.message}');
      } else {
        showToastMessage(
            (favorite == true) ? 'Favorite added' : 'Favorite removed');
      }

      var animeListRow = Data.fromJson(response.data[0]);
      return animeListRow;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//fazer uma logica antes de entrar nessa função,
  //para não conseguir adicionar valores maiores
  //que o tamanho real de eps que o anime tem
  //criar uma func aux que verifica isso
  //-----------------------------------------------------
  //Funcao que atualiza os episodios assistidos de um anime
  Future updateAnimeListEpisode(int epNumber, String? uuidAnimeList) async {
    try {
      final response = await supabase
          .from('ANIME_LIST')
          .update({'episodes_watched': epNumber})
          .eq('id_anime_list', uuidAnimeList)
          .execute();

      if (response.error != null) {
        debugPrint('error: ${response.error!.message}');
      }

      //como retorna a a lista do episodio que modificou, atualizada,
      //vou pegar essa informação pra atualizar a variavel da propria pagina de anime
      debugPrint('func updateanimelistepisode - ${response.data}');
      showToastMessage('Episodios atualizados');
      var animeListUpdated = Data.fromJson(response.data[0]);
      return animeListUpdated;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future changeAnimeStatus(String status, String? uuidAnimeList) async {
    try {
      final response = await supabase
          .from('ANIME_LIST')
          .update({'anime_status': status})
          .eq('id_anime_list', uuidAnimeList)
          .execute();

      if (response.error != null) {
        debugPrint('error - ${response.error!.message}');
      }

      var animeListRow = Data.fromJson(response.data[0]);
      debugPrint('Mudança de status realizada - ${response.data[0]}');
      showToastMessage('Status Changed');
      return animeListRow;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//arrumar o model para  receber o id tbm
//funcao que vai pegar infos de apenas um anime da lista
  Future getAnimeListRow(int? animeIdExt) async {
    //talvez eu use o id interno do anime, depende de como a pagina do anime
    //vai ficar
    try {
      Data? animeListRow;
      final response = await supabase
          .from('ANIME_LIST')
          .select('*')
          .eq('id_user', getActiveUser()!.id)
          .eq('id_anime', await getAnimeUuid(animeIdExt))
          .execute();

      if (response.error != null) {
        debugPrint('error: ${response.error!.message}');
      }

      if (response.data.toString() == '[]') {
        return debugPrint(
            'Retorno vazio[], O anime não existe na lista do usuário atual');
      }
      animeListRow = Data.fromJson(response.data[0]);

      debugPrint('func getanimelistrow - ${response.data}');
      debugPrint('func getanimelistrow - ${animeListRow.animeStatus}');
      //pretendo criar um model para isso, para enviar já tratado
      return animeListRow;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//GET ANIME FROM LIST
  Future getAnimeList(dynamic idUser) async {
    try {
      List<Data>? animeList = [];
      final res = await supabase
          .from('ANIME_LIST')
          .select(
              '*, ANIME!inner(title, main_picture_medium, media_type, status, id_external_anime)')
          .eq('id_user', idUser)
          .execute();

      if (res.error != null) {
        showToastMessage('Error - ${res.error!.message}');
      }

      for (var animeListRow in res.data) {
        animeList.add(new Data.fromJson(animeListRow));
      }
      debugPrint('func getanimelistrow - ${res.data}');
      //debugPrint('func getanimelist - ${animeList.elementAt(0).aNIME?.title}');
      //return animeList;
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  //DELETA UM ANIME DA LISTA DE ANIMES
  Future deleteAnimeFromList(String idAnimeList) async {
    try {
      final res = await supabase
          .from('ANIME_LIST')
          .delete()
          .match({'id_anime_list': idAnimeList}).execute();

      if (res.error != null) {
        showToastMessage('Error - ${res.error!.message}');
      }

      debugPrint('func deleteanimelist - ${res.data}');
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  //GET ANIME LIST STATISTIC
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

    debugPrint(stats.toString());
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
