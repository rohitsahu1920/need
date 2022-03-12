class LoginResponse {
  String? status;
  String? password;
  String? firstName;
  String? lastName;
  String? profile;
  String? email;
  String? phone;
  String? addOne;
  String? addTwo;
  String? pincode;
  String? userid;
  String? city;
  String? state;
  String? iemi;
  String? androidVersion;
  String? isActive;
  String? ip;

  LoginResponse(
      {this.status,
        this.password,
        this.firstName,
        this.lastName,
        this.profile,
        this.email,
        this.phone,
        this.addOne,
        this.addTwo,
        this.pincode,
        this.userid,
        this.city,
        this.state,
        this.iemi,
        this.androidVersion,
        this.isActive,
        this.ip});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profile = json['profile'];
    email = json['email'];
    phone = json['phone'];
    addOne = json['add_one'];
    addTwo = json['add_two'];
    pincode = json['pincode'];
    userid = json['userid'];
    city = json['city'];
    state = json['state'];
    iemi = json['iemi'];
    androidVersion = json['android_version'];
    isActive = json['is_active'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['password'] = this.password;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile'] = this.profile;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['add_one'] = this.addOne;
    data['add_two'] = this.addTwo;
    data['pincode'] = this.pincode;
    data['userid'] = this.userid;
    data['city'] = this.city;
    data['state'] = this.state;
    data['iemi'] = this.iemi;
    data['android_version'] = this.androidVersion;
    data['is_active'] = this.isActive;
    data['ip'] = this.ip;
    return data;
  }
}
