import 'package:falcons/items/models/item_model.dart';
import 'package:falcons/items/services/api_service.dart';
import 'package:falcons/items/services/database_service.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class DataController extends GetxController {
  RxList<ItemModel> items = <ItemModel>[].obs;
  RxBool isLoading = true.obs;

  late Database db;

  @override
  void onInit() async {
    super.onInit();
    db = await DatabaseService.initializeDatabase();
    await fetchData();
  }

  Future<void> fetchData() async {
    isLoading(true);
    try {
      final mergedData = await ApiService.fetchAndMergeData();
      final itemList = mergedData.map((e) => ItemModel.fromJson(e)).toList();
      await DatabaseService.insertData(db, itemList);
      items.value = itemList;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
