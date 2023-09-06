import 'package:artroad/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_header.dart';

class ArtRoadInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomHeader(
            name: 'About ArtRoad',
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArtRoad,
          ),
        ],
      ),
    );
  }
}
