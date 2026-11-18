import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_2026/Controller/list_makanan_ctrl.dart';
import 'package:pas_2026/Routes.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListProdukController());
    return Scaffold(
      backgroundColor: const Color(0xFFD9C5B2),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.listProduk.length,
          itemBuilder: (context, index) {
            final item = controller.listProduk[index];
            return Card(
              color: const Color(0xFFF2EAE1),
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item.imageProduk,
                    width: 76,
                    height: 76,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  item.namaProduk,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${item.hargaLabel} / ${item.satuan}',
                  style: const TextStyle(color: Colors.green),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Get.toNamed(
                  Routes.detailmakananpage,
                  arguments: {
                    'namaMakanan': item.namaProduk,
                    'hargaMakanan': item.hargaProduk,
                    'satuan': item.satuan,
                    'deskripsi': item.deskripsi,
                    'imageMakanan': item.imageProduk,
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
