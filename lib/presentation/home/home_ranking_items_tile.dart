import 'package:artroad/presentation/home/home_ranking_items.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
    return Container(
      height: 270,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: _imageLoading
            ? const CircularProgressIndicator()
            : Image.network(
                'http://www.kopis.or.kr/${widget._RankingItems.poster}',
                errorBuilder: (context, error, stackTrace) {
                  _updateImageLoading(false);
                  print('error: $error');
                  return const Text('이미지 로드 실패');
                },
                width: 200,
                height: 270,
                fit: BoxFit.cover,
                //아래는 network로 수정할 때 true로 바꾸기
                // loadingBuilder: (context, child, loadingProgress) {
                //   if (loadingProgress == null) {
                //     _updateImageLoading(true);
                //     return child;
                //   } else {
                //     _updateImageLoading(true);
                //     return const CircularProgressIndicator();
                //   }
                // },
              ),
      ),
    );
  }
}
