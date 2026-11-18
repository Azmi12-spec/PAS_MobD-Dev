import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_2026/Controller/Feat_ctrl.dart';

class FeatPage extends StatelessWidget {
  const FeatPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeatController());
    return Scaffold(
      backgroundColor: const Color(0xFFD9C5B2),
      appBar: AppBar(
        title: const Text('Klub Premier League'),
        backgroundColor: const Color(0xFFF2EAE1),
      ),
      body: Obx(() {
        if (controller.isLoading.value)
          return const Center(child: CircularProgressIndicator());
        if (controller.errorMessage.value.isNotEmpty)
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    controller.errorMessage.value,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: controller.loadTeams,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Coba Lagi'),
                  ),
                ],
              ),
            ),
          );
        return RefreshIndicator(
          onRefresh: controller.loadTeams,
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.teams.length,
            itemBuilder: (context, index) {
              final team = controller.teams[index];
              return Card(
                color: const Color(0xFFF2EAE1),
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: Image.network(
                    team.strBadge,
                    width: 56,
                    height: 56,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    team.strTeam,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    team.strStadium.isEmpty
                        ? 'Stadion belum tersedia'
                        : team.strStadium,
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
