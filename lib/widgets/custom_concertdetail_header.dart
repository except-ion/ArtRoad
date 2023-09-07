import 'package:artroad/src/provider/condetail_provider.dart';
import 'package:flutter/material.dart';
import 'package:artroad/presentation/services/firebase_firestore_services.dart';
import 'package:provider/provider.dart';
import 'package:artroad/src/provider/user_provider.dart';

class CustomConcertDetailHeader extends StatefulWidget {
  final String concertName;
  final bool hasLiked;
  final bool isDetail;
  final String concertId;

  const CustomConcertDetailHeader(
      {super.key,
      required this.concertName,
      required this.concertId,
      this.hasLiked = false,
      this.isDetail = false});

  @override
  _CustomConcertDetailHeaderState createState() =>
      _CustomConcertDetailHeaderState();
}

class _CustomConcertDetailHeaderState extends State<CustomConcertDetailHeader> {
  final FirebaseStoreService _firebaseStoreService = FirebaseStoreService();
  late String userId;
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userId = userProvider.firebaseUserId!;
    // 초기 좋아요 상태를 가져오는 메서드 호출
    getInitialLikeStatus(userId, widget.concertId).then((liked){
      setState(() {
        isLiked = liked;
      });
    });
  }

  // 좋아요 상태를 가져오는 비동기 메서드
  Future<bool> getInitialLikeStatus(String userId, String concertId) async {
    final liked = await _firebaseStoreService.getLikedStatus(userId, concertId);
    return liked;
  }

  DateTime stringToDatetime(String date) {
    List<String> dateParts = date.split('.');
    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);

    DateTime datetime = DateTime(year, month, day);
    return datetime;
  }

  //좋아요 클릭 유무
  void toggleLiked(String? userId) async {
    final concertDetailProvider =
        Provider.of<ConcertDetailProvider>(context, listen: false);
    final concertDetailList = concertDetailProvider.concertDetails;

    if (concertDetailList.isNotEmpty) {
      final concertDetail = concertDetailList[0];
      DateTime startDate = stringToDatetime(concertDetail.prfpdfrom!);
      DateTime endDate = stringToDatetime(concertDetail.prfpdto!);
      
      setState((){
          isLiked = !isLiked;
          print('in setState: $isLiked');
        }
      );
      await _firebaseStoreService.updateLikeStatus(
            userId!,
            concertDetail.mt10id ?? '',  
            concertDetail.mt20id ?? '', //공연시설id
            concertDetail.prfnm ?? '정보없음', //공연명
            concertDetail.fcltynm ?? '정보없음', //공영시설명
            concertDetail.poster ?? '',
            startDate,
            endDate,
            !isLiked
            );

    }
  }

  @override
  Widget build(BuildContext context) {
          return Container(
            child: Stack(
              children: [
                widget.isDetail
                    ? Image.asset('assets/images/header_dark.png')
                    : Image.asset('assets/images/header_light.png'),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.scale(
                        alignment: Alignment.center,
                        scale: 1.5,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: widget.isDetail
                                ? Colors.white
                                : const Color(0xFF00233D),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      if (widget.hasLiked)
                        Transform.scale(
                          scale: 1.5,
                          child: IconButton(
                            icon: isLiked == true
                                ? Icon(
                                    //좋아요 클릭 전
                                    Icons.favorite_border,
                                    color: widget.isDetail
                                        ? Colors.white
                                        : const Color(0xFF00233D),
                                  )
                                : const Icon(
                                    //좋아요 클릭 후
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                            onPressed: () => toggleLiked(userId),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
  }

