class Genre {
  int? id;
  String? name;

  Genre({int? id, String? name}) {
    if (id != null) {
      id = id;
    }
    if (name != null) {
      name = name;
    }
  }

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
