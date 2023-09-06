import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'accommodation_items.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AccommodationItemsTile extends StatelessWidget {
  AccommodationItemsTile(this._AccommodationItems);

  final AccommodationItems _AccommodationItems;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          AutoSizeText(
            _AccommodationItems.aName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          SizedBox(width: 5),
          AutoSizeText(
            _AccommodationItems.aType,
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
                    _AccommodationItems.aAdress,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: _AccommodationItems.aAdress));
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
                    '공연장으로부터 ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF939191),
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    "${_AccommodationItems.aDistance.toString()}m",
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
                _AccommodationItems.aPhoneNum,
                style: TextStyle(
                  fontSize: 14,
                ),
                maxLines: 1,
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: () {
                  Clipboard.setData(
                      ClipboardData(text: _AccommodationItems.aPhoneNum));
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
