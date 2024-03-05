

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fp/pages/admin_pages/admin_order_page/admin_one_order_page_registration/admin_one_order_page_registration_controller.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AdminOneOrderPageRegistration extends StatelessWidget{

  const AdminOneOrderPageRegistration({super.key});

  @override
  Widget build(BuildContext context){
    return GetBuilder<AdminOneOrderPageRegistrationController>(
      init: AdminOneOrderPageRegistrationController(),
      initState: (_) {},
      builder: (_){
        _.loadData(context);
        print(_.orderId);
        return Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('AZ service'),
          actions: [


          ],
          leading: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain
          )
            ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/main_background.jpg'), fit: BoxFit.cover)),
                child: Center(
                  child: Form(
                    key: _.adminOneOrderPageRegistrationKey,
                    child: FutureBuilder<List<TimeRegion>>(
                          future: _.setBusynessTime(),
                          builder: (context, snapshot){
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              // While the future is still executing, return a loading indicator
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // If there's an error, handle it
                              return Text('Error: ${snapshot.error}');
                            } else {
                              List<TimeRegion> specialRegions = snapshot.data!;
                    return( Column(
                      children: [
                        Row(
                        children: [
                        ElevatedButton(
                          onPressed: () {Navigator.pop(context);},
                          style: ButtonStyle(alignment: Alignment.center, minimumSize: MaterialStateProperty.all(const Size(150, 50))), 
                          child: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [Icon(Icons.arrow_back),Text('Назад', style: TextStyle(fontSize: 25.0),), ]),
                        )
                        ]
                      ),

                    const SizedBox( height: 20.0,),
                    Padding(padding: const EdgeInsets.all(10.0),
                         child: SfCalendar(
                          backgroundColor: Colors.white,
                          view: CalendarView.week,
                          firstDayOfWeek: DateTime.now().weekday, // Понедельник
                          timeSlotViewSettings: const TimeSlotViewSettings(
                            startHour: 8,
                            endHour: 18,
                            nonWorkingDays: <int>[DateTime.friday, DateTime.saturday]
                          ),
                          specialRegions: specialRegions,
                          onTap: (CalendarTapDetails details) {
                            if (details.targetElement == CalendarElement.calendarCell) {
                              // Обработайте нажатие на ячейку календаря
                              final DateTime selectedDate = details.date!;
                              // Выведите выбранную дату в Text или в консоль
                              if (selectedDate.isBefore(DateTime.now())){
                                _.showBeforeDateSnackbar(context);
                              }
                              else{
                                _.selectedDate = selectedDate;
                                print(_.selectedDate);
                                _.update();

                              }
                            }
                          },
                          
  
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                        children: [
                        const SizedBox(width: 10.0,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const AutoSizeText('Выберите бокс:', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),]),
                        //SizedBox(width: 50.0,),
                        Row(
                          children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 20,
                            child: DropdownButton(
                                items: _.dropdownGarages,
                                onChanged: 
                                  (String? newValue){  
                                  _.selectedGarage = newValue!;
                                  _.update();
                                  //print (_.selectedGarage);
                                  //_.setBusynessTime();
                                  },
                                value: _.selectedGarage,
                                underline: Container(),
                                style: const TextStyle(fontSize: 10.0, color: Colors.black, fontWeight: FontWeight.bold),
                            )
                          )
                        )
                        ),
                        const SizedBox(width: 5.0,)]
                        )
                      ]
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                        children: [
                        const SizedBox(width: 10.0,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const AutoSizeText('Выберите механика:', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),]),
                        Row(
                          children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 20,
                            child: DropdownButton(
                                items: _.dropdownMechanics,
                                onChanged: 
                                  (String? newValue){  
                                  _.selectedMechanic = newValue!;
                                  _.update();
                                  //print (_.selectedGarage);
                                  //_.setBusynessTime();
                                  },
                                value: _.selectedMechanic,
                                underline: Container(),
                                style: const TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                            )
                          )
                        )
                        ),
                        const SizedBox(width: 5.0,)]
                        )
                      ]
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                        children: [
                        const SizedBox(width: 10.0,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const AutoSizeText('Выберите тип услуги:', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),]),
                        Row(
                          children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 20,
                            child: DropdownButton(
                                items: _.dropdownServices,
                                onChanged: 
                                  (String? newValue){  
                                  _.selectedService = newValue!;
                                  _.update();
                                  },
                                value: _.selectedService,
                                underline: Container(),
                                style: const TextStyle(fontSize: 10.0, color: Colors.black, fontWeight: FontWeight.bold),
                            )
                          )
                        )
                        ),
                        const SizedBox(width: 5.0,)]
                        )
                      ]
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                        children: [
                        const SizedBox(width: 10.0,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const AutoSizeText('Выберите дату:', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),]),
                        Row(
                          children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 20,
                            child: Text(
                                
                                _.returnDate(),
                                style: const TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                                
                            )
                          )
                        )
                        ),
                        const SizedBox(width: 5.0,)]
                        )
                      ]
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                        children: [
                        const SizedBox(width: 10.0,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const AutoSizeText('Ожидаемая стоимость:', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),]),
                        Row(
                          children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 20,
                            child: Text(
                                _.totalPrice.toString(),
                                style: const TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                            )
                          )
                        )
                        ),
                        const SizedBox(width: 5.0,)]
                        )
                      ]
                    ),


                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Align(
                          
                        alignment: Alignment.bottomCenter,
                        
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: FractionallySizedBox(
                              widthFactor: 0.8,
                              
                              child: ElevatedButton(onPressed:() {_.confirmGarages();  _.confirmMechanics(); _.updateOrder(); _.nextPage(context); }, child: const Text('Принять'))
                        )
                        )
                        ),
                      ],
                    )
                    );
                             } }
                  )
                )
              )
            )
          )
        ));
      }
    );
  }
}