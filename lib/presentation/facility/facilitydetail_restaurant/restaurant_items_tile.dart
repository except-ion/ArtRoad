import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'restaurant_items.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RestaurantItemsTile extends StatelessWidget {
  const RestaurantItemsTile(this._RestaurantItems, {super.key});

  final RestaurantItems _RestaurantItems;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            _RestaurantItems.place_name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 3),
          Text(
            _RestaurantItems.category_name,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF939191),
            ),
            maxLines: 2,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _RestaurantItems.road_address_name != ''
                  ? Row(
                      children: [
                        AutoSizeText(
                          _RestaurantItems.road_address_name.length <= 15
                              ? _RestaurantItems.road_address_name
                              : '${_RestaurantItems.road_address_name.substring(0, 15)}...',
                          style: const TextStyle(fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                          },
                          child: const Icon(
                            Icons.copy_rounded,
                            color: Color(0xFF176FF2),
                            size: 16,
                          ),
                        ),
                      ],
                    )
                  : const Text(
                      '정보없음',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.left,
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
                    "${_RestaurantItems.distance.toString()}m",
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
          const SizedBox(
            height: 3,
          ),
          _RestaurantItems.phone != ''
              ? Row(
                  children: [
                    AutoSizeText(
                      _RestaurantItems.phone,
                      style: const TextStyle(fontSize: 14),
                      maxLines: 1,
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: _RestaurantItems.phone));
                        Fluttertoast.showToast(
                          msg: '전화번호가 복사되었습니다.',
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: const Icon(
                        Icons.copy_rounded,
                        color: Color(0xFF176FF2),
                        size: 16,
                      ),
                    ),
                  ],
                )
              : const Text(
                  '정보없음',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.left,
                ),
        ],
      ),
    );
  }
}
