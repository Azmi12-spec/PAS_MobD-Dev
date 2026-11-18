import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_2026/Model/login_model.dart';
import 'package:pas_2026/Routes.dart';

class LoginController extends GetxController {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();
  final isLoading = false.obs;
  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }

  Future<void> login() async {
    if (txtUsername.text.trim().isEmpty || txtPassword.text.isEmpty) {
      Get.snackbar('Login gagal', 'Username dan password wajib diisi.');
      return;
    }
    isLoading.value = true;
    try {
      final response = await http
          .post(
            Uri.parse('https://mediadwi.com/api/latihan/login'),
            body: {
              'username': txtUsername.text.trim(),
              'password': txtPassword.text,
            },
          )
          .timeout(const Duration(seconds: 20));
      if (response.statusCode != 200)
        throw Exception('HTTP ${response.statusCode}');
      final result = loginModelFromJson(response.body);
      if (result.status) {
        Get.offAllNamed(Routes.menuDrawerPage);
      } else {
        Get.snackbar(
          'Login gagal',
          result.massage.isEmpty
              ? 'Username atau password salah.'
              : result.massage,
        );
      }
    } catch (_) {
      Get.snackbar(
        'Tidak dapat login',
        'Periksa koneksi internet dan coba lagi.',
      );
    } finally {
      isLoading.value = false;
    }
  }
}
