import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fp/pages/admin_pages/admin_home_page/admin_home_page_page.dart';
import 'package:fp/pages/admin_pages/admin_checked_order_page/admin_one_checked_order_page/admin_one_checked_order_page_controller.dart';
import 'package:fp/pages/user_pages/home_page/home_page_page.dart';
import 'package:fp/pages/user_pages/sended_orders_page/sended_order_page/one_sended_order_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OneSendedOrderPage extends StatelessWidget{

  const OneSendedOrderPage({super.key});

  @override
  Widget build(BuildContext context){
    return GetBuilder<OneSendedOrderPageController>(
      init: OneSendedOrderPageController(),
      initState: (_) {},
      builder: (_){
        _.loadData(context);

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
          child: FutureBuilder(future: _.readGarageName(), builder: (context, snapshot)
                    {return  Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/main_background.jpg'), fit: BoxFit.cover)),
              child: Center(
                child: Form(
                  key: _.oneSendedOrderPageKey,
                  
                child: Column(

                  children: [

                       Row(
                        children: [
                        ElevatedButton(
                          onPressed: () {Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage(),
          )
    );},
                          style: ButtonStyle(alignment: Alignment.center, minimumSize: MaterialStateProperty.all(const Size(150, 50))), 
                          child: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [Icon(Icons.arrow_back),Text('Назад', style: TextStyle(fontSize: 25.0),), ]),
                        )
                        ]
                      ),

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
                            child: AutoSizeText(_.mainOrder.carBrand, style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
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
                              child:  AutoSizeText(_.mainOrder.carModel, style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
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
                          child: const AutoSizeText('Год выпуска автомобиля:', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),
                        ]
                        ),
                        Row( children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child:  AutoSizeText(_.mainOrder.carYear, style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
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
                        Row(
                          children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child:  AutoSizeText(_.mainOrder.carStateNumber, style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
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
                        Row(
                          children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child:  AutoSizeText(_.mainOrder.clientName, style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),

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

                        Row(
                          children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: AutoSizeText(_.mainOrder.clientPhone, style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),
                        const SizedBox(width: 20.0,)])
                      ],
                    ),

                    //
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
                          child: const AutoSizeText('Дата подачи заявления:', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),]),

                        Row(
                          children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: AutoSizeText(DateFormat('dd.MM.yy  hh:mm').format(_.mainOrder.date.toDate()), style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,), maxLines: 1,),
                        ),
                        const SizedBox(width: 20.0,)])
                      ],
                    ),
                    //

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                        
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                        color: Colors.grey, // Серый фон
                        borderRadius: BorderRadius.circular(10.0), // Закругленные края
                      ),
                      child: Text(_.mainOrder.commentToOrder),
                    ),
                    //const SizedBox(height: 98.0,),
                                        SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: FractionallySizedBox(
                              widthFactor: 0.8,
                              
                              child: ElevatedButton(
                                onPressed: () {

                                  _.deleteOrder(context);
                                  
                                },
                                style: ButtonStyle(alignment: Alignment.center, minimumSize: MaterialStateProperty.all(const Size(150, 50))), 
                                child: const Text('Удалить', style: TextStyle(fontSize: 25),),
                              )
                            )
                          ),)
                  ]
                ),
                )
              ),
            )
          );})
          )
        );
      }, 
    );
  }
}