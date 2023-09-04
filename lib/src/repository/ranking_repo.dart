//오픈 api를 통해 데이터 가져오기
//search에서 공연으로 검색했을 경우 사용
import 'dart:convert' as convert;
import 'package:artroad/presentation/home/home_ranking_items.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class RankingRepository {

  Future<List<RankingItems>?> loadTop10Rankings() async {
    await dotenv.load();
    DateTime now = DateTime.now();
    String currentDate = DateFormat('yyyyMMdd').format(now);
    // List<String> catecodeList = ["", "AAAA", "GGGA", "CCCD", "CCCA"];
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
        print('jsonRanking: $jsonRanking');
        // ranking 상위 10개만 return 보내기
        if (jsonRanking != null) {
          List<dynamic> items = jsonRanking as List;
          int itemCount = items.length < 10 ? items.length : 10;
          rankings.addAll(items.sublist(0, itemCount).map<RankingItems>((item) => RankingItems.fromJson(item)));
      } else{
        print(response);
      }
    }
    if (rankings.isNotEmpty) {
      return rankings;
    }
    return null;
  }
}