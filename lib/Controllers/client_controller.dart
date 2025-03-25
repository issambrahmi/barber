import 'package:barber_app/Model/client_model.dart';
import 'package:barber_app/Services/data_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  RxList clients = <ClientModel>[].obs;
  late TextEditingController clientName;
  late TextEditingController phoneNumber;

  @override
  void onInit() {
    clientName = TextEditingController();
    phoneNumber = TextEditingController();
    getAllClients();
    super.onInit();
  }

  @override
  void onClose() {
    clientName.dispose();
    phoneNumber.dispose();
    super.onClose();
  }

  void clearFields() {
    clientName.clear();
    phoneNumber.clear();
  }

  void getAllClients() async {
    AppDataBase db = AppDataBase();
    try {
      List<Map<String, dynamic>> data = await db.read('SELECT * FROM Clients;');
      clients.assignAll(data.map((c) => ClientModel.fromMap(c)).toList());
    } catch (e) {
      debugPrint('=======$e');
    }
  }

  void addNewClient() async {
    AppDataBase db = AppDataBase();
    try {
      bool data =
          await db.insert('''INSERT INTO Clients (name , phone_number) VALUES
           ('${clientName.text.trim()}', '${phoneNumber.text.trim()}' );
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
          .edit('''UPDATE Clients SET name = '${clientName.text.trim()}' , 
                             phone_number = '${phoneNumber.text.trim()}'
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
      bool data = await db.delete('DELETE FROM Clients WHERE id = $id; ');
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
