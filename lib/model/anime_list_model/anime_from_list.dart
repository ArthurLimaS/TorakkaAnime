class ANIME {
  String? title;
  String? mainPictureMedium;
  String? mediaType;
  String? status;
  int? idExt;

  ANIME(
      {this.title,
      this.mainPictureMedium,
      this.mediaType,
      this.status,
      this.idExt});

  ANIME.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    mainPictureMedium = json['main_picture_medium'];
    mediaType = json['media_type'];
    status = json['status'];
    idExt = json['id_external_anime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['main_picture_medium'] = this.mainPictureMedium;
    data['media_type'] = this.mediaType;
    data['status'] = this.status;
    data['id_external_anime'] = this.idExt;
    return data;
  }
}
