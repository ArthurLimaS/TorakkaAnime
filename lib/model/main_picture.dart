class MainPicture {
  String? _medium;
  String? _large;

  MainPicture({String? medium, String? large}) {
    if (medium != null) {
      _medium = medium;
    }
    if (large != null) {
      _large = large;
    }
  }

  
  String? get medium => _medium;
  set medium(String? medium) => _medium = medium;
  String? get large => _large;
  set large(String? large) => _large = large;
  

  MainPicture.fromJson(Map<String, dynamic> json) {
    _medium = json['medium'];
    _large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = _medium;
    data['large'] = _large;
    return data;
  }
}