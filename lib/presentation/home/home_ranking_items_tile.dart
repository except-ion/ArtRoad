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
            :  Image.network(
                  'http://www.kopis.or.kr/${widget._Ranking.poster}',
                  width: 200,
                  height: 270,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) {
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
                          Text(
                            'No Image',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
      ),
    )
    );
  }
}
