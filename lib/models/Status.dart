class Status {
  String? status;
  String? resone;

  Status({this.status, this.resone});

  Status.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resone = json['resone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['resone'] = this.resone;
    return data;
  }
}
