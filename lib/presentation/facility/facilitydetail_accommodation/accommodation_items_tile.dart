import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'accommodation_items.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AccommodationItemsTile extends StatefulWidget {
  const AccommodationItemsTile(this._AccommodationItems, {super.key});

  final AccommodationItems _AccommodationItems;

  @override
  State<AccommodationItemsTile> createState() => _AccommodationItemsTileState();
}

class _AccommodationItemsTileState extends State<AccommodationItemsTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            widget._AccommodationItems.place_name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 3),
          AutoSizeText(
            widget._AccommodationItems.category_name,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF939191),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
              widget._AccommodationItems.road_address_name != ''
                  ? Row(
                      children: [
                        AutoSizeText(
                          widget._AccommodationItems.road_address_name.length <=
                                  15
                              ? widget._AccommodationItems.road_address_name
                              : '${widget._AccommodationItems.road_address_name.substring(0, 15)}...',
                          style: const TextStyle(fontSize: 14),
                          maxLines: 1,
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: widget
                                    ._AccommodationItems.road_address_name));
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
                    "${widget._AccommodationItems.distance.toString()}m",
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
          widget._AccommodationItems.phone != ''
              ? Row(
                  children: [
                    AutoSizeText(
                      widget._AccommodationItems.phone,
                      style: const TextStyle(fontSize: 14),
                      maxLines: 1,
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                            text: widget._AccommodationItems.phone));
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
