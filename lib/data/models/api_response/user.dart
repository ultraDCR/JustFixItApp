
class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.dob,
    this.gender,
    this.avatar,

  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    dob = json['dob'];
    gender = json['gender'];
    avatar = json['avatar'];

  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? dob;
  String? gender;
  String? avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['address'] = address;
    map['dob'] = dob;
    map['gender'] = gender;
    map['avatar'] = avatar;
    return map;
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phone: $phone, address: $address, dob: $dob, gender: $gender, avatar: $avatar}';
  }
}
class Collaboration {
  Collaboration({

    this.image,

  });

  Collaboration.fromJson(dynamic json) {

    image = json['image'];
   
  }
  String? image;
  

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['image'] = image;
   

    return map;
  }

  @override
  String toString() {
    return 'Collaboration{ image: $image, }';
  }
}
