import 'package:artroad/presentation/facility/facilitydetail_restaurant/restaurant_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RestaurantItemsTile extends StatelessWidget {
  const RestaurantItemsTile(this._RestaurantItems, {super.key});

  final RestaurantItems _RestaurantItems;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          AutoSizeText(
            _RestaurantItems.place_name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          const SizedBox(width: 5),
          AutoSizeText(
            _RestaurantItems.category_name,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF939191),
            ),
            maxLines: 1,
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
                  AutoSizeText(
                    _RestaurantItems.road_address_name,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 1,
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(
                          text: _RestaurantItems.road_address_name));
                      Fluttertoast.showToast(
                        msg: '주소가 복사되었습니다.',
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
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
                  const AutoSizeText(
                    '공연장으로부터 ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF939191),
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    "${_RestaurantItems.phone.toString()}m",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.orange,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              AutoSizeText(
                _RestaurantItems.distance,
                style: const TextStyle(fontSize: 14),
                maxLines: 1,
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {
                  Clipboard.setData(
                      ClipboardData(text: _RestaurantItems.distance));
                  Fluttertoast.showToast(
                    msg: '전화번호가 복사되었습니다.',
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
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
