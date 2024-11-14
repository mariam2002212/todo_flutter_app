import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/my_app.dart';

void main() async{
  // to make sure en hwa 3ml init ll app
  WidgetsFlutterBinding.ensureInitialized();
  //b2olo init el app hasab el ghaz b2a ios / android kda
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseFirestore.instance.disableNetwork();
  runApp(const MyApp());
}

