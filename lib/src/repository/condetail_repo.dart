import 'package:artroad/src/model/condetail.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:xml2json/xml2json.dart';

class ConcertDetailRepository {
  Future<List<ConcertDetail>?> loadConcertDetails() async{
    await dotenv.load();
    String apiKey = dotenv.env['API_KEY']!;
    String concertID = "PF223521";
    String baseUrl = 
      "http://www.kopis.or.kr/openApi/restful/pblprfr/$concertID?service=$apiKey";
    
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200){
      try{
        final body = convert.utf8.decode(response.bodyBytes);
        final xml = Xml2Json()..parse(body);
        final json = xml.toParker();

        Map<String, dynamic> jsonResult = convert.jsonDecode(json);
        final jsonConcertDetail = jsonResult['dbs']['db'];
        if (jsonConcertDetail.values != null) {
          return jsonConcertDetail.map<ConcertDetail>((item) => ConcertDetail.fromJson(item)).toList();
      }
        }
      finally{
        print('finally print');
      }
    } return null;
  }
}