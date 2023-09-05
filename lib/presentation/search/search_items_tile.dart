import 'package:flutter/material.dart';

import '../../src/model/condetail.dart';

class SearchItemsTile extends StatefulWidget {
  SearchItemsTile(this.item);

  final dynamic
      item; // FacilityItems 또는 ConcertDetail 모두 받을 수 있도록 동적(dynamic) 타입으로 선언

  @override
  State<SearchItemsTile> createState() => _SearchItemsTileState();
}

class _SearchItemsTileState extends State<SearchItemsTile> {
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
                      : Image.asset('${widget.item.poster}',
                          errorBuilder: (context, error, stackTrace) {
                          _updateImageLoading(false);
                          return Text('이미지 로드 실패');
                        }, height: 70, fit: BoxFit.fitHeight),
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
                    child: Text(
                      widget.item is ConcertDetail
                          ? '${widget.item.prfnm}' // 공연 이름
                          : '${widget.item.fcltynm}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 1.20,
                      ),
                    ),
                  ), //공연장 이름
                  Row(
                    children: [
                      if (widget.item is ConcertDetail)
                        SizedBox(
                          width: 10,
                        ),
                      Icon(Icons.location_on_sharp),
                      Text(
                        widget.item is ConcertDetail
                            ? '${widget.item.fcltynm}' // 공연의 공연장
                            : '${widget.item.adres}',
                        style: TextStyle(
                          color: Color(0xFF828282),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ), //공연장 주소
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
