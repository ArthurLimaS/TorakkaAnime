import 'broadcast.dart';
import 'genre.dart';
import 'main_picture.dart';
import 'start_season.dart';
import 'studio.dart';

class Anime {
  int? _id;
  String? _title;
  MainPicture? _mainPicture;
  String? _startDate;
  String? _endDate;
  String? _synopsis;
  double? _score;
  int? _rank;
  int? _popularity;
  String? _mediaType;
  String? _status;
  List<Genre>? _genres;
  int? _numEpisodes;
  StartSeason? _startSeason;
  Broadcast? _broadcast;
  String? _source;
  int? _averageEpisodeDuration;
  String? _rating;
  List<Studio>? _studios;

  Anime(
      {int? id,
      String? title,
      MainPicture? mainPicture,
      String? startDate,
      String? endDate,
      String? synopsis,
      double? score,
      int? rank,
      int? popularity,
      String? mediaType,
      String? status,
      List<Genre>? genres,
      int? numEpisodes,
      StartSeason? startSeason,
      Broadcast? broadcast,
      String? source,
      int? averageEpisodeDuration,
      String? rating,
      List<Studio>? studios}) {
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (mainPicture != null) {
      _mainPicture = mainPicture;
    }
    if (startDate != null) {
      _startDate = startDate;
    }
    if (endDate != null) {
      _endDate = endDate;
    }
    if (synopsis != null) {
      _synopsis = synopsis;
    }
    if (score != null) {
      _score = score;
    }
    if (rank != null) {
      _rank = rank;
    }
    if (popularity != null) {
      _popularity = popularity;
    }
    if (mediaType != null) {
      _mediaType = mediaType;
    }
    if (status != null) {
      _status = status;
    }
    if (genres != null) {
      _genres = genres;
    }
    if (numEpisodes != null) {
      _numEpisodes = numEpisodes;
    }
    if (startSeason != null) {
      _startSeason = startSeason;
    }
    if (broadcast != null) {
      _broadcast = broadcast;
    }
    if (source != null) {
      _source = source;
    }
    if (averageEpisodeDuration != null) {
      _averageEpisodeDuration = averageEpisodeDuration;
    }
    if (rating != null) {
      _rating = rating;
    }
    if (studios != null) {
      _studios = studios;
    }
  }

  //getters e setters, no momento, não tão necessários
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  MainPicture? get mainPicture => _mainPicture;
  set mainPicture(MainPicture? mainPicture) => _mainPicture = mainPicture;
  String? get startDate => _startDate;
  set startDate(String? startDate) => _startDate = startDate;
  String? get endDate => _endDate;
  set endDate(String? endDate) => _endDate = endDate;
  String? get synopsis => _synopsis;
  set synopsis(String? synopsis) => _synopsis = synopsis;
  double? get score => _score;
  set score(double? score) => _score = score;
  int? get rank => _rank;
  set rank(int? rank) => _rank = rank;
  int? get popularity => _popularity;
  set popularity(int? popularity) => _popularity = popularity;
  String? get mediaType => _mediaType;
  set mediaType(String? mediaType) => _mediaType = mediaType;
  String? get status => _status;
  set status(String? status) => _status = status;
  List<Genre>? get genres => _genres;
  set genres(List<Genre>? genres) => _genres = genres;
  int? get numEpisodes => _numEpisodes;
  set numEpisodes(int? numEpisodes) => _numEpisodes = numEpisodes;
  StartSeason? get startSeason => _startSeason;
  set startSeason(StartSeason? startSeason) => _startSeason = startSeason;
  Broadcast? get broadcast => _broadcast;
  set broadcast(Broadcast? broadcast) => _broadcast = broadcast;
  String? get source => _source;
  set source(String? source) => _source = source;
  int? get averageEpisodeDuration => _averageEpisodeDuration;
  set averageEpisodeDuration(int? averageEpisodeDuration) =>
      _averageEpisodeDuration = averageEpisodeDuration;
  String? get rating => _rating;
  set rating(String? rating) => _rating = rating;
  List<Studio>? get studios => _studios;
  set studios(List<Studio>? studios) => _studios = studios;

  Anime.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _mainPicture = json['main_picture'] != null
        ? new MainPicture.fromJson(json['main_picture'])
        : null;
    _startDate = json['start_date'];
    if (json['end_date'] == null) {
      _endDate = '?';
    } else {
      _endDate = json['end_date'];
    }
    _synopsis = json['synopsis'];
    _score = json['mean'];
    _rank = json['rank'];
    _popularity = json['popularity'];
    _mediaType = json['media_type'];
    _status = json['status'];

    if (json['genres'] != null) {
      _genres = <Genre>[];
      json['genres'].forEach((v) {
        _genres!.add(new Genre.fromJson(v));
      });
    } else {
      _genres = <Genre>[];
      _genres!.add(Genre(id: null, name: 'none found'));
    }
    _numEpisodes = json['num_episodes'];
    _startSeason = json['start_season'] != null
        ? new StartSeason.fromJson(json['start_season'])
        : null;
    _broadcast = json['broadcast'] != null
        ? new Broadcast.fromJson(json['broadcast'])
        : null;
    _source = json['source'];
    _averageEpisodeDuration = json['average_episode_duration'];
    if (json['rating'].toString().isEmpty || json['rating'] == null) {
      _rating = 'none';
    } else {
      _rating = json['rating'];
    }
    //print(json['studios']);
    if (json['studios'].toString() == '[]') {
      _studios = <Studio>[];
      _studios!.add(Studio(0, 'none'));
    } else if (json['studios'] != null) {
      _studios = <Studio>[];
      json['studios'].forEach((v) {
        //print(v);
        _studios!.add(new Studio.fromJson(v));
      });
    }
    //print(studios?.first.name);
    //print(studios?.length);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['title'] = _title;
    if (_mainPicture != null) {
      data['main_picture'] = _mainPicture!.toJson();
    }
    data['start_date'] = _startDate;
    data['end_date'] = _endDate;
    data['synopsis'] = _synopsis;
    data['score'] = _score;
    data['rank'] = _rank;
    data['popularity'] = _popularity;
    data['media_type'] = _mediaType;
    data['status'] = _status;
    if (_genres != null) {
      data['genres'] = _genres!.map((v) => v.toJson()).toList();
    }
    data['num_episodes'] = _numEpisodes;
    if (_startSeason != null) {
      data['start_season'] = _startSeason!.toJson();
    }
    if (_broadcast != null) {
      data['broadcast'] = _broadcast!.toJson();
    }
    data['source'] = _source;
    data['average_episode_duration'] = _averageEpisodeDuration;
    data['rating'] = _rating;
    if (_studios != null) {
      data['studios'] = _studios!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  int getEpisodeDurationMin() {
    if (averageEpisodeDuration == 0 || averageEpisodeDuration == null) {
      return 0;
    }
    return averageEpisodeDuration! ~/ 60;
  }
}
