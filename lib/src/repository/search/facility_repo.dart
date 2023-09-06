//공연시설 검색결과 페이지
import 'dart:convert' as convert;
import 'package:artroad/src/model/facility.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FacilityRepository {
  Future<List<Facility>?> loadFacilities(String searchTerm) async {

    await dotenv.load();
    String apiKey = dotenv.env['API_KEY']!;
    String encodedSearchTerm = Uri.encodeQueryComponent(searchTerm);
    List<Facility> facilities = [];

    String baseUrl = 
      "http://www.kopis.or.kr/openApi/restful/prfplc?service=$apiKey&cpage=1&rows=5&shprfnmfct=$encodedSearchTerm";
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {

      final body = convert.utf8.decode(response.bodyBytes);
      final xml = Xml2Json()..parse(body);
      final json = xml.toParker();

      Map<String, dynamic> jsonResult = convert.json.decode(json);
      final jsonFirst = jsonResult['dbs']['db'];
       if (jsonFirst != null) {
        for (var item in jsonFirst) {
          String facilityID = item['mt10id'];
          String facilityDetailUrl = 
            "http://www.kopis.or.kr/openApi/restful/prfplc/$facilityID?service=$apiKey";
          final detailResponse = await http.get(Uri.parse(facilityDetailUrl));
          
          if (detailResponse.statusCode == 200) {
            final detailBody = convert.utf8.decode(detailResponse.bodyBytes);
            final xml = Xml2Json()..parse(detailBody);
            final jsonDetail = xml.toParker();

            Map<String, dynamic> jsonResult = convert.json.decode(jsonDetail);
            
            final jsonFacility = jsonResult['dbs']['db'];
            print('jsonFacility: $jsonFacility');
            // Facility 객체 생성 및 리스트에 추가
            if (jsonFacility != null) {
              facilities.add(Facility.fromJson(jsonFacility));
            } else {
              print(response);
            }
            return facilities;
          }
        }
      }
    }
    return null;
  }
}