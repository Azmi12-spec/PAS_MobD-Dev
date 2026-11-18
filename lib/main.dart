  import 'package:flutter/material.dart';
  import 'package:get/get_navigation/get_navigation.dart';
  import 'package:pas_2026/Routes.dart';


  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
    // return GetMaterialApp(home: KalkulatorPages());
    return GetMaterialApp(
        title: "Belajar Flutter PPLG 3",
        initialRoute: Routes.HomePage,
        getPages: Routes.myPages,
      );
  
    }
  }
  