
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RepairPageController extends GetxController{
  final repairPageKey = GlobalKey<FormState>();
  final nameOfClientController = TextEditingController();
  final phoneNumberOfClientController = TextEditingController();
  final yearOfCarController = TextEditingController();
  final stateNumberOfCarController = TextEditingController();
  final commentOfOrderController = TextEditingController();
  String selectedModel = "Camry";
  
  String selectedBrand = "Toyota";
  
  List<DropdownMenuItem<String>> get dropdownBrands{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Toyota", child: Text("Toyota")),
      const DropdownMenuItem(value: "Lexus", child: Text("Lexus")),
      const DropdownMenuItem(value: "Daihatsu", child: Text("Daihatsu")),
    ];
    return menuItems; 
  }


  List<DropdownMenuItem<String>> get dropdownModels{
    if (selectedBrand == "Toyota"){
      //selectedModel = "Camry";
      List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Camry", child: Text("Camry")),
      const DropdownMenuItem(value: "Corolla", child: Text("Corolla")),
      const DropdownMenuItem(value: "Crown", child: Text("Crown")),
      const DropdownMenuItem(value: "MarkII", child: Text("MarkII")),
      const DropdownMenuItem(value: "Aygo", child: Text("Aygo")),
      const DropdownMenuItem(value: "Avensis", child: Text("Avensis")),
    ];
    return menuItems;
    }
    else if (selectedBrand == "Lexus"){
      //selectedModel = "LX 570";

      List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Camry", child: Text("LX 570")),
      const DropdownMenuItem(value: "ES 300", child: Text("ES 300")),
      const DropdownMenuItem(value: "LS 500", child: Text("LS 500")),
    ];
    return menuItems;
    }
    else {
      //selectedModel = "Mira";
      List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Camry", child: Text("Mira")),
      const DropdownMenuItem(value: "Tanto", child: Text("Tanto")),
      const DropdownMenuItem(value: "March", child: Text("March")),
    ];
    return menuItems;
    }
  }

  Future confirm() async{
    final isValid = repairPageKey.currentState!.validate();
    if (!isValid) return;

    
      createOrder();
      Navigator.pop(repairPageKey.currentContext!);
      // Navigator.push(
      //   repairPageKey.currentContext!,
      //   MaterialPageRoute(builder: (context) => const HomePage()),
      // );
  }

  Future createOrder() async{
    final docOrder = FirebaseFirestore.instance.collection('orders').doc();
    final user = FirebaseAuth.instance.currentUser!;
    if (selectedBrand == "Lexus" && selectedModel == "Camry"){
      selectedModel = "LX 570";
    }
    if (selectedBrand == "Daihatsu" && selectedModel == "Camry"){
      selectedModel = "Mira";
    }
    final json = {
      'username': user.email,
      'clientName': nameOfClientController.text,
      'clientPhone': '+7${phoneNumberOfClientController.text}',
      'carBrand': selectedBrand,
      'carModel': selectedModel,
      'carStateNumber': stateNumberOfCarController.text,
      'carYear': yearOfCarController.text,
      'commentToOrder': commentOfOrderController.text,
      'date': DateTime.now(),
      'checkFlag': false,
      'dateOfService': DateTime(2007,11,10, 0, 0, 0),
      'nameOfGarage': '',
      'nameOfMechanic': '',
      'nameOfService': '',
      'priceOfService': 0,
    };

    await docOrder.set(json);
  }

  void showSnackBar(BuildContext context){
    String snackBarText;
    Color color;
    final isValid = repairPageKey.currentState!.validate();
    if (!isValid) {snackBarText = 'Заполните поля корректными данными!';  color = Colors.red;}
    else {snackBarText = 'Заявка отправлена!';  color = Colors.green;}
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(snackBarText),
        duration: const Duration(seconds: 2),
        backgroundColor: color,
      )
    );
  }
}