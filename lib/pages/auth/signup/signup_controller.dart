
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fp/main.dart';
import 'package:fp/pages/auth/auth_page.dart';
import 'package:fp/utils/utils.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
   final signUpKey = GlobalKey<FormState>();
   final emailController = TextEditingController();
   final passController = TextEditingController();

  get signUpVisible => null;

  Future signUp(BuildContext context) async {
    final isValid = signUpKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passController.text.trim(),
      );
      onTapSignIn(context);
    }
      on FirebaseAuthException catch (e) {
        print(e);
        Utils.showSnackBar(e.message);
    }
  }

    Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passController.text.trim(),
      );
    }
      on FirebaseAuthException catch (e) {
        print(e);
        Utils.showSnackBar(e.message);
    }
  }
  void onTapSignIn(BuildContext context){
    Utils.showGreenSnackBar('Регистрация прошла успешно!');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()
    ));
  }
}
