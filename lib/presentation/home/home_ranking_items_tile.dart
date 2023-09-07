import 'package:artroad/presentation/concert/concertdetail_screen.dart';
import 'package:artroad/src/model/ranking.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
    if (mt20id != null && prfnm != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ConcertDetailScreen(mt20id, prfnm);
          },
        ),
      );
    } else {
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
          child: Stack(
            alignment: Alignment.center,
             children: [
              Image.network(
                'http://www.kopis.or.kr/${widget._Ranking.poster}',
                width: 200,
                height: 270,
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    _imageLoading = false; // 이미지 로딩 완료
                    return child;
                  } else {
                    _imageLoading = true; // 이미지 로딩 중
                    return const CircularProgressIndicator();
                  }
                },
                errorBuilder:
                    (context, error, stackTrace) {
                  _updateImageLoading(false);
                  return Container(
                    color: Colors.grey[100],
                    height: 270,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.no_photography_outlined,
                          size: 38,
                          color: Colors.grey[600],
                        ),
                        AutoSizeText(
                          'No Image',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  );
                },
              ),
              if (_imageLoading)
                const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
