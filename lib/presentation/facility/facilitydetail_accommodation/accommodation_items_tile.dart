import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'accommodation_items.dart';

class AccommodationItemsTile extends StatelessWidget {
  AccommodationItemsTile(this._AccommodationItems);

  final AccommodationItems _AccommodationItems;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            _AccommodationItems.aName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),

          Text(
            _AccommodationItems.aType,
            style: TextStyle(
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
                    _AccommodationItems.aAdress,
                    style: TextStyle(
                        fontSize: 14
                    ),
                  ),

                  SizedBox(width: 5),

                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: _AccommodationItems.aAdress));
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
                  Icon(
                    Icons.star_rounded,
                    color: Colors.yellow,
                    size: 16,
                  ),
                  SizedBox(width: 2),
                  Text(
                    _AccommodationItems.aReview.toString(),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            children: [
              Text(
                _AccommodationItems.aPhoneNum,
                style: TextStyle(
                    fontSize: 14
                ),
              ),

              SizedBox(width: 5),

              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: _AccommodationItems.aPhoneNum));
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