import 'package:artroad/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_header.dart';

class ArtRoadInfo extends StatelessWidget {
  const ArtRoadInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomHeader(
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
