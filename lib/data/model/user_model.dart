class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;

  String? address;
  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.uId,
      required this.address});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];

    address = json['address'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'address': address,
    };
  }
}
