class LoginModel {
  String? sId;
  String? name;
  String? email;
  String? password;
  bool? isAdmin;
  int? phone;
  String? address;
  List<dynamic>? cart;
  List<dynamic>? wishlist;
  int? iV;

  LoginModel({
    this.sId,
    this.name,
    this.email,
    this.password,
    this.isAdmin,
    this.phone,
    this.address,
    this.cart,
    this.wishlist,
    this.iV,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    isAdmin = json['isAdmin'];
    phone = json['phone'];
    address = json['address'];
    cart = json['cart'] != null ? List<dynamic>.from(json['cart']) : null;
    wishlist = json['wishlist'] != null ? List<dynamic>.from(json['wishlist']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['isAdmin'] = this.isAdmin;
    data['phone'] = this.phone;
    data['address'] = this.address;
    if (this.cart != null) {
      data['cart'] = this.cart;
    }
    if (this.wishlist != null) {
      data['wishlist'] = this.wishlist;
    }
    data['__v'] = this.iV;
    return data;
  }
}
