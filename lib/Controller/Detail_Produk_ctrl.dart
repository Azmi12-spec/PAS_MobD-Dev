import 'package:get/get.dart';

class DetailMakananController extends GetxController {
  late String namaMakanan, satuan, deskripsi, imageMakanan;
  late int hargaMakanan;
  final jumlah = 1.obs;
  int get subtotal => hargaMakanan * jumlah.value;
  int get ppn => (subtotal * 0.05).round();
  int get totalBayar => subtotal + ppn;
  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments ;
    namaMakanan = args['namaMakanan'];
    hargaMakanan = args['hargaMakanan'];
    imageMakanan = args['imageMakanan'];
  }

  void setJumlah(String value) =>
      jumlah.value = (int.tryParse(value) ?? 1).clamp(1, 999).toInt();
}
