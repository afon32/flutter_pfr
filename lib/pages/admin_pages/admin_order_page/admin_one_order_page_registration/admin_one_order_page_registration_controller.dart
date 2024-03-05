import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fp/pages/admin_pages/admin_home_page/admin_home_page_page.dart';
import 'package:fp/pages/admin_pages/admin_order_page/admin_one_order_page_registration/garage.dart';
import 'package:fp/pages/admin_pages/admin_order_page/admin_one_order_page_registration/mechanic.dart';
import 'package:fp/pages/admin_pages/admin_order_page/admin_one_order_page_registration/service.dart';
import 'package:fp/pages/admin_pages/admin_order_page/order.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AdminOneOrderPageRegistrationController extends GetxController {
  int priceOfService = 0;
  int totalPrice = 0;
  int salaryOfMechanic = 0;
  double totalRate = 1.0;

  final adminOneOrderPageRegistrationKey = GlobalKey<FormState>();
  Orrder mainOrder = Orrder(
      priceOfService: 1,
      clientName: 'clientName',
      clientPhone: 'clientPhone',
      carBrand: 'carBrand',
      carModel: 'carModel',
      carYear: '1',
      carStateNumber: 'carStateNumber',
      commentToOrder: 'commentToOrder',
      date: Timestamp.now(),
      checkFlag: false,
      username: 'username',
      dateOfService: Timestamp.fromDate(DateTime.now()),
      nameOfGarage: 'garage',
      nameOfMechanic: 'nameOfMechanic',
      nameOfService: 'nameOfService');
  String orderId = '';
  DateTime orderDate = DateTime(2007, 11, 10);
  int serviceDuration = 1;
  List<DropdownMenuItem<String>> menuItemsOfGarages = [
    const DropdownMenuItem(
      value: '7Wxnt9FuCgwjQFEqd0sk',
      child: Text('Ремонтный бокс №2'),
    ),
  ];

  List<DropdownMenuItem<String>> menuItemsOfMechanics = [
    const DropdownMenuItem(
      value: '5cPCTPK2LWBWzmQio6N7',
      child: Text('Лентицкий'),
    ),
  ];

  List<DropdownMenuItem<String>> menuItemsOfServices = [
    const DropdownMenuItem(
      value: 'CvjW76lBs8ySXkeCtak9',
      child: Text('Диагностика'),
    ),
  ];

  String selectedService = 'CvjW76lBs8ySXkeCtak9';
  String selectedServiceName = '';
  String selectedGarage = '7Wxnt9FuCgwjQFEqd0sk';
  String selectedGarageName = '';
  String selectedMechanic = '5cPCTPK2LWBWzmQio6N7';
  String selectedMechanicName = '';
  DateTime selectedDate = DateTime(2007, 11, 10);

  List<dynamic> newDaysOfWorkGarage = [];
  List<dynamic> newDaysOfWorkMechanic = [];
  List<dynamic> garagesDaysOfWork = [];
  List<TimeRegion> cancelDays = [];
  bool isDataAddedGarages = false;
  bool isDataAddedMechanics = false;

  List<DropdownMenuItem<String>> get dropdownGarages {
    readGarages().listen((List<Garage> garages) {
      menuItemsOfGarages.clear();
      if (garages.isNotEmpty) {
        for (Garage garage in garages) {
          if (!menuItemsOfGarages.any((item) => item.value == garage.id)) {
            menuItemsOfGarages.add(
              DropdownMenuItem(
                value: garage
                    .id, // Замените на соответствующее поле, которое вы хотите использовать
                child: Text(garage
                    .garageName), // Замените на соответствующее поле, которое вы хотите отобразить
              ),
            );
          }
        }
      }
    });

    return menuItemsOfGarages;
  }

  List<DropdownMenuItem<String>> get dropdownMechanics {
    readMechanics().listen((List<Mechanic> mechanics) {
      menuItemsOfMechanics.clear();
      if (mechanics.isNotEmpty) {
        for (Mechanic mechanic in mechanics) {
          if (!menuItemsOfMechanics.any((item) => item.value == mechanic.id)) {
            menuItemsOfMechanics.add(
              DropdownMenuItem(
                value: mechanic
                    .id, // Замените на соответствующее поле, которое вы хотите использовать
                child: Text(mechanic
                    .mechanicSurname), // Замените на соответствующее поле, которое вы хотите отобразить
              ),
            );
          }
        }
      }
    });
    return menuItemsOfMechanics;
  }

  List<DropdownMenuItem<String>> get dropdownServices {
    readServices().listen((List<Service> services) {
      menuItemsOfServices.clear();
      if (services.isNotEmpty) {
        for (Service service in services) {
          if (!menuItemsOfServices.any((item) => item.value == service.id)) {
            menuItemsOfServices.add(
              DropdownMenuItem(
                value: service
                    .id, // Замените на соответствующее поле, которое вы хотите использовать
                child: Text(service
                    .serviceName), // Замените на соответствующее поле, которое вы хотите отобразить
              ),
            );
          }
        }
      }
    });

    return menuItemsOfServices;
  }

  Stream<List<Garage>> readGarages() => FirebaseFirestore.instance
      .collection('garages')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            Map<String, dynamic> data = doc.data();
            data['id'] = doc.id; // Добавляем поле id в данные
            return Garage.fromJson(data);
          }).toList());

  Stream<List<Mechanic>> readMechanics() => FirebaseFirestore.instance
      .collection('mechanics')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            Map<String, dynamic> data = doc.data();
            data['id'] = doc.id; // Добавляем поле id в данные
            return Mechanic.fromJson(data);
          }).toList());

  Stream<List<Service>> readServices() => FirebaseFirestore.instance
      .collection('services')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            Map<String, dynamic> data = doc.data();
            data['id'] = doc.id; // Добавляем поле id в данные
            return Service.fromJson(data);
          }).toList());

  Future<List<TimeRegion>> setBusynessTime() async {
    cancelDays.clear();

    readServices().listen((List<Service> services) {
      if (services.isNotEmpty) {
        for (Service service in services) {
          if (service.id == selectedService) {
            priceOfService = service.priceOfService;
          }
        }
      }
    });

    readGarages().listen(
      (List<Garage> garages) {
        // Взять первый элемент из списка
        if (garages.isNotEmpty) {
          //print('not emte');
          for (Garage garage in garages) {
            if (garage.id == selectedGarage) {
              for (Timestamp time in garage.daysOfWork) {
                DateTime datetime = time.toDate();
                if (datetime
                        .add(const Duration(hours: 1))
                        .isBefore(DateTime.now()) ||
                    datetime == mainOrder.dateOfService.toDate()) {
                  updateGarageDaysOfWork(garage, time);
                }

                cancelDays.add(getSpecialRegions(datetime,
                    datetime.add(const Duration(hours: 1)), Colors.red));
              }
            }
          }
        }
      },
      onError: (error) {
        print('Error: $error');
      },
      onDone: () {
        print('Stream closed');
      },
    );

    readMechanics().listen(
      (List<Mechanic> mechanics) {
        // Взять первый элемент из списка
        if (mechanics.isNotEmpty) {
          //print('not emte');
          for (Mechanic mechanic in mechanics) {
            if (mechanic.id == selectedMechanic) {
              salaryOfMechanic = mechanic.mechanicHourSalary;
              for (Timestamp time in mechanic.mechanicDaysOfWork) {
                DateTime datetime = time.toDate();
                if (datetime
                        .add(const Duration(hours: 1))
                        .isBefore(DateTime.now()) ||
                    datetime == mainOrder.dateOfService.toDate()) {
                  updateMechanicDaysOfWork(mechanic, time);
                }

                cancelDays.add(getSpecialRegions(datetime,
                    datetime.add(const Duration(hours: 1)), Colors.red));
              }
            }
          }
        }
      },
      onError: (error) {
        print('Error: $error');
      },
      onDone: () {
        print('Stream closed');
      },
    );

    for (TimeRegion time in cancelDays) {
      print(time.startTime);
    }
    await blabla();
    return cancelDays;
  }

  TimeRegion getSpecialRegions(DateTime start, DateTime end, Color color) {
    return TimeRegion(
      startTime: start,
      endTime: end,
      enablePointerInteraction: false, // Отключение взаимодействия с указателем
      color: color, // Цвет временной области
      text: 'Занято', // Опциональный текст
      textStyle: const TextStyle(
        color: Colors.white,
      ), // Стиль текста
    );
    // Добавьте другие временные области по необходимости
  }

  _DataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    // Добавьте свои события (назначения) по мере необходимости
    return _DataSource(appointments);
  }

  Future<void> updateGarageDaysOfWork(
      Garage garage, Timestamp timeToRemove) async {
    List<Timestamp> updatedDaysOfWork = List.from(garage.daysOfWork);
    updatedDaysOfWork.remove(timeToRemove);

    await FirebaseFirestore.instance
        .collection('garages')
        .doc(garage
            .id) // Замените documentId на фактический идентификатор документа
        .update({'daysOfWork': updatedDaysOfWork});
  }

  Future<void> updateMechanicDaysOfWork(
      Mechanic mechanic, Timestamp timeToRemove) async {
    List<Timestamp> updatedDaysOfWork = List.from(mechanic.mechanicDaysOfWork);
    for (int i = 0; i < serviceDuration; i++) {
      updatedDaysOfWork.remove(timeToRemove);
    }
    await FirebaseFirestore.instance
        .collection('mechanics')
        .doc(mechanic
            .id) // Замените documentId на фактический идентификатор документа
        .update({'mechanicDaysOfWork': updatedDaysOfWork});
  }

  String returnDate() {
    if (selectedDate == DateTime(2007, 11, 10)) {
      String sText = 'Выберите дату';
      return sText;
    } else {
      return DateFormat('dd.MM.yy  hh:mm').format(selectedDate);
    }
  }

  void showBeforeDateSnackbar(BuildContext context) {
    String snackbarText = 'Выберите корректную дату';
    Color color = Colors.red;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(snackbarText),
      duration: const Duration(seconds: 2),
      backgroundColor: color,
    ));
  }

  bool showSnackBar(BuildContext context) {
    String snackBarText;
    Color color;
    final isValid = adminOneOrderPageRegistrationKey.currentState!.validate();
    if (!isValid) {
      snackBarText = 'Заполните поля корректными данными!';
      color = Colors.red;
      return false;
    } else {
      snackBarText = 'Заявка отправлена!';
      color = Colors.green;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(snackBarText),
      duration: const Duration(seconds: 2),
      backgroundColor: color,
    ));
    return true;
  }

  // Future<void> confirm() async {
  //   if (selectedDate != DateTime(2007, 11, 10)){
  //     newDaysOfWork.clear();

  //     await readGarages().listen((List<Garage> garages) async {
  //       if (garages.isNotEmpty) {
  //         for (Garage garage in garages){
  //           if (garage.id == selectedGarage){
  //             for (Timestamp time in garage.daysOfWork){
  //               newDaysOfWork.add(time);
  //               print(newDaysOfWork);
  //               //print(time);
  //             }
  //             newDaysOfWork.add(Timestamp.fromDate(selectedDate));
  //           }
  //         }
  //       }
  //           // await FirebaseFirestore.instance
  //           // .collection('garages')
  //           // .doc(selectedGarage) // Замените documentId на фактический идентификатор документа
  //           // .update({'daysOfWork': newDaysOfWork});

  //       }, onError: (error) {
  //       print('Error: $error');
  //       }, onDone: () {
  //       print('Stream closed');

  //       },
  //       );
  //       //print(newDaysOfWork);
  //           await FirebaseFirestore.instance
  //           .collection('garages')
  //           .doc(selectedGarage) // Замените documentId на фактический идентификатор документа
  //           .update({'daysOfWork': newDaysOfWork});
  //   }
  // }

  Future<void> confirmGarages() async {
    print(serviceDuration);
    print(isDataAddedGarages);
    if (!isDataAddedGarages && selectedDate != DateTime(2007, 11, 10)) {
      isDataAddedGarages = true;

      newDaysOfWorkGarage.clear();

      List<Garage> garages = await readGarages().first;
      if (garages.isNotEmpty) {
        for (Garage garage in garages) {
          if (garage.id == selectedGarage) {
            for (Timestamp time in garage.daysOfWork) {
              newDaysOfWorkGarage.add(time);
              print(newDaysOfWorkGarage);
            }
            for (int i = 0; i < serviceDuration; i++) {
              newDaysOfWorkGarage.add(
                  Timestamp.fromDate(selectedDate.add(Duration(hours: i))));
            }
            //newDaysOfWorkGarage.add(Timestamp.fromDate(selectedDate));
          }
        }
      }

      await addToGarages(newDaysOfWorkGarage);
    }
  }

  Future<void> addToGarages(newDaysOfWork) async {
    await FirebaseFirestore.instance
        .collection('garages')
        .doc(selectedGarage)
        .update({'daysOfWork': newDaysOfWork});
    print('Update complete');
  }

  Future<void> confirmMechanics() async {
    print(isDataAddedMechanics);
    if (!isDataAddedMechanics && selectedDate != DateTime(2007, 11, 10)) {
      isDataAddedMechanics = true;

      newDaysOfWorkMechanic.clear();

      List<Mechanic> mechanics = await readMechanics().first;
      if (mechanics.isNotEmpty) {
        for (Mechanic mechanic in mechanics) {
          if (mechanic.id == selectedMechanic) {
            for (Timestamp time in mechanic.mechanicDaysOfWork) {
              newDaysOfWorkMechanic.add(time);
              print(newDaysOfWorkMechanic);
            }
            for (int i = 0; i < serviceDuration; i++) {
              newDaysOfWorkMechanic.add(
                  Timestamp.fromDate(selectedDate.add(Duration(hours: i))));
            }
          }
        }
      }

      await addToMechanics(newDaysOfWorkMechanic);
    }
  }

  Future<void> addToMechanics(newDaysOfWork) async {
    await FirebaseFirestore.instance
        .collection('mechanics')
        .doc(selectedMechanic)
        .update({'mechanicDaysOfWork': newDaysOfWork});
    print('Update complete');
  }

  void loadData(BuildContext context) {
    final Map<String, dynamic> jsonData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    //final Orrder order = Orrder.fromJson(jsonData);
    mainOrder = Orrder.fromJson(jsonData);
    orderId = mainOrder.id;
    orderDate = mainOrder.dateOfService.toDate();
    print(orderId + '  ' + orderDate.toString());
  }

  Future<void> updateOrder() async {
    await FirebaseFirestore.instance.collection('orders').doc(orderId).update({
      'dateOfService': Timestamp.fromDate(selectedDate),
      'nameOfGarage': selectedGarage,
      'nameOfService': selectedService,
      'nameOfMechanic': selectedMechanic,
      'checkFlag': true,
      'priceOfService': totalPrice,
    });
    print('Update complete');
  }

  void nextPage(BuildContext context) {
    if (showSnackBar(context)) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminPage(),
          ));
    }
  }

  Future<void> blabla() async {
    if (mainOrder.carBrand == 'Toyota') {
      totalRate = 1.5;
    } else if (mainOrder.carBrand == 'Lexus') {
      totalRate = 2.0;
    } else if (mainOrder.carBrand == 'Daihatsu') {
      totalRate = 1.0;
    }
    totalPrice =
        (totalRate * (priceOfService.toDouble() + salaryOfMechanic.toDouble()))
            .toInt();
    update();
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
