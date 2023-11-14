class ClientModel {
  String? companyId;
  CompanyDB? companyDB;

  ClientModel({this.companyId, this.companyDB});

  ClientModel.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    companyDB = json['companyDB'] != null
        ? new CompanyDB.fromJson(json['companyDB'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['companyId'] = this.companyId;
    if (this.companyDB != null) {
      data['companyDB'] = this.companyDB!.toJson();
    }
    return data;
  }
}

class CompanyDB {
  String? id;
  String? createdAt;
  String? companyName;
  String? typeOfbuisness;
  List<String>? userid;

  CompanyDB(
      {this.id,
      this.createdAt,
      this.companyName,
      this.typeOfbuisness,
      this.userid});

  CompanyDB.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    companyName = json['companyName'];
    typeOfbuisness = json['typeOfbuisness'];
    userid = json['userid'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['companyName'] = this.companyName;
    data['typeOfbuisness'] = this.typeOfbuisness;
    data['userid'] = this.userid;
    return data;
  }
}
