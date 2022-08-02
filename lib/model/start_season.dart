class StartSeason {
  int? _year;
  String? _season;

  StartSeason({int? year, String? season}) {
    if (year != null) {
      _year = year;
    }
    if (season != null) {
      _season = season;
    }
  }
  
  /*nao necessario no momento
  int? get year => _year;
  set year(int? year) => _year = year;
  String? get season => _season;
  set season(String? season) => _season = season;
  */

  StartSeason.fromJson(Map<String, dynamic> json) {
    _year = json['year'];
    _season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = _year;
    data['season'] = _season;
    return data;
  }
}