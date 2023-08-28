//오픈 api를 통해 데이터 가져오기
//search에서 공연으로 검색했을 경우 사용
import 'dart:convert' as convert;
import 'package:artroad/src/model/ranking.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class RankingRepository {

  Future<List<Ranking>?> loadRankings() async {
    await dotenv.load();
    String apiKey = dotenv.env['API_KEY']!;
    String currentDate = "20230821";
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
      print(jsonRanking);
      // 필요한 데이터 그룹이 있다면
      if (jsonRanking != null) {
        // map을 통해 Ev형태로 item을  => Ev.fromJson으로 전달
        return jsonRanking.map<Ranking>((item) => Ranking.fromJson(item)).toList();
      }
    } else{
      print(response);
    }
    return null;
  }
}