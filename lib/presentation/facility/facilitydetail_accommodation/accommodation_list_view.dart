import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'accommodation_items.dart';
import 'accommodation_items_tile.dart';

class AccommodationListView extends StatelessWidget {
  final List<AccommodationItems> accommodationList = [
    AccommodationItems("Accommodation 1", "Type 1", "Address 1", 4.0, "111-1111"),
    AccommodationItems("Accommodation 2", "Type 2", "Address 2", 4.1, "222-2222"),
    AccommodationItems("Accommodation 3", "Type 3", "Address 3", 4.2, "333-3333"),
    AccommodationItems("Accommodation 4", "Type 4", "Address 4", 4.3, "444-4444"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize :MainAxisSize.min,
      children: [
        Flexible(
          child: ListView.separated(
            shrinkWrap : true,
            padding: const EdgeInsets.all(20),
            itemCount: accommodationList.length,
            itemBuilder: (context, index) {
              return AccommodationItemsTile(accommodationList[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        ),
      ],
    );
  }
}