import 'package:torakka_anime/model/generic_data_model/node.dart';
import 'package:torakka_anime/model/generic_data_model/ranking.dart';

class Data {
  Node? node;
  Ranking? ranking;

  Data({this.node, this.ranking});

  Data.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? new Node.fromJson(json['node']) : null;
    ranking =
        json['ranking'] != null ? new Ranking.fromJson(json['ranking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node!.toJson();
    }
    if (this.ranking != null) {
      data['ranking'] = this.ranking!.toJson();
    }
    return data;
  }
}
