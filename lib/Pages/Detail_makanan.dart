import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_2026/Controller/Detail_Produk_ctrl.dart';

class DetailMakananPage extends StatelessWidget {
  DetailMakananPage({super.key});
  final DetailMakananController controller = Get.put(DetailMakananController());
  String rupiah(int n) =>
      'Rp ${n.toString().replaceAllMapped(RegExp(r"(\d)(?=(\d{3})+(?!\d))"), (m) => '${m[1]}.')}';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Transaksi Pembelian')),
    backgroundColor: const Color(0xFFD9C5B2),
    body: Obx(
      () => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: const Color(0xFFF2EAE1),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      controller.imageMakanan,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    controller.namaMakanan,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${rupiah(controller.hargaMakanan)} / ${controller.satuan}',
                    style: const TextStyle(fontSize: 18, color: Colors.green),
                  ),
                  const SizedBox(height: 8),
                  Text(controller.deskripsi),
                  const SizedBox(height: 18),
                  const Text('Jumlah makanan'),
                  TextFormField(
                    initialValue: '1',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan jumlah',
                    ),
                    onChanged: controller.setJumlah,
                  ),
                  const SizedBox(height: 18),
                  _row('Subtotal', rupiah(controller.subtotal)),
                  _row('PPN (5%)', rupiah(controller.ppn)),
                  const Divider(),
                  _row(
                    'Total Bayar',
                    rupiah(controller.totalBayar),
                    bold: true,
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.dialog(
                        AlertDialog(
                          title: const Text('Konfirmasi Pembayaran'),
                          content: Text(
                            'Subtotal: ${rupiah(controller.subtotal)}\nPPN (5%): ${rupiah(controller.ppn)}\nTotal Bayar: ${rupiah(controller.totalBayar)}',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: const Text('Tutup'),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.back();
                                Get.snackbar(
                                  'Pembayaran',
                                  'Pembayaran berhasil diproses',
                                );
                              },
                              child: const Text('Konfirmasi'),
                            ),
                          ],
                        ),
                      ),
                      child: const Text('Bayar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
  Widget _row(String a, String b, {bool bold = false}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          a,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          b,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
