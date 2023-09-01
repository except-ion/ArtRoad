import 'package:flutter/material.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/theme_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        color: Color(0xFFF4F4F4),
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
                              height: 54,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
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

                            Container(
                              height: 1,
                              width: 310,
                              color: Color(0xFFC7C7CC),
                            ),

                            Container(
                              height: 54,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
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

                            Container(
                              height: 1,
                              width: 310,
                              color: Color(0xFFC7C7CC),
                            ),

                            Container(
                              height: 54,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
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

                            Container(
                              height: 1,
                              width: 310,
                              color: Color(0xFFC7C7CC),
                            ),

                            Container(
                              height: 54,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
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

                            Container(
                              height: 1,
                              width: 310,
                              color: Color(0xFFC7C7CC),
                            ),

                            Container(
                              height: 54,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
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

                            Container(
                              height: 1,
                              width: 310,
                              color: Color(0xFFC7C7CC),
                            ),

                            Container(
                              height: 54,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
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
