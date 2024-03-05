// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAvOiWMH8NA1FjtfzSzZUQ1Kag-y72GLVM',
    appId: '1:301736477449:web:f88ccecb02050a2f4849d8',
    messagingSenderId: '301736477449',
    projectId: 'afon-project-32-20972',
    authDomain: 'afon-project-32-20972.firebaseapp.com',
    storageBucket: 'afon-project-32-20972.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkBbJhBULsV3E2XVLo8dFOEWPVk6HQCX4',
    appId: '1:301736477449:android:00b7517f74d3ef6e4849d8',
    messagingSenderId: '301736477449',
    projectId: 'afon-project-32-20972',
    storageBucket: 'afon-project-32-20972.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWbNWgsQAbQytVVj-M2WBSm_AUI_lG9PA',
    appId: '1:301736477449:ios:e97939d67992aef24849d8',
    messagingSenderId: '301736477449',
    projectId: 'afon-project-32-20972',
    storageBucket: 'afon-project-32-20972.appspot.com',
    iosBundleId: 'com.example.fp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWbNWgsQAbQytVVj-M2WBSm_AUI_lG9PA',
    appId: '1:301736477449:ios:2ef2db81e6db631b4849d8',
    messagingSenderId: '301736477449',
    projectId: 'afon-project-32-20972',
    storageBucket: 'afon-project-32-20972.appspot.com',
    iosBundleId: 'com.example.fp.RunnerTests',
  );
}
