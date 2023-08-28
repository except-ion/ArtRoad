//오픈 api를 통해 데이터 가져오기
//공연 Search 할 때 사용하기
import 'dart:convert' as convert;
import 'package:artroad/src/model/concert.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConcertRepository {

  Future<List<Concert>?> loadConcerts() async {
  await dotenv.load();
  String apiKey = dotenv.env['API_KEY']!;
  var startDate = "20160801";
  var endDate = "20230831";
  var searchTerm = "뮤지컬";

    String baseUrl =
        "http://www.kopis.or.kr/openApi/restful/pblprfr?service=$apiKey&stdate=$startDate&eddate=$endDate&rows=10&cpage=1&shprfnm=$searchTerm";
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
      print('jsonResult: $jsonResult');
      final jsonConcert = jsonResult['dbs']['db'];
      // 필요한 데이터 그룹이 있다면
      if (jsonConcert != null) {
        print('jsonConcert length: ${jsonConcert.length}');
        // map을 통해 Ev형태로 item을  => Ev.fromJson으로 전달
        return jsonConcert.map<Concert>((item) => Concert.fromJson(item)).toList();
      }
    } else{
      print(response);
    }
    return null;
  }
}