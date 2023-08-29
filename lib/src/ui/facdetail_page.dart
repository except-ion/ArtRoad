import 'package:flutter/material.dart';
import 'package:artroad/src/model/facdetail.dart';
import 'package:artroad/src/provider/facdetail_provider.dart';
import 'package:provider/provider.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
const String kakaoMapKey = '708757a1c33c4ef4738b67842bca34dd';

class FacilityDetailPage extends StatelessWidget {

  late FacilityDetailProvider _facilityDetailProvider;

  FacilityDetailPage({super.key}); 

  Widget _makeFacilityDetailOne(FacilityDetail facilityDetail) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                facilityDetail.mt10id.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              
               Text(
                facilityDetail.fcltynm.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

               Text(
                facilityDetail.telno.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                facilityDetail.relateurl.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                facilityDetail.adres.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                facilityDetail.la.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                facilityDetail.lo.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _makeListView(List<FacilityDetail> facilityDetails) {
    return ListView.separated(
      itemCount: facilityDetails.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 300, 
            color: Colors.white, 
            child: _makeFacilityDetailOne(facilityDetails[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    _facilityDetailProvider = Provider.of<FacilityDetailProvider>(context, listen: false);
    _facilityDetailProvider.loadFacilityDetails(); 
    //지도 전체화면 할 때는 이 코드 살리고 width:size.width 사용
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Facility Detail Page'),
      ),
      body: Column(children: [
        Expanded(
          child: Consumer<FacilityDetailProvider>(
            builder: (context, provider, wideget) {
          if (provider.facilityDetails.isNotEmpty) {
            return _makeListView(provider.facilityDetails);
          }
          // 데이터가 없으면 CircularProgressIndicator 수행(로딩)
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ),
      KakaoMapView(
        width: 400,
        height: 400,
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
        }),
    ],)
    );
  }
}