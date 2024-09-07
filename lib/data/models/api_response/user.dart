
class User {
  User({
    this.id,
    this.fullname,
    this.email,
    this.address,
    this.userType,
    this.registrationDate,

  });

  User.fromJson(dynamic json) {
    id = json['_id'];
    fullname = json['fullname'];
    email = json['email'];
    address = json['address'];
    userType = json['user_type'];
    registrationDate = json['registrationdate'];

  }
  String? id;
  String? fullname;
  String? email;
  String? address;
  String? userType;
  String? registrationDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['fullname'] = fullname;
    map['email'] = email;
    map['address'] = address;
    map['user_type'] = userType;
    map['registrationdate'] = registrationDate;
    return map;
  }

  @override
  String toString() {
    return 'User{id: $id, fullname: $fullname, email: $email, address: $address, userType: $userType, registrationDate: $registrationDate}';
  }
}
