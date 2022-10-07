class UniversityModel {
  String? msg;
  String? status;
  int? code;
  List<Data>? data;

  UniversityModel({this.msg, this.status, this.code, this.data});

  UniversityModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? universityNameEn;
  String? universityNameAr;
  int? country;
  int? status;

  Data(
      {this.id,
        this.universityNameEn,
        this.universityNameAr,
        this.country,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    universityNameEn = json['universityNameEn'];
    universityNameAr = json['universityNameAr'];
    country = json['country'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['universityNameEn'] = this.universityNameEn;
    data['universityNameAr'] = this.universityNameAr;
    data['country'] = this.country;
    data['status'] = this.status;
    return data;
  }
}
