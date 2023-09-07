import 'package:artroad/src/model/profile_concert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../src/model/condetail.dart';

class FavoriteItemsTile extends StatefulWidget {
  const FavoriteItemsTile(this._profileConcert, {super.key});

  final ProfileConcert _profileConcert;

  @override
  State<FavoriteItemsTile> createState() => _FavoriteItemsTileState();
}

class _FavoriteItemsTileState extends State<FavoriteItemsTile> {
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
    return InkWell(
      onTap: () {
        print('공연 상세로 이동');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 364,
          height: 80,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 5,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding:
            const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: _imageLoading
                      ? const CircularProgressIndicator()
                      : (widget._profileConcert.poster != null)
                      ? Image.network('${widget._profileConcert.poster}',
                      errorBuilder: (context, error, stackTrace) {
                        _updateImageLoading(false);
                        return const Text('이미지 로드 실패');
                      }, height: 70, fit: BoxFit.fitHeight)
                      : Container(
                      color: Colors.grey[100],
                      height: 70,
                      width: 48,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.no_photography_outlined,
                            size: 24,
                            color: Colors.grey[600],
                          ),
                          Text(
                            'No Image',
                            style: TextStyle(
                              fontSize: 7,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        bottom: 5,
                      ),
                      child: Text(
                        '${widget._profileConcert.prfnm}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 1.20,
                        ),
                      ),
                    ), //공연장 이름
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        const Icon(Icons.location_on_sharp),
                        Text(
                          widget._profileConcert.fcltynm ?? '제공되지 않은 정보입니다.', // 공연의 공연장
                          style: const TextStyle(
                            color: Color(0xFF828282),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}