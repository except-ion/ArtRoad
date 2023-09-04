import 'package:artroad/presentation/home/home_ranking_items.dart';
import 'package:flutter/material.dart';

class RankingItemsTile extends StatefulWidget {
  const RankingItemsTile(this._RankingItems, {super.key});

  final RankingItems _RankingItems;

  @override
  State<RankingItemsTile> createState() => _RankingItemsTileState();
}

class _RankingItemsTileState extends State<RankingItemsTile> {
  bool _imageLoading = false; //network로 수정할 때 true로 바꾸기

  void _updateImageLoading(bool isLoading) {
    if (_imageLoading != isLoading) {
      setState(() {
        _imageLoading = isLoading;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('rankingItems link : ${widget._RankingItems.poster}');            
    print('https://www.kopis.or.kr/${widget._RankingItems.poster}?service=2b70191f708148f191799a7ded91b068');
    return Container(
      height: 270,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: _imageLoading
            ? const CircularProgressIndicator()
            : Image.network(
                'https://www.kopis.or.kr/${widget._RankingItems.poster}',
                errorBuilder: (context, error, stackTrace) {
                  _updateImageLoading(false);
                  print('url: https://www.kopis.or.kr/${widget._RankingItems.poster}');
                  print('error: $error');
                  return const Text('이미지 로드 실패');
                },
                width: 200,
                height: 270,
                fit: BoxFit.fitWidth,
                //아래는 network로 수정할 때 true로 바꾸기
                // loadingBuilder: (context, child, loadingProgress) {
                //   if (loadingProgress == null) {
                //     _updateImageLoading(false);
                //     return child;
                //   } else {
                //     _updateImageLoading(true);
                //     return CircularProgressIndicator();
                //   }
                // },
              ),
      ),
    );
  }
}
