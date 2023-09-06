import 'package:auto_size_text/auto_size_text.dart';
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
    // 공연 데이터
  ];

  final List<FacilityDetail> facilityList = [
    // 공연장 데이터
  ];

  List<ConcertDetail> filteredPrfItems = []; // 검색결과 리스트 - 공연
  List<FacilityDetail> filteredFcltItems = []; // 검색결과 리스트 - 공연장

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
                child: AutoSizeText(
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
                    child: FittedBox(
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
                            child: AutoSizeText(
                              value,
                              style: TextStyle(fontSize: 13),
                              minFontSize: 13,
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
            child: FittedBox(child: _buildSearchResults()),
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
