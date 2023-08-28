import 'package:flutter/material.dart';
import 'package:artroad/src/provider/search/facility_provider.dart';
import 'package:artroad/src/model/facility.dart';
import 'package:provider/provider.dart';

class FacilityPage extends StatelessWidget{
  late FacilityProvider _faciltyProvider;

  FacilityPage({super.key});

  Widget _makeFacilityOne(Facility facility){
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                facility.mt10id.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              Text(
                facility.fcltynm.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                facility.adres.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ))
      ],
    );
  }

  Widget _makeListView(List<Facility> facilities) {
    return ListView.separated(
      itemCount: facilities.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 300, 
            color: Colors.white, 
            child: _makeFacilityOne(facilities[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _faciltyProvider = Provider.of<FacilityProvider>(context, listen: false);
    _faciltyProvider.loadFacilities();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Facility Page'),
      ),
      body: Consumer<FacilityProvider>(builder: (context, provider, wideget) {
          if (provider.concerts.isNotEmpty) {
            return _makeListView(provider.concerts);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}