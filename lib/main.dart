import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fp/pages/admin_pages/admin_home_page/admin_home_page_page.dart';
import 'package:fp/pages/auth/auth_page.dart';
import 'package:fp/pages/user_pages/home_page/home_page_page.dart';
import 'package:fp/utils/firebase_helper.dart';
import 'package:get/get.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:fp/utils/utils.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseHelper.connect();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      title: 'AZ service',
      theme: FlexThemeData.light(
        scheme: FlexScheme.blue,
        scaffoldBackground: Colors.grey.shade100,
      ),
      home: const MainPage(),
    );
  }
}


class MainPage extends StatelessWidget{
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) =>Scaffold(
    
    body: StreamBuilder<User?>(
      builder: (context, snapshot){
        if (snapshot.hasData){
          User? user = snapshot.data;
          if (user != null){
            if (user.email == 'master@mail.ru'){
              return const AdminPage();
            }
            else{
              return const HomePage();
            }
          }
          else {
            return const HomePage();
          }
        }
        else{
          return const AuthPage();
        }
      }, 
      stream: FirebaseAuth.instance.authStateChanges(),
      )
  );
}