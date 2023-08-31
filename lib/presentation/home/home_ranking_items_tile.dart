import 'package:artroad/presentation/home/home_ranking_items.dart';
import 'package:flutter/material.dart';

class RankingItemsTile extends StatelessWidget {
  RankingItemsTile(this._RankingItems);

  final RankingItems _RankingItems;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Text('${rankingList[index].poster}'),
          Container(
            height: 10,
            alignment: Alignment.center,
            color: Colors.yellow,
            child: Text(
              '${_RankingItems.poster}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.lightGreenAccent,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    '${_RankingItems.rnum}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}
