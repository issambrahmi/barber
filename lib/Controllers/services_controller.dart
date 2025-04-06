import 'package:barber_app/Model/services_model.dart';
import 'package:barber_app/Services/data_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesController extends GetxController {
  RxList<ServicesModel> services = <ServicesModel>[].obs;
  late TextEditingController serviceName;
  late TextEditingController price;

  @override
  void onInit() {
    serviceName = TextEditingController();
    price = TextEditingController();
    getAllClients();
    super.onInit();
  }

  @override
  void onClose() {
    serviceName.dispose();
    price.dispose();
    super.onClose();
  }

  void clearFields() {
    serviceName.clear();
    price.clear();
  }

  void getAllClients() async {
    AppDataBase db = AppDataBase();
    try {
      List<Map<String, dynamic>> data =
          await db.read('SELECT * FROM Services;');
      services.assignAll(data.map((s) => ServicesModel.fromMap(s)).toList());
    } catch (e) {
      debugPrint('=======$e');
    }
  }

  void addNewClient() async {
    AppDataBase db = AppDataBase();
    try {
      bool data = await db.insert('''INSERT INTO Services (name , price) VALUES
           ('${serviceName.text.trim()}', '${double.parse(price.text.trim())}' );
           ''');
      if (data) {
        getAllClients();
        clearFields();
        Get.back();
      }
    } catch (e) {
      debugPrint('=======$e');
    }
  }

  void editClient(int id) async {
    AppDataBase db = AppDataBase();
    try {
      bool data = await db
          .edit('''UPDATE Services SET name = '${serviceName.text.trim()}' , 
                             price = '${double.parse(price.text.trim())}'
                            WHERE id = $id;
                          ''');
      if (data) {
        getAllClients();
        clearFields();
        Get.back();
      }
    } catch (e) {
      debugPrint('=======$e');
    }
  }

  void deleteClient(int id) async {
    AppDataBase db = AppDataBase();
    try {
      bool data = await db.delete('DELETE FROM Services WHERE id = $id; ');
      if (data) {
        getAllClients();
        clearFields();
        Get.back();
      }
    } catch (e) {
      debugPrint('=======$e');
    }
  }
}
