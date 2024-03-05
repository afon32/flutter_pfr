import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPageController extends GetxController {
  final fontSize = 20.0;

  void showHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Техническая поддержка'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Телефон горячей линии: +7-980-335-69-01'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Закрыть'),
            ),
          ],
        );
      },
    );
  }
}
