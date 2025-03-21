import 'package:barber_app/Services/data_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddNewReservationController extends GetxController {
  late TextEditingController clientName;
  late TextEditingController phoneNumber;
  late TextEditingController comment;
  DateTime? date;
  TimeOfDay? time;
  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    clientName = TextEditingController();
    phoneNumber = TextEditingController();
    comment = TextEditingController();

    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onClose() {
    clientName.dispose();
    phoneNumber.dispose();
    comment.dispose();
    super.onClose();
  }

  bool compareDates(DateTime selectedDate) {
    if (date == null) {
      return false;
    }
    return date!.year == selectedDate.year &&
        date!.month == selectedDate.month &&
        date!.day == selectedDate.day;
  }

  String timeFormat() {
    if (time != null) {
      return DateFormat('hh:mm')
          .format(DateTime(0, 0, 0, time!.hour, time!.minute));
    } else {
      return 'Select Time';
    }
  }

  void addnewReservation() async {
    if (formKey.currentState!.validate()) {
      String fromattedDate =
          DateTime(date!.year, date!.month, date!.day, time!.hour, time!.minute)
              .toIso8601String()
              .replaceFirst('T', ' ')
              .substring(0, 19);
      AppDataBase db = AppDataBase();
      bool result = await db.insert(
          '''INSERT INTO Reservations (client_name , phone_number , comment , date) 
               VALUES ('${clientName.text.trim()}' , '${phoneNumber.text.trim()}' ,
                       '${comment.text.trim()}' , '$fromattedDate' );
      ''');
      if (result) {
        print('added succesfully');
      }
    }
  }
}
