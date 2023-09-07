import 'dart:convert' as convert;
import 'package:artroad/src/model/ranking.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class RankingRepository {
  Future<List<Ranking>?> _loadRankings(String cate) async {
    await dotenv.load();
    DateTime now = DateTime.now();
    String currentDate = DateFormat('yyyyMMdd').format(now);
    String apiKey = dotenv.env['API_KEY']!;
    List<Ranking> rankings = [];
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
        rankings.addAll(items.sublist(0, itemCount).map<Ranking>((item) => Ranking.fromJson(item)));
      } else {
      }
    }
    if (rankings.isNotEmpty) {
      return rankings;
    }
    return null;
  }

  Future<List<Ranking>?> loadTop10Rankings() async {
    await dotenv.load();
    DateTime now = DateTime.now();
    String currentDate = DateFormat('yyyyMMdd').format(now);
    String apiKey = dotenv.env['API_KEY']!;
    List<Ranking> rankings = [];
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
        rankings.addAll(items.sublist(0, itemCount).map<Ranking>((item) => Ranking.fromJson(item)));
      } else {
      }
    }
    if (rankings.isNotEmpty) {
      return rankings;
    }
    return null;
  }

  Future<List<Ranking>?> loadPlayRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<Ranking>?> loadMusicalRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<Ranking>?> loadClassicRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<Ranking>?> loadKoreanRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<Ranking>?> loadPopularRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<Ranking>?> loadDanceRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<Ranking>?> loadCircusRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<Ranking>?> loadComplexRankings(String cate) async {
    return _loadRankings(cate);
  }

  Future<List<Ranking>?> loadKidRankings(String cate) async {
    return _loadRankings(cate);
  }
}