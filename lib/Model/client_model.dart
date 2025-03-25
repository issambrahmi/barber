class ClientModel {
  int id;
  String name;
  String? phoneNumber;

  ClientModel({
    required this.id,
    required this.name,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'],
      name: map['name'],
      phoneNumber: map['phone_number'],
    );
  }
}
