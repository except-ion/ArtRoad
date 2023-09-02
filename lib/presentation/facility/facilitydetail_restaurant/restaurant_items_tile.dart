import 'package:artroad/presentation/facility/facilitydetail_restaurant/restaurant_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RestaurantItemsTile extends StatelessWidget {
  const RestaurantItemsTile(this._RestaurantItems, {super.key});

  final RestaurantItems _RestaurantItems;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
              _RestaurantItems.rName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),

          Text(
              _RestaurantItems.rType,
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
                    _RestaurantItems.rAdress,
                    style: const TextStyle(
                        fontSize: 14
                    ),
                  ),

                  const SizedBox(width: 5),

                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: _RestaurantItems.rAdress));
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
                    "${_RestaurantItems.rDistance.toString()}m",
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
                _RestaurantItems.rPhoneNum,
                style: const TextStyle(
                    fontSize: 14
                ),
              ),

              const SizedBox(width: 5),

              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: _RestaurantItems.rPhoneNum));
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
}