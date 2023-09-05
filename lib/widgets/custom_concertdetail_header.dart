import 'package:flutter/material.dart';
import 'package:artroad/presentation/services/firebase_firestore_services.dart';
import 'package:provider/provider.dart';
import 'package:artroad/src/provider/user_provider.dart';

class CustomConcertDetailHeader extends StatefulWidget {
  final String concertName;
  final bool hasLiked;
  final bool isDetail;
  final String concertId;
  

  const CustomConcertDetailHeader({
    super.key, 
    required this.concertName,
    required this.concertId,
    this.hasLiked = false,
    this.isDetail = false
  });
  
  @override
  _CustomConcertDetailHeaderState createState() => _CustomConcertDetailHeaderState();
}

class _CustomConcertDetailHeaderState extends State<CustomConcertDetailHeader> {
  final FirebaseStoreService _firebaseStoreService = FirebaseStoreService();
  late bool isLiked; 

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context);
    String? userId = userProvider.firebaseUserId;
  }

  //좋아요 클릭 유무
  void toggleLiked(String? userId) {
    setState(() async {
      isLiked = !isLiked;
      await _firebaseStoreService.updateLikeStatus(userId!, widget.concertId, widget.concertName, isLiked);
    });
  }

  Future<bool> getInitialLikeStatus(String userId, String concertId) async {
    return await _firebaseStoreService.getLikedConcert(userId, concertId);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
     return FutureBuilder<bool>(
      future: getInitialLikeStatus(userProvider.firebaseUserId!, widget.concertId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); 
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          isLiked = snapshot.data ?? true; 
        }
      return Container(
        child: Stack(
          children: [
            widget.isDetail
                ? Image.asset('assets/images/header_dark.png')
                : Image.asset('assets/images/header_light.png'),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Transform.scale(
                      scale: 1.5,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color:
                              widget.isDetail ? Colors.white : const Color(0xFF00233D),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 14,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.concertName,
                        style: TextStyle(
                          color: widget.isDetail ? Colors.white : Colors.black,
                          fontSize: 21,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if (widget.hasLiked)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Transform.scale(
                        scale: 1.5,
                        child: IconButton(
                          icon: isLiked
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
                          onPressed: () => toggleLiked(userProvider.firebaseUserId!),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    ); 
  }
}
