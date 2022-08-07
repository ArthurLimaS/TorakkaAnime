import 'package:torakka_anime/model/generic_data_model/data.dart';
import 'package:torakka_anime/model/generic_data_model/paging.dart';
import 'package:torakka_anime/model/generic_data_model/season.dart';

class GenericData {
  List<Data>? _data;
  Paging? _paging;
  Season? _season;

  seasonal({List<Data>? data, Paging? paging, Season? season}) {
    if (data != null) {
      this._data = data;
    }
    if (paging != null) {
      this._paging = paging;
    }
    if (season != null) {
      this._season = season;
    }
  }

  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;
  Paging? get paging => _paging;
  set paging(Paging? paging) => _paging = paging;
  Season? get season => _season;
  set season(Season? season) => _season = season;

  GenericData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
    _paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    _season =
        json['season'] != null ? new Season.fromJson(json['season']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    if (this._paging != null) {
      data['paging'] = this._paging!.toJson();
    }
    if (this._season != null) {
      data['season'] = this._season!.toJson();
    }
    return data;
  }
}
