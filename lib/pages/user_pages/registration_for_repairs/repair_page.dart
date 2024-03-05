import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:fp/pages/user_pages/registration_for_repairs/repair_controller.dart';
import 'package:get/get.dart';

class RepairPage extends StatelessWidget{

  const RepairPage({super.key});
  @override 
  Widget build(BuildContext context){
    return GetBuilder<RepairPageController>(
      init: RepairPageController(),
      initState: (_) {},
      builder: (_) {
        
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
          body: 
          SingleChildScrollView(
          
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/main_background.jpg'), fit: BoxFit.cover)),
              child: Center(
                child: Form(
                  key: _.repairPageKey,
                child: Column(
                  
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    //SizedBox(
                      //height: 50,
                       Row(
                        children: [
                        ElevatedButton(
                          onPressed: () {Navigator.pop(context);},
                          style: ButtonStyle(alignment: Alignment.center, minimumSize: MaterialStateProperty.all(const Size(150, 50))), 
                          child: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [Icon(Icons.arrow_back),Text('Назад', style: TextStyle(fontSize: 25.0),), ]),
                        )
                        ]
                      ),
                    //),
                    const SizedBox( height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                        children: [
                        const SizedBox(width: 20.0,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const AutoSizeText('Марка автомобиля:', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
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
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 20,
                            child: DropdownButton(
                                items: _.dropdownBrands,
                                onChanged: 
                                  (String? newValue){  
                                  _.selectedBrand = newValue!;
                                  _.update();
                                  print (_.selectedBrand);
                                  },
                                value: _.selectedBrand,
                                underline: Container(),
                                style: const TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                            )
                          )
                        )
                        ),
                        const SizedBox(width: 20.0,)]
                        )
                      ]
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                        const SizedBox(width: 20.0,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const AutoSizeText('Модель автомобиля:', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),]
                        ),
                        //SizedBox(width: 40.0,),
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
                                items: _.dropdownModels,
                                onChanged: 
                                  (String? newValue){  
                                  _.selectedModel = newValue!;
                                  _.update();
                                  print (_.selectedModel);
                                  },
                                value: _.selectedModel,
                                underline: Container(),
                                style: const TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                            )
                            )
                          )
                        ),
                        const SizedBox(width: 20.0,)]
                        )
                      ]
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row( children: [
                        const SizedBox(width: 20.0,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          //height: MediaQuery.of(context).size.height * 0.1,
                          child: const AutoSizeText('Год выпуска автомобиля:', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),
                        ]
                        ),
                        Row( children: [
                        //SizedBox(width: 120.0,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: TextFormField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            controller: _.yearOfCarController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                             // UppercaseInputFormatter(), // Пользовательский форматтер для перевода в верхний регистр
                            ],
                            decoration: const InputDecoration(
                              labelText: 'Год выпуска',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey
                                )
                              )
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите год';
                              }
                              if (value.length != 4) {
                                return 'Введите корректный год';
                              }
                              int year;
                              try {
                                year = int.parse(value);
                              } catch (e) {
                                return 'Введите корректный год';
                              }
                              if (year < 1900 || year > DateTime.now().year) {
                                return 'Не ранее 1900 и не позднее 2023';
                              }
                              return null; // Всё в порядке
                            },
                          )
                        ),
                        const SizedBox(width: 20.0,)
                        ]
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                        const SizedBox(width: 20.0,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const AutoSizeText('ГосНомер автомобиля:', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),]
                        ),
                        //SizedBox(width: 145.0,),
                        Row(
                          children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[УКЕНХВАРОСМИТ0-9]')),
                             // UppercaseInputFormatter(), // Пользовательский форматтер для перевода в верхний регистр
                            ],
                            
                            maxLength: 9,
                            controller: _.stateNumberOfCarController,
                            decoration: const InputDecoration(
                              labelText: 'Гос номер',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey
                                )
                              )
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите государственный номер';
                              }
                              // Регулярное выражение для проверки формата номера автомобиля
                              final RegExp carNumberRegExp = RegExp(r'^[А-я]{1}\d{3}[А-я]{2}\d{2,3}$');
                              if (!carNumberRegExp.hasMatch(value)) {
                                return 'Введите номер в формате "А777УЕ40"';
                              }
                              return null; // Всё в порядке
                            },
                          )
                        ),
                        const SizedBox(width: 20.0,)]
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                        const SizedBox(width: 20.0,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const AutoSizeText('Форма обращения:', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),]),
                        //SizedBox(width: 50.0,),
                        Row(
                          children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: TextFormField(
                            maxLength: 20,
                            controller: _.nameOfClientController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: 'Форма обращения',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey
                                )
                              )
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите текст';
                              }
                              // Регулярное выражение для проверки, что строка состоит только из букв
                              final RegExp lettersRegExp = RegExp(r'^[А-я ]+$');
                              if (!lettersRegExp.hasMatch(value)) {
                                return 'Введите только русские буквы';
                              }
                              return null; // Всё в порядке
                            },
                          )
                        ),
                        const SizedBox(width: 20.0,)])
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                        const SizedBox(width: 20.0,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const AutoSizeText('Номер телефона:', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),]),

                        //SizedBox(width: 71.0,),
                        Row(
                          children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: TextFormField(
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            controller: _.phoneNumberOfClientController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                             // UppercaseInputFormatter(), // Пользовательский форматтер для перевода в верхний регистр
                            ],
                            decoration: const InputDecoration(
                              labelText: 'Номер телефона',
                              prefixText: '+7 ' ,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey
                                )
                              )
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите текст';
                              }
                              // Регулярное выражение для проверки формата номера телефона
                              final RegExp phoneRegExp = RegExp(r'\d{10}$');

                              if (!phoneRegExp.hasMatch(value)) {
                                return 'Введите корректный номер телефона';
                              }
                              return null; // Всё в порядке
                            },
                          )
                        ),
                        const SizedBox(width: 20.0,)])
                      ],
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),

                    Container(
                        
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                        color: Colors.grey, // Серый фон
                        borderRadius: BorderRadius.circular(10.0), // Закругленные края
                      ),
                      child: TextFormField(
                        
                        
                        controller: _.commentOfOrderController,
                        keyboardType: TextInputType.text,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'Опишите причину поломки',
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder.none, // Убираем границу
                        ),
                      ),
                    ),
                    const SizedBox(height: 98.0,),
                    Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: FractionallySizedBox(
                              widthFactor: 0.8,
                              
                              child: ElevatedButton(
                                onPressed: () {
                                  _.confirm();
                                  _.showSnackBar(context);
                                  _.update();
                                  
                                },
                                style: ButtonStyle(alignment: Alignment.center, minimumSize: MaterialStateProperty.all(const Size(150, 50))), 
                                child: const Text('Отправить', style: TextStyle(fontSize: 25),),
                              )
                            )
                          ),)
                  ]
                ),
                )
              ),
            )
          )
          )
        );
      }
    );
  }
}