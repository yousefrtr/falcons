import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const url1 =
      'http://173.249.1.117:8095/van.dll/getvanalldata?cono=290&strno=1&case=9';
  static const url2 =
      'http://173.249.1.117:8095/van.dll/getvanalldata?cono=290&strno=1&case=4';

  static Future<List<Map<String, dynamic>>> fetchAndMergeData() async {
    try {
      final response1 = await http.get(Uri.parse(url1));
      final response2 = await http.get(Uri.parse(url2));

      if (response1.statusCode == 200 && response2.statusCode == 200) {
        final salesManItems =
            (json.decode(response1.body)['SalesMan_Items_Balance'] as List)
                .map((e) => e as Map<String, dynamic>)
                .toList();
        final itemsMaster =
            (json.decode(response2.body)['Items_Master'] as List)
                .map((e) => e as Map<String, dynamic>)
                .toList();

        return salesManItems.map<Map<String, dynamic>>((item) {
          final masterItem = itemsMaster.firstWhere(
            (master) => master['ITEMNO'] == item['ItemOCode'],
            orElse: () => {},
          );
          return {
            ...item,
            ...masterItem,
          };
        }).toList();
      } else {
        throw Exception("Failed to fetch data from APIs");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
