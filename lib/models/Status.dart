class Status {
  String? status;
  String? resone;

  Status({this.status, this.resone});

  Status.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resone = json['resone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['resone'] = resone;
    return data;
  }
}
