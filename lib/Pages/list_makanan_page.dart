import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_2026/Controller/list_makanan_ctrl.dart';
// import 'package:pas_2026/Pages/detail_produk_page.dart';
import 'package:pas_2026/Routes.dart';


class ListProdukPage extends StatelessWidget {
  ListProdukPage({super.key});
  final controller = Get.put(ListProdukController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Products")),
      body: Container(
        color: const Color(0xFFD9C5B2),
        child: Obx(
          () => RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            edgeOffset: 0,
            backgroundColor: Colors.blue,
            color: Colors.white,
            displacement: 30,
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
              controller.listProduk.assignAll(controller.dataAwal);
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemCount: controller.listProduk.length,
              itemBuilder: (context, index) {
                final produk = controller.listProduk[index];
                Offset tapPosition = Offset.zero;
                return Dismissible(
                  key: ValueKey(produk.namaProduk),
                  direction: DismissDirection.startToEnd,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    controller.listProduk.removeAt(index);
                    Get.snackbar(
                      "Produk Dihapus",
                      "Produk berhasil dihapus",
                    );
                  },
                  child: Card(
                    color: const Color(0xFFF2EAE1),
                    elevation: 4, // Efek Timbull
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTapDown: (details) {
                        tapPosition = details.globalPosition;
                      },
                      onLongPress: () {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            tapPosition.dx,
                            tapPosition.dy,
                            tapPosition.dx,
                            tapPosition.dy,
                          ),
                          items: [
                            PopupMenuItem(
                              child: const Text("Lihat Detail"),
                              onTap: () {
                                Get.toNamed(
                                  Routes.detailmakananpage,
                                  arguments: {
                                    'namaMakanan': produk.namaProduk,
                                    'hargaMakanan': produk.hargaProduk,
                                    'imageMakanan': produk.imageProduk,
                                  },
                                );
                              },
                            ),
                            PopupMenuItem(
                              child: const Text("Bagikan"),
                              onTap: () {
                                Get.snackbar(
                                  "Bagikan",
                                  "Membagikan ${produk.namaProduk}",
                                );
                              },
                            ),
                            PopupMenuItem(
                              child: const Text(
                                "Hapus",
                                style: TextStyle(color: Colors.red),
                              ),
                              onTap: () {
                                controller.listProduk.removeAt(index);
                                Get.snackbar(
                                  "Produk Dihapus",
                                  "Produk berhasil dihapus",
                                );
                              },
                            ),
                          ],
                        );
                      },
                      onTap: () {
                        Get.toNamed(
                          Routes.detailmakananpage,
                          arguments: {
                            'namaProduk': produk.namaProduk,
                            'hargaProduk': produk.hargaLabel,
                            'imageProduk': produk.imageProduk,

                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Image.asset(
                              produk.imageProduk,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    produk.namaProduk,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    produk.hargaLabel,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 14,
                                      ),
                                     
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}


