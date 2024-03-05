
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fp/pages/admin_pages/admin_order_page/admin_one_order_page_registration/admin_one_order_page_registration_page.dart';
import 'package:fp/pages/admin_pages/admin_order_page/admin_one_order_page_registration/garage.dart';
import 'package:fp/pages/admin_pages/admin_order_page/admin_one_order_page_registration/mechanic.dart';
import 'package:fp/pages/admin_pages/admin_order_page/admin_one_order_page_registration/service.dart';
import 'package:fp/pages/admin_pages/admin_order_page/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PastOneOrderPageController extends GetxController{
  final pastOneOrderPageKey = GlobalKey<FormState>();
  Orrder mainOrder = Orrder( priceOfService: 1,clientName: 'clientName', clientPhone: 'clientPhone', carBrand: 'carBrand', carModel: 'carModel', carYear: '1', carStateNumber: 'carStateNumber', commentToOrder: 'commentToOrder', date: Timestamp.now(), checkFlag: false, username: 'username', dateOfService: Timestamp.fromDate(DateTime.now()), nameOfGarage: 'garage', nameOfMechanic: 'nameOfMechanic', nameOfService: 'nameOfService');
  String mechanicName = '';
  String garageName = '';
  String serviceName = '';

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










     Stream<List<Garage>> readGarages() =>
   FirebaseFirestore.instance
    .collection('garages')
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data();
          data['id'] = doc.id; // Добавляем поле id в данные
          return Garage.fromJson(data);
        }).toList());
  
  Stream<List<Mechanic>> readMechanics() =>
   FirebaseFirestore.instance
    .collection('mechanics')
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data();
          data['id'] = doc.id; // Добавляем поле id в данные
          return Mechanic.fromJson(data);
        }).toList());

  Stream<List<Service>> readServices() =>
   FirebaseFirestore.instance
    .collection('services')
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data();
          data['id'] = doc.id; // Добавляем поле id в данные
          return Service.fromJson(data);
        }).toList());

  Future<void> readMechanicName() async {
    readMechanics().listen((List<Mechanic> mechanics) {
    // Взять первый элемент из списка
    if (mechanics.isNotEmpty) {
      //print('not emte');
      for (Mechanic mechanic in mechanics){
        if (mechanic.id == mainOrder.nameOfMechanic){
          mechanicName = '${mechanic.mechanicSurname} ${mechanic.mechanicName}';
        }
      }
    }
    }, onError: (error) {
    print('Error: $error');
    }, onDone: () {
    print('Stream closed');
    },
    );
  }

    Future<void> readGarageName() async {
    readGarages().listen((List<Garage> garages) {
    // Взять первый элемент из списка
    if (garages.isNotEmpty) {
      //print('not emte');
      for (Garage garage in garages){
        if (garage.id == mainOrder.nameOfGarage){
          print('garage = garage');
          garageName = garage.garageName;
        }
      }
    }
    }, onError: (error) {
    print('Error: $error');
    }, onDone: () {
    print('Stream closed');
    },
    );
  }

    Future<void> readServiceName() async {
    readServices().listen((List<Service> services) {
    // Взять первый элемент из списка
    if (services.isNotEmpty) {
      //print('not emte');
      for (Service service in services){
        if (service.id == mainOrder.nameOfService){
          serviceName = service.serviceName;
        }
      }
    }
    }, onError: (error) {
    print('Error: $error');
    }, onDone: () {
    print('Stream closed');
    },
    );
  }
        

}