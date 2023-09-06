import 'package:flutter/material.dart';
import '../../src/model/condetail.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SearchItemsTile extends StatefulWidget {
  SearchItemsTile(this.item);

  final dynamic
      item; // FacilityItems 또는 ConcertDetail 모두 받을 수 있도록 동적(dynamic) 타입으로 선언

  @override
  State<SearchItemsTile> createState() => _SearchItemsTileState();
}

class _SearchItemsTileState extends State<SearchItemsTile> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 364,
        height: 80,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: [
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
              if (widget.item is ConcertDetail)
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: _imageLoading
                      ? CircularProgressIndicator()
                      : (widget.item is ConcertDetail &&
                              widget.item.poster != null)
                          ? Image.asset(
                              '${widget.item.poster}',
                              errorBuilder: (context, error, stackTrace) {
                                _updateImageLoading(false);
                                return Text('이미지 로드 실패');
                              },
                              height: 70,
                              fit: BoxFit.fitHeight,
                            )
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
                              ),
                            ),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: widget.item is ConcertDetail ? 15 : 5,
                      bottom: 5,
                    ),
                    child: AutoSizeText(
                      widget.item is ConcertDetail
                          ? widget.item.prfnm ?? '제공된 정보가 없습니다.' // 공연 이름
                          : widget.item.fcltynm ?? '제공된 정보가 없습니다.', // 공연장 이름
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 1.20,
                      ),
                      maxLines: 1,
                    ),
                  ), //공연장 이름
                  Row(
                    children: [
                      if (widget.item is ConcertDetail)
                        SizedBox(
                          width: 10,
                        ),
                      Icon(Icons.location_on_sharp),
                      AutoSizeText(
                        widget.item is ConcertDetail
                            ? widget.item.fcltynm ?? '제공되지 않은 정보입니다.' // 공연의 공연장
                            : widget.item.adres ?? '제공되지 않은 정보입니다.', // 공연장 주소
                        style: TextStyle(
                          color: Color(0xFF828282),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
