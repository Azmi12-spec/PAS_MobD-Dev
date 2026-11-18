import 'package:get/get.dart';

class KasirController extends GetxController {
  var harga = 0.0.obs;
  var totalDiskon = 0.0.obs;
  var totalPpn = 0.0.obs;
  var total = 0.0.obs;
  var hasilhitung = 0.0.obs;

  void hitung(double h, double diskon, double ppn) {

    // Menghitung diskon
    double diskon1 = h * diskon / 100;

    // Menghitung PPN
   double ppn1 = h * ppn / 100;

    // Menghitung total pembayaran
    double hasil  = h - diskon1 + ppn1;

    harga.value = h;
    hasilhitung.value = hasil;
    totalDiskon.value = diskon1;
    totalPpn.value = ppn1;
  }

  void reset() {
    harga.value = 0.0;
    totalDiskon.value = 0.0;
    totalPpn.value = 0.0;
    total.value = 0.0;
  }
}

//page

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project1/components/custom_textfield.dart';
// import 'package:project1/components/custom_button.dart';
// import 'package:project1/controller/kasir_ctrl.dart';

// class KasirPage extends StatelessWidget {
//   KasirPage({super.key});

//   final controller = Get.put(KasirController());

//   final TextEditingController txtharga = TextEditingController();
//   final TextEditingController txtpajak = TextEditingController();
//   final TextEditingController txtppn = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Kasir'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Input Harga
//             Container(
//               margin: const EdgeInsets.all(10),
//               child: CustomTextfield(
//                 hint: 'Masukkan Harga',
//                 txtController: txtharga,
//                 cornerRadius: 10,
//                 keyboardType: const TextInputType.numberWithOptions(
//                   decimal: true,
//                 ),
//               ),
//             ),

//             // Input Pajak
//             Container(
//               margin: const EdgeInsets.all(10),
//               child: CustomTextfield(
//                 hint: 'Masukkan Pajak (%)',
//                 txtController: txtpajak,
//                 cornerRadius: 10,
//                 keyboardType: const TextInputType.numberWithOptions(
//                   decimal: true,
//                 ),
//               ),
//             ),

//             // Input PPN
//             Container(
//               margin: const EdgeInsets.all(10),
//               child: CustomTextfield(
//                 hint: 'Masukkan PPN (%)',
//                 txtController: txtppn,
//                 cornerRadius: 10,
//                 keyboardType: const TextInputType.numberWithOptions(
//                   decimal: true,
//                 ),
//               ),
//             ),

//             // Tombol Hitung
//             Container(
//               margin: const EdgeInsets.only(top: 20),
//               child: CustomButton(
//                 text: 'Hitung Total',
//                 onPressed: () {
//                   if (txtharga.text.isEmpty ||
//                       txtpajak.text.isEmpty ||
//                       txtppn.text.isEmpty) {
//                     Get.snackbar(
//                       'Error',
//                       'Semua input harus diisi',
//                       snackPosition: SnackPosition.BOTTOM,
//                     );
//                     return;
//                   }

//                   // double? harga = double.tryParse(txtharga.text);
//                   // double? pajak = double.tryParse(txtpajak.text);
//                   // double? ppn = double.tryParse(txtppn.text);

//                   // if (harga == null ||
//                   //     pajak == null ||
//                   //     ppn == null ||
//                   //     harga < 0 ||
//                   //     pajak < 0 ||
//                   //     ppn < 0) {
//                   //   Get.snackbar(
//                   //     'Error',
//                   //     'Masukkan angka yang valid dan tidak negatif',
//                   //     snackPosition: SnackPosition.BOTTOM,
//                   //   );
//                   //   return;
//                   // }

//                   controller.hitung(
//                     double.parse(txtharga.text),
//                     double.parse(txtpajak.text),
//                     double.parse(txtppn.text),
//                   );
//                 },
//               ),
//             ),

//             // Hasil Perhitungan
//             Container(
//               margin: const EdgeInsets.all(25),
//               child: Obx(
//                 () => Column(
//                   children: [
//                     const Text(
//                       'Rincian Pembayaran',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 15),

//                     Text('Harga: Rp ${controller.harga.value}'),
//                     Text('Diskon: Rp ${controller.totalDiskon.value}'),
//                     Text('PPN: Rp ${controller.totalPpn.value}'),

//                     const Divider(),

//                     Text(
//                       'Total: Rp ${controller.hasilhitung.value}',
//                       style: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // Tombol Reset
//             Container(
//               margin: const EdgeInsets.only(top: 10),
//               child: CustomButton(
//                 text: 'Reset',
//                 onPressed: () {
//                   txtharga.clear();
//                   txtpajak.clear();
//                   txtppn.clear();

//                   controller.reset();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }















//Obx(() {
//   if (controller.pesanError.value.isNotEmpty) {
//     return Text(controller.pesanError.value);
//   }

//   if (controller.hasil.value == null) {
//     return const Text('Total: -');
//   }

//   return Text('Total: Rp ${controller.hasil.value!.toStringAsFixed(0)}');
// })

//
//Di Page, input perlu memakai controller.hargaController dan controller.jumlahController. Tombol hitung memanggil: controller.hitungTotal() 
// onPressed: controller.hitungTotal,   