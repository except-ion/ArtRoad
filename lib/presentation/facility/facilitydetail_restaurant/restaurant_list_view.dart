import 'package:artroad/presentation/facility/facilitydetail_restaurant/restaurant_provider.dart';
import 'package:artroad/presentation/facility/facilitydetail_restaurant/restaurant_items_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class RestaurantListView extends StatefulWidget {
  const RestaurantListView({super.key});

  // final List<RestaurantItems> restaurantList = [
  //   RestaurantItems("Restaurant 1", "Type 1", "Address 1", 100, "111-1111"),
  //   RestaurantItems("Restaurant 2", "Type 2", "Address 2", 200, "222-2222"),
  //   RestaurantItems("Restaurant 3", "Type 3", "Address 3", 300, "333-3333"),
  //   RestaurantItems("Restaurant 4", "Type 4", "Address 4", 300, "444-4444"),
  // ];
  @override
  _RestaurantListViewState createState() => _RestaurantListViewState();
}

class _RestaurantListViewState extends State<RestaurantListView>{
  @override
  void initState() {
    super.initState();
    final restaurantItemsProvider = Provider.of<RestaurantItemsProvider>(context, listen: false);
    restaurantItemsProvider.loadKakaoRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantItemsProvider = Provider.of<RestaurantItemsProvider>(context);
    final restaurantList = restaurantItemsProvider.restaurantItems;

    return Column(
      mainAxisSize :MainAxisSize.min,
      children: [
        Flexible(
          child: ListView.separated(
            shrinkWrap : true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            itemCount: restaurantList.length,
            itemBuilder: (context, index) {
              return RestaurantItemsTile(restaurantItems: restaurantList);
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