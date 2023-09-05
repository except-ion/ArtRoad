//오픈 api를 통해 데이터 가져오기
//search에서 공연으로 검색했을 경우 사용
import 'dart:convert' as convert;
import 'package:artroad/src/model/concert.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class ConcertRepository {

  Future<List<Concert>?> loadConcerts(String searchTerm) async {
  await dotenv.load();
  String apiKey = dotenv.env['API_KEY']!;

  DateTime now = DateTime.now();
  DateTime sixMonthsAgo = now.subtract(const Duration(days: 6 * 30));
  
  String formattedDate = DateFormat('yyyyMMdd').format(now);
  String formattedSixMonthsAgo = DateFormat('yyyyMMdd').format(sixMonthsAgo);

  var startDate = formattedSixMonthsAgo;
  var endDate = formattedDate;

    String baseUrl =
        "http://www.kopis.or.kr/openApi/restful/pblprfr?service=$apiKey&stdate=$startDate&eddate=$endDate&rows=500&cpage=1&shprfnm=$searchTerm";
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
      final jsonConcert = jsonResult['dbs']['db'];
      // 필요한 데이터 그룹이 있다면
      if (jsonConcert != null) {
        // map을 통해 Ev형태로 item을  => Ev.fromJson으로 전달
        return jsonConcert.map<Concert>((item) => Concert.fromJson(item)).toList();
      }
    } else{
      print(response);
    }
    return null;
  }
}