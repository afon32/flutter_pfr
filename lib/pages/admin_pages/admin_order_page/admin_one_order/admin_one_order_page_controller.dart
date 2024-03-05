
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fp/pages/admin_pages/admin_order_page/admin_one_order_page_registration/admin_one_order_page_registration_page.dart';
import 'package:fp/pages/admin_pages/admin_order_page/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminOneOrderPageController extends GetxController{
  final adminOneOrderPageKey = GlobalKey<FormState>();
  Orrder mainOrder = Orrder(priceOfService: 1, clientName: 'clientName', clientPhone: 'clientPhone', carBrand: 'carBrand', carModel: 'carModel', carYear: '1', carStateNumber: 'carStateNumber', commentToOrder: 'commentToOrder', date: Timestamp.now(), checkFlag: false, username: 'username', dateOfService: Timestamp.fromDate(DateTime.now()), nameOfGarage: 'garage', nameOfMechanic: 'nameOfMechanic', nameOfService: 'nameOfService');
  

  void loadData(BuildContext context){
    final Map<String, dynamic> jsonData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Orrder order = Orrder.fromJson(jsonData);
    mainOrder = order;
  }

  void nextPage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdminOneOrderPageRegistration(),
      settings: RouteSettings(
          arguments: mainOrder.toJson(),),)
    );
  }

  void addMechanic() async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String collectionName = 'mechanics';
    CollectionReference collectionReference = firestore.collection(collectionName);

    // Создание документа с полем busyness
    Map<String, dynamic> data = {
      'mechanicName': 'Дмитрий',
      'mechanicSurname': 'Лентицкий',
      'mechanicSpecialization': 'Стажёр',
      'mechanicHourSalary': 300,
      'mechanicBusyness': List.generate(70, (index) => true), // Создание массива из 70 true
    };

    try {
      // Добавление документа в коллекцию
      await collectionReference.add(data);
      print('Коллекция и документ успешно созданы в Firestore.');
    } catch (e) {
      print('Ошибка при создании коллекции и документа в Firestore: $e');
    }
  }

    void addGarage() async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String collectionName = 'garages';
    CollectionReference collectionReference = firestore.collection(collectionName);

    // Создание документа с полем busyness
    Map<String, dynamic> data = {
      'garageName': 'Ремонтный бокс №2',
      'garageCapacity': 2,
      'garageLiftJack': true,
      'garageBusyness': List.generate(70, (index) => true), // Создание массива из 70 true
    };

    try {
      // Добавление документа в коллекцию
      await collectionReference.add(data);
      print('Коллекция и документ успешно созданы в Firestore.');
    } catch (e) {
      print('Ошибка при создании коллекции и документа в Firestore: $e');
    }
  }
}