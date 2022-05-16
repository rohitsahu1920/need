class GetDashBoardModel {
  String? status;
  String? reasone;
  String? count;
  String? images;
  List<ProductOutputs>? productOutputs;

  GetDashBoardModel(
      {this.status,
        this.reasone,
        this.count,
        this.images,
        this.productOutputs});

  GetDashBoardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? json['status'] as String : "";
    reasone = json['reasone'] == null ? "" : json['reasone'] as String;
    count = json['count'] == null ? "" : json['count'] as String;
    images = json['images'] == null ? "" : json['images'] as String;
    if (json['productOutputs'] != null) {
      productOutputs = <ProductOutputs>[];
      json['productOutputs'].forEach((v) {
        productOutputs!.add(new ProductOutputs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reasone'] = this.reasone;
    data['count'] = this.count;
    data['images'] = this.images;
    if (this.productOutputs != null) {
      data['productOutputs'] =
          this.productOutputs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductOutputs {
  String? productId;
  String? publishDate;
  String? photoOne;
  String? photoTwo;
  String? thotThree;
  String? lat;
  String? long;
  String? decription;
  String? title;
  String? category;
  String? subCategory;
  String? superSubCategory;
  String? phoneNo;
  String? alternateNo;
  String? isActive;
  String? strick;
  String? report;
  String? userid;
  String? email;
  String? id;

  ProductOutputs(
      {this.productId,
        this.publishDate,
        this.photoOne,
        this.photoTwo,
        this.thotThree,
        this.lat,
        this.long,
        this.decription,
        this.title,
        this.category,
        this.subCategory,
        this.superSubCategory,
        this.phoneNo,
        this.alternateNo,
        this.isActive,
        this.strick,
        this.report,
        this.userid,
        this.email,
        this.id});

  ProductOutputs.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'] == null ? "" : json['product_id'] as String;
    publishDate = json['publish_date'] == null ? "" : json['publish_date'] as String;
    photoOne = json['photo_one'] == null ? "" : json['photo_one'] as String;
    photoTwo = json['photo_two'] == null ? "" : json['photo_two'] as String;
    thotThree = json['thot_three'] == null ? "" : json['thot_three'] as String;
    lat = json['lat'] == null ? "" : json['lat'] as String;
    long = json['long_'] == null ? "" : json['long_'] as String;
    decription = json['decription'] == null ? "" : json['decription'] as String;
    title = json['title'] == null ? "" : json['title'] as String;
    category = json['category'] == null ? "" : json['category'] as String;
    subCategory = json['sub_category'] == null ? "" : json['sub_category'] as String;
    superSubCategory = json['super_sub_category'] == null ? "" : json['super_sub_category'] as String;
    phoneNo = json['phone_no'] == null ? "" : json['phone_no'] as String;
    alternateNo = json['alternate_no'] == null ? "" : json['alternate_no'] as String;
    isActive = json['is_active'] == null ? "" : json['is_active'] as String;
    strick = json['strick'] == null ? "" : json['strick'] as String;
    report = json['report'] == null ? "" : json['report'] as String;
    userid = json['userid'] == null ? "" : json['userid'] as String;
    email = json['email'] == null ? "" : json['email'] as String;
    id = json['id'] == null ? "" : json['id'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['publish_date'] = this.publishDate;
    data['photo_one'] = this.photoOne;
    data['photo_two'] = this.photoTwo;
    data['thot_three'] = this.thotThree;
    data['lat'] = this.lat;
    data['long_'] = this.long;
    data['decription'] = this.decription;
    data['title'] = this.title;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['super_sub_category'] = this.superSubCategory;
    data['phone_no'] = this.phoneNo;
    data['alternate_no'] = this.alternateNo;
    data['is_active'] = this.isActive;
    data['strick'] = this.strick;
    data['report'] = this.report;
    data['userid'] = this.userid;
    data['email'] = this.email;
    data['id'] = this.id;
    return data;
  }
}
