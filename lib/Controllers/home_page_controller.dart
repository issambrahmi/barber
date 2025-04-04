import 'package:barber_app/Model/reservation_model.dart';
import 'package:barber_app/Services/data_base.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePageController extends GetxController {
  RxList days = <String>[].obs;
  RxList<ReservationModel> reservations = <ReservationModel>[].obs;

  DateTime? selectedDate;
  RxBool isMorning = true.obs;
  RxBool isFullDateShow = false.obs;
  RxBool isLongPress = false.obs;
  int indexShowMoreInfo = -1;
  DateTime helperDate = DateTime.now();
  List<int> printedDates = [];

  @override
  void onInit() async {
    selectedDate = DateTime.now();
    initDays();
    getReservations();
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
      reservations[service.reservationId].services.add(service);
    }

   // update(['reservations']);

    print(reservations.length);
  }
}
