import 'package:flutter/material.dart';
import '../models/item_model.dart';

class DataView extends StatelessWidget {
  final List<ItemModel> items;

  const DataView(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final isLowQty =
            int.tryParse(item.qty!) != null && int.parse(item.qty!) < 5;

        return Card(
          color: isLowQty ? Colors.red[100] : Colors.white,
          child: ListTile(
            title: Text(item.name ?? "Unknown"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Quantity: ${item.qty}"),
                Text("Barcode: ${item.barcode}"),
                Text("Category ID: ${item.categoryId}"),
                Text("Min Price: ${item.minPrice}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
