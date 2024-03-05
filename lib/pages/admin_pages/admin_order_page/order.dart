
import 'package:cloud_firestore/cloud_firestore.dart';

class Orrder{
  String id;
  final String clientName;
  final String clientPhone;
  final String carBrand;
  final String carModel;
  final String carYear;
  final String carStateNumber;
  final String commentToOrder;
  final Timestamp date;
  final bool checkFlag;
  final String username;
  final Timestamp dateOfService;
  final String nameOfGarage;
  final String nameOfMechanic;
  final String nameOfService;
  final int priceOfService;

  Orrder({
    this.id = '',
    required this.clientName,
    required this.clientPhone,
    required this.carBrand,
    required this.carModel,
    required this.carYear,
    required this.carStateNumber,
    required this.commentToOrder,
    required this.date,
    required this.checkFlag,
    required this.username,
    required this.dateOfService,
    required this.nameOfGarage,
    required this.nameOfMechanic,
    required this.nameOfService,
    required this.priceOfService,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'carBrand': carBrand,
    'carModel': carModel,
    'carStateNumber': carStateNumber,
    'carYear': carYear,
    'clientName': clientName,
    'clientPhone': clientPhone,
    'commentToOrder': commentToOrder,
    'date': date,
    'checkFlag': checkFlag,
    'username': username,
    'dateOfService': dateOfService,
    'nameOfGarage': nameOfGarage,
    'nameOfService': nameOfService,
    'nameOfMechanic': nameOfMechanic,
    'priceOfService': priceOfService,
  };

  static Orrder fromJson(Map<String, dynamic> json) => Orrder(
    id: json['id'],
    clientName: json['clientName'],
    clientPhone: json['clientPhone'], 
    carBrand: json['carBrand'], 
    carModel: json['carModel'], 
    carYear: json['carYear'], 
    carStateNumber: json['carStateNumber'], 
    commentToOrder: json['commentToOrder'], 
    date: json['date'],
    checkFlag: json['checkFlag'],
    username: json['username'],
    dateOfService: json['dateOfService'],
    nameOfGarage: json['nameOfGarage'],
    nameOfService: json['nameOfService'],
    nameOfMechanic: json['nameOfMechanic'],
    priceOfService: json['priceOfService'],
  );
}