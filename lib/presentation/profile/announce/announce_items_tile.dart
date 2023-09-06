import 'package:artroad/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'announce_items.dart';

class AnnounceItemsTile extends StatelessWidget {
  AnnounceItemsTile(this._AnnounceItems);

  final AnnounceItems _AnnounceItems;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "●  ${_AnnounceItems.title}",
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      children: [
        (_AnnounceItems.content is String) ?
        CustomImageView(
          imagePath: _AnnounceItems.content,
        )
            :
        _AnnounceItems.content,
      ],
    );
  }
}