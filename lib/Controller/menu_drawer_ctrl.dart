import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_2026/Menu/Home.dart';
import 'package:pas_2026/Menu/Feat.dart';
import 'package:pas_2026/Menu/Profile.dart';

class MenuDrawerCtrl extends GetxController {
  final RxInt selectedIndex = 0.obs;
  void changePage(int index) => selectedIndex.value = index;
  final List<Widget> listPages = const [
    MyHomePage(),
    FeatPage(),
    ProfilePage(),
  ];
}
