import 'package:artroad/presentation/concert/concertdetail_screen.dart';
import 'package:artroad/src/model/ranking.dart';
import 'package:flutter/material.dart';

class RankingTile extends StatefulWidget {
  const RankingTile(this._Ranking, {super.key});

  final Ranking _Ranking;

  @override
  State<RankingTile> createState() => _RankingTileState();
}

class _RankingTileState extends State<RankingTile> {
  bool _imageLoading = false; //network로 수정할 때 true로 바꾸기

  void _updateImageLoading(bool isLoading) {
    if (_imageLoading != isLoading) {
      setState(() {
        _imageLoading = isLoading;
      });
    }
  }

  //이미지 클릭시 detailScreen으로 이동
  void _onImageTap() {
    final mt20id = widget._Ranking.mt20id;
    final prfnm = widget._Ranking.prfnm;
    final prfpd = widget._Ranking.prfpd;
    print('onImageTap: $prfpd');
    if (mt20id != null && prfnm != null && prfpd != null){
      Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ConcertDetailScreen(mt20id, prfnm, prfpd);
              },
            ),
          );
    } else{
      print('ranking is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: _onImageTap,
    child: Container(
      height: 270,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: _imageLoading
            ? const CircularProgressIndicator()
            : Image.network(
                'http://www.kopis.or.kr/${widget._Ranking.poster}',
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
      )
    );
  }
}
