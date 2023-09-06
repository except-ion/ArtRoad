import 'package:flutter/material.dart';
import '../../src/model/ranking.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RankingTile extends StatefulWidget {
  RankingTile(this._Ranking);

  final Ranking _Ranking;

  @override
  State<RankingTile> createState() => _RankingTileState();
}

class _RankingTileState extends State<RankingTile> {
  bool _imageLoading = false; // network로 수정할 때 true로 바꾸기

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
            ? CircularProgressIndicator()
            : (widget._Ranking.poster != null)
                ? Image.asset(
                    '${widget._Ranking.poster}',
                    errorBuilder: (context, error, stackTrace) {
                      _updateImageLoading(false);
                      return Text('이미지 로드 실패');
                    },
                    width: 200,
                    height: 270,
                    fit: BoxFit.fitWidth,
                  )
                : Container(
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
                  ),
      ),
    );
  }
}
