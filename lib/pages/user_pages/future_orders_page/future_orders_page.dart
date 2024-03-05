import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp/pages/admin_pages/admin_checked_order_page/admin_checked_order_page_controller.dart';
import 'package:fp/pages/admin_pages/admin_history_orders_page/admin_history_orders_page_controller.dart';
import 'package:fp/pages/admin_pages/admin_order_page/order.dart';
import 'package:fp/pages/user_pages/future_orders_page/future_orders_controller.dart';
import 'package:fp/pages/user_pages/sended_orders_page/sended_orders_controller.dart';
import 'package:get/get.dart';

class FutureOrdersPage extends StatelessWidget{
  const FutureOrdersPage({super.key});

  @override
  Widget build(BuildContext context){
    return GetBuilder<FutureOrdersPageController>(
      init: FutureOrdersPageController(),
      initState: (_) {},
      builder: (_){
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
          body: Form(
            key: _.futureOrdersPageKey,
          child: StreamBuilder<List<Orrder>>(
            stream: _.readOrders(),
            builder: (context, snapshot) {
              if (snapshot.hasError){
                return Text('Something went wrong!${snapshot.error}');
              }
              else if (snapshot.hasData){
                final orders = snapshot.data!;
                return ListView(
                  children: orders.map((order) {
                    return InkWell(
                      onTap: () {
                        // Ваш обработчик нажатия
                        _.onTapOnOrder(order);
                      },
                      child: _.buildOrder(order),
                    );
                  }).toList(),
                );
                // return ListView(
                //   children: orders.map(_.buildOrder).toList(),
                // );
              }
              else{
                return const Center(child: CircularProgressIndicator());
              }
              
            }
          ),
          )
        );
      },
    );
  }
}