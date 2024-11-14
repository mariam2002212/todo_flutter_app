// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAweTDGBiO8DJvCvTfqRL5p6v8WCa48_gU',
    appId: '1:755785242595:web:fc83edd96bf37f52b172d6',
    messagingSenderId: '755785242595',
    projectId: 'todo-app-2a9cf',
    authDomain: 'todo-app-2a9cf.firebaseapp.com',
    storageBucket: 'todo-app-2a9cf.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgEz4mKdywIabM_KDI4ncy4QO3FhfTyQo',
    appId: '1:755785242595:android:a61c2b3bedd36a79b172d6',
    messagingSenderId: '755785242595',
    projectId: 'todo-app-2a9cf',
    storageBucket: 'todo-app-2a9cf.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtAZf2iPj37nSFxdR5y0SoB-jPVRAa_5E',
    appId: '1:755785242595:ios:ddd3444df9153b42b172d6',
    messagingSenderId: '755785242595',
    projectId: 'todo-app-2a9cf',
    storageBucket: 'todo-app-2a9cf.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCtAZf2iPj37nSFxdR5y0SoB-jPVRAa_5E',
    appId: '1:755785242595:ios:ddd3444df9153b42b172d6',
    messagingSenderId: '755785242595',
    projectId: 'todo-app-2a9cf',
    storageBucket: 'todo-app-2a9cf.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAweTDGBiO8DJvCvTfqRL5p6v8WCa48_gU',
    appId: '1:755785242595:web:b0a4b7715467bf97b172d6',
    messagingSenderId: '755785242595',
    projectId: 'todo-app-2a9cf',
    authDomain: 'todo-app-2a9cf.firebaseapp.com',
    storageBucket: 'todo-app-2a9cf.firebasestorage.app',
  );
}
