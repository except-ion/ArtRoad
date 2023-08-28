import 'package:flutter/material.dart';
import 'package:artroad/src/model/facdetail.dart';
import 'package:artroad/src/provider/facdetail_provider.dart';
import 'package:provider/provider.dart';

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
        ))
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Facility Detail Page'),
      ),
      body: Consumer<FacilityDetailProvider>(builder: (context, provider, wideget) {
          if (provider.facilityDetails.isNotEmpty) {
            return _makeListView(provider.facilityDetails);
          }

          // 데이터가 없으면 CircularProgressIndicator 수행(로딩)
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}