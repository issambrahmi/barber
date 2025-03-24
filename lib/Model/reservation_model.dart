import 'package:intl/intl.dart';

class ReservationModel {
  final int id;
  final String name;
  final String? phoneNumber;
  final String comment;
  final String state;
  final DateTime date;
  final int? clientId;

  ReservationModel(
      {required this.id,
      required this.name,
      this.phoneNumber,
      required this.comment,
      required this.state,
      required this.date,
      this.clientId});
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
    );
  }
}
