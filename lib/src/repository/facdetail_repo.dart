//공연시설 상세 정보 페이지 (Facility Detail)
import 'dart:convert' as convert;
import 'package:artroad/src/model/facdetail.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FacilityDetailRepository {
  Future<List<FacilityDetail>?> loadFacilityDetails(String facilityID) async {

    await dotenv.load();
    String apiKey = dotenv.env['API_KEY']!;
    String baseUrl = 
      "http://www.kopis.or.kr/openApi/restful/prfplc/$facilityID?service=$apiKey";
    final response = await http.get(Uri.parse(baseUrl));
    print(response.statusCode);

    if (response.statusCode == 200) {
      final body = convert.utf8.decode(response.bodyBytes);
      final xml = Xml2Json()..parse(body);
      final json = xml.toParker();

      Map<String, dynamic> jsonResult = convert.json.decode(json);

      final jsonFacilityDetail = jsonResult['dbs']['db'];

      if (jsonFacilityDetail != null) {
        return [FacilityDetail.fromJson(jsonFacilityDetail)];
      }
    } else{
      print(response);
    }
    return null;
  }
}