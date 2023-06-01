class ClientListModel {
  String? id;
  String? createdAt;
  String? companyName;
  String? typeOfbuisness;
  List<String>? userid;

  ClientListModel(
      {this.id,
      this.createdAt,
      this.companyName,
      this.typeOfbuisness,
      this.userid});

  ClientListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    companyName = json['companyName'];
    typeOfbuisness = json['typeOfbuisness'];
    userid = json['userid'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['companyName'] = this.companyName;
    data['typeOfbuisness'] = this.typeOfbuisness;
    data['userid'] = this.userid;
    return data;
  }
}
