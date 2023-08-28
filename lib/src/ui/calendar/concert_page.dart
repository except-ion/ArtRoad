import 'package:flutter/material.dart';
import 'package:artroad/src/model/concert.dart';
import 'package:artroad/src/provider/calendar/concert_provider.dart';
import 'package:provider/provider.dart';

class ConcertCalendarPage extends StatelessWidget {

  late ConcertCalendarProvider _concertProvider;

  ConcertCalendarPage({super.key}); 

  Widget _makeConcertOne(Concert concert) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                concert.mt20id.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              
               Text(
                concert.prfnm.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

               Text(
                concert.fcltynm.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
               Text(
                concert.prfpdfrom.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
               Text(
                concert.prfpdto.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ))
      ],
    );
  }

  Widget _makeListView(List<Concert> concerts) {
    return ListView.separated(
      itemCount: concerts.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 300, 
            color: Colors.white, 
            child: _makeConcertOne(concerts[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    _concertProvider = Provider.of<ConcertCalendarProvider>(context, listen: false);
    _concertProvider.loadConcerts(); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Concert calendar Page'),
      ),
      body: Consumer<ConcertCalendarProvider>(builder: (context, provider, wideget) {
          // 데이터가 있으면 _makeListView에 데이터를 전달
          if (provider.concerts.isNotEmpty) {
            return _makeListView(provider.concerts);
          }

          // 데이터가 없으면 CircularProgressIndicator 수행(로딩)
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}