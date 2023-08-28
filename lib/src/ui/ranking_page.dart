import 'package:flutter/material.dart';
import 'package:artroad/src/model/ranking.dart';
import 'package:artroad/src/provider/ranking_provider.dart';
import 'package:provider/provider.dart';

class RankingPage extends StatelessWidget {

  late RankingProvider _rankingProvider;

  RankingPage({super.key}); 

  Widget _makeRankingOne(Ranking ranking) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                ranking.mt20id.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              
               Text(
                ranking.cate.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

               Text(
                ranking.poster.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                ranking.rnum.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ))
      ],
    );
  }

  Widget _makeListView(List<Ranking> rankings) {
    return ListView.separated(
      itemCount: rankings.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 300, 
            color: Colors.white, 
            child: _makeRankingOne(rankings[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    _rankingProvider = Provider.of<RankingProvider>(context, listen: false);
    _rankingProvider.loadRankings(); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking Page'),
      ),
      body: Consumer<RankingProvider>(builder: (context, provider, wideget) {
          // 데이터가 있으면 _makeListView에 데이터를 전달
          if (provider.rankings.isNotEmpty) {
            return _makeListView(provider.rankings);
          }

          // 데이터가 없으면 CircularProgressIndicator 수행(로딩)
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}