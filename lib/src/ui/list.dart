import 'package:artroad/src/model/concert.dart';
import 'package:artroad/src/provider/concert_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatelessWidget {
  ListWidget({Key? key}) : super(key: key);

  late ConcertProvider _concertProvider; 

  Widget _makeConcertOne(Concert concert) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 충전소 주소
              Text(
                concert.mt20id.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              // 충전기 타입
              Text(
                concert.prfstate.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              
               Text(
                concert.prfnm.toString(),
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

  // 리스트 뷰
  Widget _makeListView(List<Concert> evs) {
    return ListView.separated(
      itemCount: evs.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 300, color: Colors.white, child: _makeConcertOne(evs[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of를 통해 데이터를 접근한다. builder만을 업데이트 하기 위해 listen은 false로 한다.
    _concertProvider = Provider.of<ConcertProvider>(context, listen: false);
    _concertProvider.loadConcerts(); 

    return Scaffold(
        appBar: AppBar(
          title: const Text("Concert Provider"),
        ),
        // Consumer를 통해 데이터를 접근
        body: Consumer<ConcertProvider>(builder: (context, provider, wideget) {
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