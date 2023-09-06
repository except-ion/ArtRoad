import 'package:artroad/presentation/facility/facilitydetail_restaurant/restaurant_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RestaurantItemsTile extends StatelessWidget {
  RestaurantItemsTile(this._RestaurantItems);

  final RestaurantItems _RestaurantItems;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          AutoSizeText(
            _RestaurantItems.rName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          SizedBox(width: 5),
          AutoSizeText(
            _RestaurantItems.rType,
            style: TextStyle(
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
                    _RestaurantItems.rAdress,
                    style: TextStyle(fontSize: 14),
                    maxLines: 1,
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: _RestaurantItems.rAdress));
                      Fluttertoast.showToast(
                        msg: '주소가 복사되었습니다.',
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      print('adress copy bt');
                    },
                    child: Icon(
                      Icons.copy_rounded,
                      color: Color(0xFF176FF2),
                      size: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  AutoSizeText(
                    '이 장소에서 ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF939191),
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    "${_RestaurantItems.rDistance.toString()}m",
                    style: TextStyle(
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
                _RestaurantItems.rPhoneNum,
                style: TextStyle(fontSize: 14),
                maxLines: 1,
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: () {
                  Clipboard.setData(
                      ClipboardData(text: _RestaurantItems.rPhoneNum));
                  Fluttertoast.showToast(
                    msg: '전화번호가 복사되었습니다.',
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  print('phone number copy bt');
                },
                child: Icon(
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
