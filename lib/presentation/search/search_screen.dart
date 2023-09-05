import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../src/model/condetail.dart';
import '../../src/model/facdetail.dart';
import '../../theme/theme_helper.dart';
import 'search_items_tile.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String selectedCategory = '공연';

  final List<ConcertDetail> concertList = [
    ConcertDetail(
        mt20id: 'PF132236',
        prfnm: '멤',
        poster: null,
        prfpdfrom: '2023.07.12',
        prfpdto: '2023.09.03',
        prfruntime: '165분',
        prfage: '14세 이상 관람가',
        genrenm: '뮤지컬',
        fcltynm: null,
        styurls: 'assets/images/concert_example.jpg'),
    ConcertDetail(
        mt20id: 'PF132236',
        prfnm: '멤피스 1',
        poster: 'assets/images/poster_example5.jpeg',
        prfpdfrom: '2023.07.12',
        prfpdto: '2023.09.03',
        prfruntime: '165분',
        prfage: '14세 이상 관람가',
        genrenm: '뮤지컬',
        fcltynm: '예술의 전당 오페라 극장',
        styurls: 'assets/images/concert_example.jpg'),
    ConcertDetail(
        mt20id: 'PF132236',
        prfnm: '멤피스 2',
        poster: 'assets/images/poster_example5.jpeg',
        prfpdfrom: '2023.07.12',
        prfpdto: '2023.09.03',
        prfruntime: '165분',
        prfage: '14세 이상 관람가',
        genrenm: '뮤지컬',
        fcltynm: '예술의 전당 오페라 극장',
        styurls: 'assets/images/concert_example.jpg'),
    ConcertDetail(
        mt20id: 'PF132236',
        prfnm: '멤피스 3',
        poster: 'assets/images/poster_example5.jpeg',
        prfpdfrom: '2023.07.12',
        prfpdto: '2023.09.03',
        prfruntime: '165분',
        prfage: '14세 이상 관람가',
        genrenm: '뮤지컬',
        fcltynm: '예술의 전당 오페라 극장',
        styurls: 'assets/images/concert_example.jpg'),
  ];

  final List<FacilityDetail> facilityList = [
    FacilityDetail(
      mt10id: '23424',
      fcltynm: '올림픽 공원 1',
      relateurl: 'https://www.olympicpark.co.kr',
      adres: '서울 특별시 송파구 방이동',
      la: '',
      lo: '',
    ),
    FacilityDetail(
      mt10id: '23424',
      fcltynm: '올림픽 공원 2',
      relateurl: 'https://www.olympicpark.co.kr',
      adres: '서울 특별시 송파구 방이동',
      la: '',
      lo: '',
    ),
    FacilityDetail(
      mt10id: '23424',
      fcltynm: '올림픽 공원 3',
      relateurl: 'https://www.olympicpark.co.kr',
      adres: '서울 특별시 송파구 방이동',
      la: '',
      lo: '',
    ),
    FacilityDetail(
      mt10id: '23424',
      fcltynm: '올림픽 공원 4',
      relateurl: 'https://www.olympicpark.co.kr',
      adres: '서울 특별시 송파구 방이동',
      la: '',
      lo: '',
    ),
    FacilityDetail(
      mt10id: '23424',
      fcltynm: '올림픽 공원 5',
      relateurl: 'https://www.olympicpark.co.kr',
      adres: '서울 특별시 송파구 방이동',
      la: '',
      lo: '',
    ),
    FacilityDetail(
      mt10id: '23424',
      fcltynm: '올림픽 공원 abc',
      relateurl: 'https://www.olympicpark.co.kr',
      adres: '서울 특별시 송파구 방이동',
      la: '',
      lo: '',
    ),
  ];

  List<ConcertDetail> filteredPrfItems = []; //검색결과 리스트 - 공연
  List<FacilityDetail> filteredFcltItems = []; //검색결과 리스트 - 공연장

  void filterItems(String query) {
    // 검색 필터링
    setState(() {
      if (query.trim().isEmpty) {
        // 검색어가 없는 경우
        // 검색어가 없을 때 토스트 메시지 표시
        Fluttertoast.showToast(
          msg: '검색어를 입력하세요',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        filteredPrfItems.clear();
        filteredFcltItems.clear();

        if (selectedCategory == '공연') {
          filteredPrfItems = concertList
              .where((item) =>
                  item.prfnm!.toLowerCase().contains(query.toLowerCase()))
              .toList();
        } else if (selectedCategory == '공연장') {
          filteredFcltItems = facilityList
              .where((item) =>
                  item.fcltynm!.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: Align(
              alignment: Alignment.topLeft,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.transparent, Colors.white],
                    stops: [0.0, 1.0],
                  ).createShader(bounds);
                },
                child: Text(
                  "ArtRoad",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: 30.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Container(
              decoration: ShapeDecoration(
                color: Color(0xFFF2F2F2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: Expanded(
                child: TextField(
                  controller: searchController,
                  onEditingComplete: () => filterItems(searchController.text),
                  decoration: InputDecoration(
                    hintText: '공연 및 공연장을 검색하세요',
                    hintStyle: TextStyle(fontSize: 14),
                    suffixIcon: GestureDetector(
                      onTap: () => filterItems(searchController.text),
                      child: Icon(Icons.search),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                            filteredPrfItems.clear(); // 카테고리 변경시 비우기
                            filteredFcltItems.clear(); // 카테고리 변경시 비우기
                          });
                        },
                        items: <String>['공연', '공연장'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 13),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    if (selectedCategory == '공연' &&
        filteredPrfItems.isEmpty &&
        searchController.text.isNotEmpty) {
      return Center(child: Text('검색결과가 없습니다.'));
    } else if (selectedCategory == '공연장' &&
        filteredFcltItems.isEmpty &&
        searchController.text.isNotEmpty) {
      return Center(child: Text('검색결과가 없습니다.'));
    }

    return ListView.builder(
      itemCount: selectedCategory == '공연'
          ? filteredPrfItems.length
          : filteredFcltItems.length,
      itemBuilder: (context, index) {
        if (selectedCategory == '공연') {
          return ListTile(
            title: SearchItemsTile(filteredPrfItems[index]),
          );
        } else if (selectedCategory == '공연장') {
          return ListTile(
            title: SearchItemsTile(filteredFcltItems[index]),
          );
        }
        return Container();
      },
    );
  }
}
