import 'package:falcons/consts/colors.dart';
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

        return Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 185, 82, 82).withOpacity(0.5),
                  spreadRadius: 5, // مدى الانتشار
                  blurRadius: 7, // مدى التشويش
                  offset: const Offset(0, 3), // الإزاحة
                ),
              ],
              color: isLowQty ? Colors.red : Colors.white60,
              border: Border.all(
                width: 3,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(40)),
          child: Column(
            children: [
              Center(
                child: Text(
                  item.name ?? "Unknown",
                  style: TextStyle(
                      color:
                          isLowQty ? Colors.white : CustomColors.primaryColor,
                      fontSize: 35,
                      fontFamily: "Arslan"),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fetureTitle("Quantity : ", isLowQty),
                        fetureTitle("Barcode : ", isLowQty),
                        fetureTitle("Category ID : ", isLowQty),
                        fetureTitle("Min Pric : ", isLowQty)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        featureSub(item.qty),
                        featureSub(item.barcode ?? ""),
                        featureSub(item.categoryId ?? ""),
                        featureSub(item.minPrice ?? "")
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Text featureSub(String? sub) {
    return Text(
      sub!,
      style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
    );
  }

  Text fetureTitle(String title, bool isLowQty) {
    return Text(
      title,
      style: TextStyle(
          color: isLowQty ? Colors.white : CustomColors.primaryColor,
          fontSize: 20,
          fontFamily: "archivetempDay"),
    );
  }
}
