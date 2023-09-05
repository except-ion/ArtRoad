import 'dart:convert' as convert;
import 'package:artroad/presentation/home/home_ranking_items.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class RankingRepository {
  Future<List<RankingItems>?> _loadRankings(String cate) async {
    await dotenv.load();
    DateTime now = DateTime.now();
    String currentDate = DateFormat('yyyyMMdd').format(now);
    String apiKey = dotenv.env['API_KEY']!;
    List<RankingItems> rankings = [];
    String baseUrl =
        "http://kopis.or.kr/openApi/restful/boxoffice?service=$apiKey&ststype=month&date=$currentDate&catecode=$cate";
    final response = await http.get(Uri.parse(baseUrl));

    // 정상적으로 데이터를 불러왔다면
    if (response.statusCode == 200) {
      // 데이터 가져오기
      final body = convert.utf8.decode(response.bodyBytes);
      // xml => json으로 변환
      final xml = Xml2Json()..parse(body);
      final json = xml.toParker();

      // 필요한 데이터 찾기
      Map<String, dynamic> jsonResult = convert.json.decode(json);
      final jsonRanking = jsonResult['boxofs']['boxof'];
      if (jsonRanking != null) {
        List<dynamic> items = jsonRanking as List;
        int itemCount = items.length < 9 ? items.length : 9;
        rankings.addAll(items.sublist(0, itemCount).map<RankingItems>((item) => RankingItems.fromJson(item)));
      } else {
        print(response);
      }
    }
    if (rankings.isNotEmpty) {
      return rankings;
    }
    return null;
  }

  Future<List<RankingItems>?> loadTop10Rankings() async {
    await dotenv.load();
    DateTime now = DateTime.now();
    String currentDate = DateFormat('yyyyMMdd').format(now);
    String apiKey = dotenv.env['API_KEY']!;
    List<RankingItems> rankings = [];
    String baseUrl =
        "http://kopis.or.kr/openApi/restful/boxoffice?service=$apiKey&ststype=month&date=$currentDate";
    final response = await http.get(Uri.parse(baseUrl));

    // 정상적으로 데이터를 불러왔다면
    if (response.statusCode == 200) {
      // 데이터 가져오기
      final body = convert.utf8.decode(response.bodyBytes);
      // xml => json으로 변환
      final xml = Xml2Json()..parse(body);
      final json = xml.toParker();

      // 필요한 데이터 찾기
      Map<String, dynamic> jsonResult = convert.json.decode(json);
      final jsonRanking = jsonResult['boxofs']['boxof'];
      if (jsonRanking != null) {
        List<dynamic> items = jsonRanking as List;
        int itemCount = items.length < 10 ? items.length : 10;
        rankings.addAll(items.sublist(0, itemCount).map<RankingItems>((item) => RankingItems.fromJson(item)));
      } else {
        print(response);
      }
    }
    if (rankings.isNotEmpty) {
      return rankings;
    }
    return null;
  }

  Future<List<RankingItems>?> loadPlayRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<RankingItems>?> loadMusicalRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<RankingItems>?> loadClassicRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<RankingItems>?> loadKoreanRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<RankingItems>?> loadPopularRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<RankingItems>?> loadDanceRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<RankingItems>?> loadPopularDanceRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<RankingItems>?> loadCircusRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<RankingItems>?> loadComplexRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<RankingItems>?> loadKidRankings(String cate) async {
    return _loadRankings(cate);
  }
}