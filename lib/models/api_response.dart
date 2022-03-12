class ApiResponse {
  String? status;
  String? resone;

  ApiResponse({this.status, this.resone});

  ApiResponse.fromJson(Map<String, dynamic> json) {
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
