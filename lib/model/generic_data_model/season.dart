class Season {
  int? _year;
  String? _season;

  Season({int? year, String? season}) {
    if (year != null) {
      this._year = year;
    }
    if (season != null) {
      this._season = season;
    }
  }

  int? get year => _year;
  set year(int? year) => _year = year;
  String? get season => _season;
  set season(String? season) => _season = season;

  Season.fromJson(Map<String, dynamic> json) {
    _year = json['year'];
    _season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this._year;
    data['season'] = this._season;
    return data;
  }
}