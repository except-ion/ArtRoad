import 'package:artroad/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/theme_helper.dart';
import '../login/login_screen.dart';
import 'announce/announce_list_view.dart';
import 'artroadinfo/artroad_info.dart';
import 'favorite/favorite_screen.dart';
import 'inquiry/inquiry_list_view.dart';
import 'myinfo/my_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // 친구에게 공유하기 Dialog
  void _showShareDialog() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        print(MediaQuery.of(context).viewInsets.bottom);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter bottomState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 35, right: 35, bottom: 20),
                child: Container(
                  //키보드 창 크기만큼 컨텐츠 올리기
                  // padding: EdgeInsets.only(
                  //     bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // --- 구현부 ---
                              Text(
                                '친구에게 공유하기',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              SizedBox(height: 15),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgAppLogo,
                                    width: 40,
                                    height: 40,
                                  ),

                                  SizedBox(width: 5),

                                  Text(
                                    '당신의 문화생활을 더욱 편리하게, ArtRoad!',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 15),

                              Divider(),

                              SizedBox(height: 15),

                              InkWell(
                                onTap: () {
                                  // 텍스트 복사 로직 구현
                                  Clipboard.setData(ClipboardData(text: '앱 다운로드 링크'));
                                  Fluttertoast.showToast(
                                    msg: '링크가 복사되었습니다.',
                                    toastLength: Toast.LENGTH_SHORT,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.link_rounded,
                                      size: 25,
                                      color: Color(0xFFC7C7CC),
                                    ),

                                    SizedBox(width: 5),

                                    Text(
                                      '링크 복사하기',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 10),

                              InkWell(
                                onTap: () {
                                  print('Kakao Share bt clicked');
                                },
                                child: Row(
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.iconKakao,
                                      width: 25,
                                      height: 25,
                                    ),

                                    SizedBox(width: 5),

                                    Text(
                                      '카카오톡으로 공유하기',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )
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
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        color: Color(0xFFF4F4F4),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: getPadding(top: 30, left: 30),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.transparent, Colors.white], // 그라데이션 색상 설정
                      stops: [0.0, 1.0], // 그라데이션 위치 설정
                    ).createShader(bounds);
                  },
                  child: Text(
                    "ArtRoad",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontSize: 30.0, // 폰트 사이즈 조절
                      fontWeight: FontWeight.normal, // 폰트 굵기 조절
                      color: Colors.grey, // 텍스트 색상 설정 (그라데이션에 의해 가려지므로 원하는 색상 사용 가능)
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 25),

            Container(
              width: 350,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFFF0FAFE),
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Padding(
                padding: getPadding(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '익셉션',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyInfo(), // 이동할 페이지 위젯
                              ),
                            );
                            print('profile setting bt clicked');
                          },
                          child: Icon(
                            Icons.settings,
                            size: 23,
                            color: Color(0xFF949191),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'kmu.sw.exception@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF949191),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ),

            SizedBox(height: 25),

            Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Padding(
                padding: getPadding(top: 10, bottom: 10, left: 20, right: 20),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                              height: 42,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FavoriteScreen(), // 이동할 페이지 위젯
                                    ),
                                  );
                                  print('Move to 관심공연 목록');
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 23,
                                      color: Color(0xFF176FF2),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      '관심공연 목록',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Divider(),

                            Container(
                              height: 42,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  _showShareDialog();
                                  print('친구에게 공유하기  Dialog');
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.share_rounded,
                                      size: 23,
                                      color: Color(0xFF176FF2),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      '친구에게 공유하기',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Divider(),

                            Container(
                              height: 42,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AnnounceListView(), // 이동할 페이지 위젯
                                    ),
                                  );
                                  print('Move to 공지사항');
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.speaker_notes_rounded,
                                      size: 23,
                                      color: Color(0xFF176FF2),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      '공지사항',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Divider(),

                            Container(
                              height: 42,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InquiryListView(), // 이동할 페이지 위젯
                                    ),
                                  );
                                  print('Move to 고객센터/ 자주 묻는 문의사항');
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.headset_mic_rounded,
                                      size: 23,
                                      color: Color(0xFF176FF2),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      '고객센터/ 자주 묻는 문의사항',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Divider(),

                            Container(
                              height: 42,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ArtRoadInfo(), // 이동할 페이지 위젯
                                    ),
                                  );
                                  print('Move to About ArtRoad');
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.info_outline_rounded,
                                      size: 23,
                                      color: Color(0xFF176FF2),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      'About ArtRoad',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Divider(),

                            Container(
                              height: 42,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Fluttertoast.showToast(
                                    msg: '로그아웃 되었습니다.',
                                    toastLength: Toast.LENGTH_SHORT,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );

                                  Navigator.of(context).popUntil((route) => route.isFirst);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(), // 이동할 페이지 위젯
                                    ),
                                  );
                                  print('logout bt clicked');
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.logout_rounded,
                                      size: 23,
                                      color: Color(0xFF176FF2),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      '로그아웃',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
