import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/data_controller.dart';
import 'data_view.dart';

class HomeView extends StatelessWidget {
  final DataController controller = Get.put(DataController());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Items Viewer")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return DataView(controller.items);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.fetchData,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
