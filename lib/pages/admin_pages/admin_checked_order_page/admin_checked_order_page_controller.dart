import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fp/pages/admin_pages/admin_checked_order_page/admin_one_checked_order_page/admin_one_checked_order_page_page.dart';
import 'package:fp/pages/admin_pages/admin_order_page/order.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AdminCheckedOrderPageController extends GetxController{
  final adminCheckedOrderPageKey = GlobalKey<FormState>();
  final fontSize = 20.0;

  Stream<List<Orrder>> readOrders() =>
    FirebaseFirestore.instance
    .collection('orders')
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data();
          data['id'] = doc.id; // Добавляем поле id в данные
          return Orrder.fromJson(data);
        }).toList());

    Widget buildOrder(Orrder order) {
    if(order.checkFlag && order.dateOfService.toDate().isAfter(DateTime.now())){
    return ListTile(
    title: Text('Автомобиль: ${order.carBrand} ${order.carModel}    ${order.carStateNumber}'),
    subtitle: Text('Дата ремонта: ' + DateFormat('dd.MM.yy  hh:mm').format(order.dateOfService.toDate())),
  );}
  else{
    return const SizedBox(height: 0.0,);
  }
  }

    void onTapOnOrder(Orrder order){
    //print(order.username);
    Navigator.pushReplacement(
      adminCheckedOrderPageKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => const AdminOneCheckedOrderPage(),
        settings: RouteSettings(
          arguments: order.toJson(),
        ),
      ),
    );
  }
}