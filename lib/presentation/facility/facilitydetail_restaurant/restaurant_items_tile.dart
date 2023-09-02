import 'package:artroad/presentation/facility/facilitydetail_restaurant/restaurant_items.dart';
import 'package:artroad/presentation/facility/facilitydetail_restaurant/restaurant_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RestaurantItemsTile extends StatelessWidget {
  const RestaurantItemsTile({super.key, required this.restaurantItems});
  
  // late RestaurantItemsProvider _restaurantProvider;
  final List<RestaurantItems> restaurantItems;
  
  Widget _makeRestaurantItemTile(RestaurantItems restaurantItems){
    return ListTile(
      title: Row(
        children: [
          Text(
              restaurantItems.placeName.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),

          Text(
              restaurantItems.categoryName.toString(),
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF939191),
            ),
          ),
        ],
      ),
      subtitle: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    restaurantItems.roadAddressName.toString(),
                    style: const TextStyle(
                        fontSize: 14
                    ),
                  ),

                  const SizedBox(width: 5),

                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: restaurantItems.roadAddressName.toString()));
                      print('adress copy bt');
                    },
                    child: const Icon(
                      Icons.copy_rounded,
                      color: Color(0xFF176FF2),
                      size: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    '이 장소에서 ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF939191),
                    ),
                  ),
                  Text(
                    "${restaurantItems.distance}m",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            children: [
              Text(
                restaurantItems.phone.toString(),
                style: const TextStyle(
                    fontSize: 14
                ),
              ),

              const SizedBox(width: 5),

              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: restaurantItems.phone.toString()));
                  print('phone number copy bt');
                },
                child: const Icon(
                  Icons.copy_rounded,
                  color: Color(0xFF176FF2),
                  size: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
     return Expanded(
      child: Consumer<RestaurantItemsProvider>(
        builder: (context, provider, widget) {
          if (provider.restaurantItems.isNotEmpty) {
            return ListView.builder(
              itemCount: provider.restaurantItems.length,
              itemBuilder: (context, index) {
                return _makeRestaurantItemTile(provider.restaurantItems[index]);
              },
            );
          }
          // 데이터가 없으면 CircularProgressIndicator 수행(로딩)
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}