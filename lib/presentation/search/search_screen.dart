import 'package:artroad/src/model/concert.dart';
import 'package:artroad/src/model/facility.dart';
import 'package:artroad/src/provider/search/concert_provider.dart';
import 'package:artroad/src/provider/search/facility_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_helper.dart';
import 'search_items_tile.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String selectedCategory = '공연';

  List<Concert> filteredPrfItems = []; //검색결과 리스트 - 공연
  List<Facility> filteredFcltItems = []; //검색결과 리스트 - 공연장

  Future<void> filterItems(String query) async {
    // 검색 필터링

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
      String searchTerm = query.toLowerCase();
      if (selectedCategory == '공연') {
        final concertProvider =
            Provider.of<ConcertProvider>(context, listen: false);
        final concerts = await concertProvider.loadConcerts(searchTerm);
        if (concerts != null) {
          // null 체크 추가
          setState(() {
            filteredPrfItems = concerts;
            _buildSearchResults();
          });
        }
      } else if (selectedCategory == '공연장') {
        final facilityProvider =
            Provider.of<FacilityProvider>(context, listen: false);
        final facilities = await facilityProvider.loadFacilities(searchTerm);
        if (facilities != null) {
          // null 체크 추가
          setState(() {
            filteredFcltItems = facilities;
            _buildSearchResults();
            print('setState filteredFcltItems: $filteredFcltItems');
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Align(
              alignment: Alignment.topLeft,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
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
                color: const Color(0xFFF2F2F2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: TextField(
                controller: searchController,
                onEditingComplete: () => filterItems(searchController.text),
                decoration: InputDecoration(
                  hintText: '공연 및 공연장을 검색하세요',
                  hintStyle: const TextStyle(fontSize: 14),
                  suffixIcon: GestureDetector(
                    onTap: () => filterItems(searchController.text),
                    child: const Icon(Icons.search),
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
                            searchController.clear(); // 검색어 비우기
                          });
                        },
                        items: <String>['공연', '공연장'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 13),
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
        (filteredPrfItems.isEmpty || filteredPrfItems.isEmpty) &&
        searchController.text.isNotEmpty) {
      return const Center(child: Text('검색결과가 없습니다.'));
    } else if (selectedCategory == '공연장' &&
        (filteredFcltItems.isEmpty || filteredFcltItems.isEmpty) &&
        searchController.text.isNotEmpty) {
      return const Center(child: Text('검색결과가 없습니다.'));
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: selectedCategory == '공연'
                  ? filteredPrfItems.length
                  : filteredFcltItems.length,
              itemBuilder: (context, index) {
                if (selectedCategory == '공연' &&
                    index < filteredPrfItems.length) {
                  return ListTile(
                    title: SearchItemsTile(filteredPrfItems[index]),
                  );
                } else if (selectedCategory == '공연장' &&
                    index < filteredFcltItems.length) {
                  return ListTile(
                    title: SearchItemsTile(filteredFcltItems[index]),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
