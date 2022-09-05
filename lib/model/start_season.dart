class StartSeason {
  int? year;
  String? season;

  StartSeason({int? year, String? season}) {
    if (year != null) {
      year = year;
    }
    if (season != null) {
      season = season;
    }
  }
  
  

  StartSeason.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = year;
    data['season'] = season;
    return data;
  }
}