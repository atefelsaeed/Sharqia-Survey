class UserSurveysModel {
  bool? status;
  List<UserSurveysModelData>? data;

  UserSurveysModel({this.status, this.data});

  UserSurveysModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <UserSurveysModelData>[];
      json['data'].forEach((v) {
        data!.add(UserSurveysModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserSurveysModelData {
  int? id;
  String? userId;
  String? haeno;
  String? hAEName;
  String? qta;
  String? blokname;
  String? blok;
  String? x;
  String? y;
  String? status;
  String? note;
  String? createdAt;
  String? updatedAt;

  UserSurveysModelData({
    this.id,
    this.userId,
    this.haeno,
    this.hAEName,
    this.qta,
    this.blok,
    this.blokname,
    this.y,
    this.x,
    this.status,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  UserSurveysModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'].toString();
    haeno = json['HAE_NO'].toString();
    hAEName = json['HAE_name'].toString();
    qta = json['QTA'].toString();
    blok = json['BLOK'].toString();
    blokname = json['BLOK_NAME'].toString();
    y = json['Y'].toString();
    x = json['X'].toString();
    status = json['status'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['HAE_NO'] = haeno;
    data['HAE_name'] = hAEName;
    data['QTA'] = qta;
    data['BLOK'] = blok;
    data['BLOK_NAME'] = blokname;
    data['Y'] = y;
    data['X'] = x;
    data['status'] = status;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
