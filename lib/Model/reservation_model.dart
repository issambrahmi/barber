class ReservationModel {
  final int id;
  final String name;
  final String? phoneNumber;
  final String comment;
  String state;
  final DateTime date;
  final int? clientId;
  final double totalPrice;
  final List<ReservationServiceModel> services;

  ReservationModel({
    required this.id,
    required this.name,
    this.phoneNumber,
    required this.comment,
    required this.state,
    required this.date,
    this.clientId,
    required this.totalPrice,
    required this.services,
  });
  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    DateTime formattedDate =
        DateTime.parse(map['date'].toString().replaceFirst(' ', 'T'));
    ///////////////////////
    return ReservationModel(
      id: map['id'],
      name: map['client_name'],
      phoneNumber: map['phone_number'],
      comment: map['comment'],
      state: map['state'],
      date: formattedDate,
      clientId: map['client_id'],
      totalPrice: map['totale_price'],
      services: [],
    );
  }
}

class ReservationServiceModel {
  final int id;
  final String serviceName;
  final int reservationId;

  ReservationServiceModel({
    required this.id,
    required this.serviceName,
    required this.reservationId,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'service_name' : serviceName,
  //     'reser'
  //   };
  // }

  factory ReservationServiceModel.fromMap(Map<String, dynamic> map) {
    return ReservationServiceModel(
      id: map['id'],
      serviceName: map['service_name'],
      reservationId: map['reservation_id'],
    );
  }
}
