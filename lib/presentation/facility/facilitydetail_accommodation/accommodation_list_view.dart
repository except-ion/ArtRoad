import 'package:flutter/material.dart';
import 'accommodation_items.dart';
import 'accommodation_items_tile.dart';

class AccommodationListView extends StatelessWidget {
  final List<AccommodationItems> accommodationList = [
    AccommodationItems(
        "Accommodation 1", "Type 1", "Address 1", 100, "111-1111"),
    AccommodationItems(
        "Accommodation 2", "Type 2", "Address 2", 200, "222-2222"),
    AccommodationItems(
        "Accommodation 3", "Type 3", "Address 3", 300, "333-3333"),
    AccommodationItems(
        "Accommodation 4", "Type 4", "Address 4", 400, "444-4444"),
    AccommodationItems(
        "Accommodation 1", "Type 1", "Address 1", 100, "111-1111"),
    AccommodationItems(
        "Accommodation 2", "Type 2", "Address 2", 200, "222-2222"),
    AccommodationItems(
        "Accommodation 3", "Type 3", "Address 3", 300, "333-3333"),
    AccommodationItems(
        "Accommodation 4", "Type 4", "Address 4", 400, "444-4444"),
    AccommodationItems(
        "Accommodation 1", "Type 1", "Address 1", 100, "111-1111"),
    AccommodationItems(
        "Accommodation 2", "Type 2", "Address 2", 200, "222-2222"),
    AccommodationItems(
        "Accommodation 3", "Type 3", "Address 3", 300, "333-3333"),
    AccommodationItems(
        "Accommodation 4", "Type 4", "Address 4", 400, "444-4444"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 20),
            itemCount: accommodationList.length,
            itemBuilder: (context, index) {
              return FittedBox(
                  child: AccommodationItemsTile(accommodationList[index]));
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
