class Broadcast {
  String? _dayOfTheWeek;
  String? _startTime;

  Broadcast({String? dayOfTheWeek, String? startTime}) {
    if (dayOfTheWeek != null) {
      _dayOfTheWeek = dayOfTheWeek;
    }
    if (startTime != null) {
      _startTime = startTime;
    }
  }

  /*nao necessario no momento
  String? get dayOfTheWeek => _dayOfTheWeek;
  set dayOfTheWeek(String? dayOfTheWeek) => _dayOfTheWeek = dayOfTheWeek;
  String? get startTime => _startTime;
  set startTime(String? startTime) => _startTime = startTime;
  */

  Broadcast.fromJson(Map<String, dynamic> json) {
    _dayOfTheWeek = json['day_of_the_week'];
    _startTime = json['start_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day_of_the_week'] = _dayOfTheWeek;
    data['start_time'] = _startTime;
    return data;
  }
}
