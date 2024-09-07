
class Service {
  Service({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.createdAt,
    this.updatedAt,

  });

  Service.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

  }
  String? id;
  String? name;
  String? description;
  int? price;
  String? image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  static List<Service> fromJsonListModel(List json) =>
      json.map((element) => Service.fromJson(element)).toList();

  @override
  String toString() {
    return 'Service{id: $id, name: $name, description: $description, price: $price, image: $image, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
