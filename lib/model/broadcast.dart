class Broadcast {
  String? dayOfTheWeek;
  String? startTime;

  Broadcast({String? dayOfTheWeek, String? startTime}) {
    if (dayOfTheWeek != null) {
      dayOfTheWeek = dayOfTheWeek;
    }
    if (startTime != null) {
      startTime = startTime;
    }
  }
  

  Broadcast.fromJson(Map<String, dynamic> json) {
    dayOfTheWeek = json['day_of_the_week'];
    startTime = json['start_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day_of_the_week'] = dayOfTheWeek;
    data['start_time'] = startTime;
    return data;
  }
}
