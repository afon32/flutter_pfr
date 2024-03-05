import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp/pages/user_pages/future_orders_page/future_orders_page.dart';
import 'package:fp/pages/user_pages/home_page/home_page_controller.dart';
import 'package:fp/pages/user_pages/past_orders_page/past_orders_page.dart';
import 'package:fp/pages/user_pages/registration_for_repairs/repair_page.dart';
import 'package:fp/pages/user_pages/sended_orders_page/sended_orders_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});
  @override
   Widget build(BuildContext context) {
  return GetBuilder<HomePageController>(
      init: HomePageController(),
      initState: (_) {},
      builder: (_) {
      return Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('AZ service'),
          actions: [
            IconButton(
              tooltip: 'Помощь',
              onPressed: () {_.showHelp(context);},
              icon: const Icon(Icons.message)),
            IconButton(
              tooltip: 'Выход',
              onPressed: () {FirebaseAuth.instance.signOut();},
              icon: const Icon(Icons.exit_to_app)),
          ],
          leading: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain
          )
        ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/main_background.jpg'), fit: BoxFit.cover),
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    //image: DecorationImage(image: AssetImage('assets/column_background.jpg'), fit: BoxFit.cover),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.5,
                          
                        child: Image.asset(
                          'assets/logo.png',
                          width: 150.0,
                          height: 100.0,
                          )),
                          const SizedBox(height: 30.0),
                        // TextFormField(
                        //   controller: _.textFieldController1,
                        //   decoration: InputDecoration(
                        //     labelText: 'Field 1',
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: Colors.blueGrey
                        //         )
                        //       )
                        //     ),
                        // ),
                      SizedBox(
                            height: 70,
                            child: FractionallySizedBox(
                              widthFactor: 0.9,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const RepairPage()),
                                  );
                                },
                                style: ButtonStyle(alignment: Alignment.center, minimumSize: MaterialStateProperty.all(const Size(150, 50))), 
                                child: Text('Записаться на ремонт', style: TextStyle(fontSize: _.fontSize),),
                              )
                            )
                          ),

                        const SizedBox(height: 30.0),

                        SizedBox(
                            height: 70,
                            child: FractionallySizedBox(
                              widthFactor: 0.9,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const FutureOrdersPage()),
                                  );
                                },
                                style: ButtonStyle(alignment: Alignment.center, minimumSize: MaterialStateProperty.all(const Size(150, 50))), 
                                child: Text('Записи на ремонт', style: TextStyle(fontSize: _.fontSize),),
                              )
                            )
                          ),

                          const SizedBox(height: 30.0),

                        SizedBox(
                            height: 70,
                            child: FractionallySizedBox(
                              widthFactor: 0.9,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SendedOrdersPage()),
                                  );
                                },
                                style: ButtonStyle(alignment: Alignment.center, minimumSize: MaterialStateProperty.all(const Size(150, 50))), 
                                child: Text('Отправленные заявки', style: TextStyle(fontSize: _.fontSize),),
                              )
                            )
                          ),

                          const SizedBox(height: 30.0),

                          SizedBox(
                            height: 70,
                            child: FractionallySizedBox(
                              widthFactor: 0.9,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const PastOrdersPage()),
                                  );
                                },
                                style: ButtonStyle(alignment: Alignment.center, minimumSize: MaterialStateProperty.all(const Size(150, 50))), 
                                child: Text('История ремонтов', style: TextStyle(fontSize: _.fontSize),),
                              )
                            )
                          ),

                        // TextFormField(
                        //   controller: _.textFieldController2,
                        //   decoration: InputDecoration(
                        //     labelText: 'Field 2',
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: Colors.blueGrey
                        //         )
                        //       )
                        //     ),
                          
                        // ),
                        // const SizedBox(height: 30.0,),
                        // SizedBox(
                        //   height: 50,
                        //   child: FractionallySizedBox(
                        //     widthFactor: 0.9,
                        //     child: ElevatedButton(onPressed: () {print('pizda');}, child: Text('Commit', style: TextStyle(fontSize: _.fontSize),))
                        //   )
                        // )
                      ],
                    ),
                  ) 
                ) 
            )
            )
        )
      );
      }
    );
  }
}