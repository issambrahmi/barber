import 'package:barber_app/Controllers/Home_page_controller.dart';
import 'package:barber_app/Model/reservation_model.dart';
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
  late bool isAddPage;

  @override
  void onInit() {
    Get.arguments['res'] != null ? isAddPage = false : isAddPage = true;

    clientName = TextEditingController();
    phoneNumber = TextEditingController();
    comment = TextEditingController();
    formKey = GlobalKey<FormState>();

    if (!isAddPage) {
      ReservationModel res = Get.arguments['res'];
      clientName.text = res.name;
      phoneNumber.text = res.phoneNumber.toString();
      comment.text = res.comment.toString();
      date = res.date;
      time = TimeOfDay(hour: res.date.hour, minute: res.date.minute);
    }
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
      try {
        String fromattedDate = DateTime(
                date!.year, date!.month, date!.day, time!.hour, time!.minute)
            .toIso8601String()
            .replaceFirst('T', ' ')
            .substring(0, 19);

        AppDataBase db = AppDataBase();
        bool result = await db.insert(
            '''INSERT INTO Reservations (client_name, phone_number , comment , date) 
               VALUES ('${clientName.text.trim()}' , '${phoneNumber.text.trim()}' ,
                       '${comment.text.trim()}' , '$fromattedDate' );
            ''');
        if (result) {
          debugPrint('added succesfully');
          Get.find<HomePageController>().getReservations();
          Get.back();
        }
      } catch (e) {
        debugPrint('======$e');
      }
    }
  }

  void editReservation() async {
    if (formKey.currentState!.validate()) {
      try {
        String fromattedDate = DateTime(
                date!.year, date!.month, date!.day, time!.hour, time!.minute)
            .toIso8601String()
            .replaceFirst('T', ' ')
            .substring(0, 19);

        AppDataBase db = AppDataBase();
        bool result = await db.insert(
            '''UPDATE Reservations SET client_name = '${clientName.text.trim()}' , 
               phone_number = '${phoneNumber.text.trim()}' ,
               comment = '${comment.text.trim()}' , 
               date = '$fromattedDate' ;
            ''');
        if (result) {
          debugPrint('added succesfully');
          // int index =  Get.find<HomePageController>().reservations.indexWhere((r)=>r.id == Get.arguments['res'].id);

          //  Get.find<HomePageController>().reservations[index] = re)
          Get.find<HomePageController>().getReservations();
          Get.back();
        }
      } catch (e) {
        debugPrint('======$e');
      }
    }
  }
}
