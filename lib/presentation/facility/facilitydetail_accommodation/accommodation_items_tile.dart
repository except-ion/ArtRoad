import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'accommodation_items.dart';

class AccommodationItemsTile extends StatelessWidget {
  const AccommodationItemsTile(this._AccommodationItems, {super.key});

  final AccommodationItems _AccommodationItems;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            _AccommodationItems.place_name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),

          Text(
            _AccommodationItems.category_name,
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
                    _AccommodationItems.road_address_name,
                    style: const TextStyle(
                        fontSize: 14
                    ),
                  ),

                  const SizedBox(width: 5),

                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: _AccommodationItems.road_address_name));
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
                  const Icon(
                    Icons.star_rounded,
                    color: Colors.yellow,
                    size: 16,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    //별점 못받아오면 어카농?
                    _AccommodationItems.distance.toString(),
                    style: const TextStyle(
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
                _AccommodationItems.phone,
                style: const TextStyle(
                    fontSize: 14
                ),
              ),

              const SizedBox(width: 5),

              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: _AccommodationItems.phone));
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