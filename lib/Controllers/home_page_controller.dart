import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePageController extends GetxController {
  RxList days = <String>[].obs;
  DateTime? selectedDate;
  RxBool isMorning = true.obs;
  RxBool isFullDateShow = false.obs;

  @override
  void onInit() {
    selectedDate = DateTime.now();
    days.value = initDays();
    super.onInit();
  }

  void changeTime({required bool isMorningTap}) {
    if ((isMorningTap && !isMorning.value) ||
        (!isMorningTap && isMorning.value)) {
      isMorning.value = !isMorning.value;
    }
  }

  List<String> initDays() {
    DateTime firstDayofMounth =
        DateTime(selectedDate!.year, selectedDate!.month, 1);
    DateTime firstDayOfNextMounth =
        DateTime(selectedDate!.year, selectedDate!.month + 1, 1);
    DateTime lastDayOfMounth =
        firstDayOfNextMounth.subtract(const Duration(days: 1));

    List<String> days = [];
    for (int i = 0; i < lastDayOfMounth.day; i++) {
      DateTime currentDay = firstDayofMounth.add(Duration(days: i));
      days.add(DateFormat('EEEE').format(currentDay));
    }
    print(days.length);
    return days;
  }
}
