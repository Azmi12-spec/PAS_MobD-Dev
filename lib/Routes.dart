import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas_2026/Menu/Home.dart';
import 'package:pas_2026/Pages/Detail_makanan.dart';
import 'package:pas_2026/Pages/login.dart';
import 'package:pas_2026/Pages/menu_drawer.dart';
class Routes {
  static const String login = '/login';
  static const String detailmakananpage = '/detailmakananpage';
  static const String menuDrawerPage = '/menuDrawerPage';
  static const String HomePage = '/home';
  static final myPages = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: detailmakananpage, page: () => DetailMakananPage()),
    GetPage(name: menuDrawerPage, page: () => MenuDrawerPage()),
    GetPage(name: HomePage, page: () => MyHomePage()),
  ];
}
