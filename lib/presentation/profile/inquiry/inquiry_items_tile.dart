import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_image_view.dart';
import 'inquiry_items.dart';

class InquiryItemsTile extends StatelessWidget {
  InquiryItemsTile(this._InquiryItems);

  final InquiryItems _InquiryItems;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "●  ${_InquiryItems.title}",
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      children: [
        (_InquiryItems.content is String) ?
        CustomImageView(
          imagePath: _InquiryItems.content,
        )
            :
        _InquiryItems.content,
      ],
    );
  }
}