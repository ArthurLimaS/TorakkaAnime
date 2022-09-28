import 'package:torakka_anime/model/anime_list_model/anime_from_list.dart';

class Data {
  String? animeStatus;
  int? episodesWatched;
  bool? favorite;
  String? idAnime;
  String? idUser;
  String? idAnimeList;
  ANIME? aNIME;

  Data(
      {this.animeStatus,
      this.episodesWatched,
      this.favorite,
      this.idAnime,
      this.idUser,
      this.idAnimeList,
      this.aNIME});

  Data.fromJson(Map<String, dynamic> json) {
    animeStatus = json['anime_status'];
    episodesWatched = json['episodes_watched'];
    favorite = json['favorite'];
    idAnime = json['id_anime'];
    idUser = json['id_user'];
    idAnimeList = json['id_anime_list'];
    aNIME = json['ANIME'] != null ? new ANIME.fromJson(json['ANIME']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['anime_status'] = this.animeStatus;
    data['episodes_watched'] = this.episodesWatched;
    data['favorite'] = this.favorite;
    data['id_anime'] = this.idAnime;
    data['id_user'] = this.idUser;
    data['id_anime_list'] = this.idAnimeList;
    if (this.aNIME != null) {
      data['ANIME'] = this.aNIME!.toJson();
    }
    return data;
  }
}
