import 'package:barber_app/Model/reservation_model.dart';
import 'package:barber_app/Model/services_model.dart';
import 'package:barber_app/Services/data_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePageController extends GetxController {
  RxList days = <String>[].obs;
  RxList<ReservationModel> reservations = <ReservationModel>[].obs;
  RxList<ServicesModel> services = <ServicesModel>[].obs;

  DateTime? selectedDate;
  RxBool isMorning = true.obs;
  RxBool isFullDateShow = false.obs;
  RxBool isLongPress = false.obs;
  int indexShowMoreInfo = -1;
  DateTime helperDate = DateTime.now();
  List<int> printedDates = [];
  RxList<int> selectedServices = <int>[].obs;
  RxDouble totale = 0.0.obs;

  @override
  void onInit() async {
    selectedDate = DateTime.now();
    initDays();
    getReservations();
    getServices();
    super.onInit();
  }

  void changeTime({required bool isMorningTap}) {
    if ((isMorningTap && !isMorning.value) ||
        (!isMorningTap && isMorning.value)) {
      isMorning.value = !isMorning.value;
    }
  }

  void changeDateDay(int day) {
    selectedDate = DateTime(selectedDate!.year, selectedDate!.month, day);
    update(['home page date']);
  }

  initDays() {
    days.clear();
    DateTime firstDayofMounth =
        DateTime(selectedDate!.year, selectedDate!.month, 1);
    DateTime firstDayOfNextMounth =
        DateTime(selectedDate!.year, selectedDate!.month + 1, 1);
    DateTime lastDayOfMounth =
        firstDayOfNextMounth.subtract(const Duration(days: 1));

    for (int i = 0; i < lastDayOfMounth.day; i++) {
      DateTime currentDay = firstDayofMounth.add(Duration(days: i));
      days.add(DateFormat('EEEE').format(currentDay));
    }
  }

  void getReservations() async {
    AppDataBase db = AppDataBase();
    List<Map<String, dynamic>> list =
        await db.read('''SELECT * FROM Reservations 
        WHERE strftime('%Y-%m-%d' , date) = '${DateFormat('yyyy-MM-dd').format(selectedDate!)}' 
        ORDER BY strftime('%H:%M' , date) ASC;
     ''');

    reservations
        .assignAll(list.map((r) => ReservationModel.fromMap(r)).toList());
    for (ReservationModel r in reservations) {
      List<Map<String, dynamic>> listOfServices = await db
          .read('''SELECT Rs.id , Rs.reservation_id , s.name As service_name
        FROM ReservationServices Rs 
        JOIN Services s ON s.id = Rs.service_id 
        JOIN Reservations r ON r.id = Rs.reservation_id
        WHERE strftime('%Y-%m-%d' , r.date) = '${DateFormat('yyyy-MM-dd').format(selectedDate!)}' 
        ORDER BY strftime('%H:%M' , date) ASC
        ;
     ''');
      for (var s in listOfServices) {
        ReservationServiceModel service = ReservationServiceModel.fromMap(s);
        r.services.add(service);
      }
    }
  }

  void getServices() async {
    AppDataBase db = AppDataBase();
    List<Map<String, dynamic>> list = await db.read('SELECT * FROM Services;');
    services.assignAll(list.map((s) => ServicesModel.fromMap(s)).toList());
  }

  void deleteReservation(int id, int index) async {
    AppDataBase db = AppDataBase();
    bool isDeleted =
        await db.delete('''DELETE FROM Reservations WHERE id = '$id' ; ''');
    if (isDeleted) {
      reservations.removeAt(index);
    }
  }

  void validateReservation(int index) async {
    AppDataBase db = AppDataBase();
    try {
      bool data = await db.edit(
          '''UPDATE Reservations SET state = 'finish' , totale_price = '$totale' WHERE id = '${reservations[index].id}'; ''');
      // ignore: avoid_function_literals_in_foreach_calls
      selectedServices.forEach((s) async => await db.insert(
          ''' INSERT INTO ReservationServices (service_id , reservation_id)
              VALUES ('$s','${reservations[index].id}'); '''));
      if (data) {
        reservations[index].state = 'finish';
        selectedServices.value = [];
        totale.value = 0;

        reservations.elementAt(index).state = 'finish';
        getReservations();

         //update(['reservations']);
        Get.back();
      }
    } catch (e) {
      debugPrint('=======$e');
    }
  }
}
