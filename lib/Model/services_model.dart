class ServicesModel {
  int id;
  String name;
  double price;

  ServicesModel({
    required this.id,
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory ServicesModel.fromMap(Map<String, dynamic> map) {
    return ServicesModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
    );
  }
}
