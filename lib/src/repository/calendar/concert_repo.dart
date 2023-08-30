//오픈 api를 통해 데이터 가져오기
//calendar에서 해당 날짜 공연 보여줄때 사용
import 'dart:convert' as convert;
import 'package:artroad/src/model/concert.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConcertRepository {

  Future<List<Concert>?> loadConcerts() async {
  await dotenv.load();
  String apiKey = dotenv.env['API_KEY']!;

  var startDate = "20230801";
  var endDate = "20230801";

    String baseUrl =
        "http://www.kopis.or.kr/openApi/restful/pblprfr?service=$apiKey&stdate=$startDate&eddate=$endDate&rows=500&cpage=1";
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final body = convert.utf8.decode(response.bodyBytes);
      final xml = Xml2Json()..parse(body);
      final json = xml.toParker();

      Map<String, dynamic> jsonResult = convert.json.decode(json);
      final jsonConcert = jsonResult['dbs']['db'];
      if (jsonConcert != null) {
        return jsonConcert.map<Concert>((item) => Concert.fromJson(item)).toList();
      }
    } else{
      print(response);
    }
    return null;
  }
}