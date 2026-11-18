import 'package:get/get.dart';
import 'package:pas_2026/Model/team_model.dart';
import 'package:http/http.dart' as http;

class FeatController extends GetxController {
  final teams = <Team>[].obs;
  final isLoading = true.obs;
  final errorMessage = ''.obs;
  @override
  void onInit() {
    super.onInit();
    loadTeams();
  }

  Future<void> loadTeams() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final uri = Uri.https(
        'www.thesportsdb.com',
        '/api/v1/json/123/search_all_teams.php',
        {'l': 'English Premier League'},
      );
      final response = await http.get(uri).timeout(const Duration(seconds: 20));
      if (response.statusCode != 200)
        throw Exception('HTTP ${response.statusCode}');
      final result = premierLeagueModelFromJson(response.body);
      teams.assignAll(result.teams);
      if (teams.isEmpty) errorMessage.value = 'Data klub tidak ditemukan.';
    } catch (_) {
      errorMessage.value =
          'Gagal memuat data klub. Periksa koneksi internet lalu coba lagi.';
    } finally {
      isLoading.value = false;
    }
  }
}
