import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/item_model.dart';

class DatabaseService {
  static Future<Database> initializeDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'merged_data.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE merged_data(
            COMAPNYNO TEXT,
            STOCK_CODE TEXT,
            ItemOCode TEXT,
            QTY TEXT,
            ITEMNO TEXT,
            NAME TEXT,
            CATEOGRYID TEXT,
            ItemK TEXT,
            BARCODE TEXT,
            MINPRICE TEXT,
            ITEML TEXT,
            ISSUSPENDED TEXT,
            F_D TEXT,
            ITEMHASSERIAL TEXT,
            ITEMPICSPATH TEXT,
            TAXPERC TEXT,
            ISAPIPIC TEXT,
            LSPRICE TEXT
          )
          ''',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertData(Database db, List<ItemModel> data) async {
    await db.transaction((txn) async {
      for (final item in data) {
        await txn.insert(
          'merged_data',
          item.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  static Future<List<ItemModel>> fetchData(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query('merged_data');
    return List.generate(maps.length, (i) => ItemModel.fromJson(maps[i]));
  }
}
