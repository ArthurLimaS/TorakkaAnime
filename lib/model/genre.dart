class Genre {
  int? _id;
  String? _name;

  Genre({int? id, String? name}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
  }

  /*nao necessario no momento
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  */

  Genre.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['name'] = _name;
    return data;
  }
}