import 'package:artroad/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_header.dart';
import 'announce_items.dart';
import 'announce_items_tile.dart';

class AnnounceListView extends StatelessWidget{
  final List<AnnounceItems> announceList = [
    AnnounceItems("Announce Test 1", ImageConstant.imgAnnounce1),
    AnnounceItems("Announce Test 2", ImageConstant.imgAnnounce1),
    AnnounceItems("Announce Test 3", ImageConstant.imgAnnounce1),
    AnnounceItems("Announce Test 4", ImageConstant.imgAnnounce1),
    AnnounceItems("Announce Test 5", ImageConstant.imgAnnounce1),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomHeader(
            name: '공지사항',
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: announceList.length,
            itemBuilder: (context, index) {
              return AnnounceItemsTile(announceList[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        ],
      ),
    );
  }
}