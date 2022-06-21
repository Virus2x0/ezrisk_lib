class Country_models {
  late final int cId;
  late final String cName;

  Country_models({required this.cId, required this.cName});

  Country_models.fromJson(Map<String, dynamic> json, this.cId, this.cName) {
    cId = json['c_id'];
    cName = json['c_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c_id'] = this.cId;
    data['c_name'] = this.cName;
    return data;
  }
}
