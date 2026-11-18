import 'package:pas_2026/Model/makanan_model.dart';
import 'package:get/get.dart';

class ListProdukController extends GetxController {
  final RxList<MakananModel> listProduk = <MakananModel>[
    MakananModel(
      namaProduk: 'Nasi Goreng Spesial',
      hargaProduk: 25000,
      satuan: 'porsi',
      deskripsi: 'Nasi goreng bumbu rempah dengan telur mata sapi, ayam suwir, dan kerupuk.',
      imageProduk: 'lib/Assets/apem_all.jpg',
    ),
    MakananModel(
      namaProduk: 'Ayam Bakar Madu',
      hargaProduk: 30000,
      satuan: 'porsi',
      deskripsi: 'Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan.',
      imageProduk: 'lib/Assets/apem_all.jpg',
    ),
    MakananModel(
      namaProduk: 'Sate Ayam Madura',
      hargaProduk: 28000,
      satuan: 'porsi',
      deskripsi: '10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.',
      imageProduk: 'lib/Assets/apem_all.jpg',
    ),
    MakananModel(
      namaProduk: 'Mie Ayam Bakso',
      hargaProduk: 20000,
      satuan: 'porsi',
      deskripsi: 'Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.',
      imageProduk: 'lib/Assets/apem_all.jpg',
    ),
    MakananModel(
      namaProduk: 'Es Teh Manis Jumbo',
      hargaProduk: 8000,
      satuan: 'gelas',
      deskripsi:
          'Minuman teh melati segar dengan gula asli dan es batu kristal.',
      imageProduk: 'lib/Assets/apem_all.jpg',
    ),
  ].obs;
  final List<MakananModel> dataAwal = [];
  @override
  void onInit() {
    super.onInit();
    dataAwal.addAll(listProduk);
  }
}
