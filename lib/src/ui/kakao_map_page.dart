import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

const String kakaoMapKey = '708757a1c33c4ef4738b67842bca34dd';

class KakaoMapPage extends StatelessWidget {
  const KakaoMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Kakao map webview test')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // KakaoMapView
          KakaoMapView(
              width: size.width,
              height: 600,
              kakaoMapKey: kakaoMapKey,
              //lat, lng 값 facility la, lo로 변경 필요
              lat: 33.450701,
              lng: 126.570667,
              showMapTypeControl: true,
              showZoomControl: true,
              markerImageURL:
                  'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
              onTapMarker: (message) async {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Marker is clicked')));

                //await _openKakaoMapScreen(context);
              }),
        ],
      ),
    );
  }
}