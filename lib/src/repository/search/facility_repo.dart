//공연시설 검색결과 페이지
import 'dart:convert' as convert;
import 'package:artroad/src/model/facility.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FacilityRepository {
  Future<List<Facility>?> loadFacilities() async {

    await dotenv.load();
    String apiKey = dotenv.env['API_KEY']!;
    String facilityName = "대전";
    String baseUrl = 
      "http://www.kopis.or.kr/openApi/restful/prfplc?service=$apiKey&cpage=1&rows=5&shprfnmfct=$facilityName";
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {

      final body = convert.utf8.decode(response.bodyBytes);

      final xml = Xml2Json()..parse(body);
      final json = xml.toParker();

      Map<String, dynamic> jsonResult = convert.json.decode(json);
      final jsonFacility = jsonResult['dbs']['db'];
      
      //공연시설 상세정보에서 adres가져오기
      if (jsonFacility != null) {
        List<Facility> facilities = [];

        for (var item in jsonFacility) {
          String facilityID = item['mt10id'];
          String facilityDetailUrl = 
            "http://www.kopis.or.kr/openApi/restful/prfplc/$facilityID?service=$apiKey";
          final detailResponse = await http.get(Uri.parse(facilityDetailUrl));
          
          if (detailResponse.statusCode == 200) {
            final detailBody = convert.utf8.decode(detailResponse.bodyBytes);
            final xml = Xml2Json()..parse(detailBody);
            final jsonDetail = xml.toParker();

            Map<String, dynamic> jsonFacilityDetail = convert.json.decode(jsonDetail);
            
            // 'adres' 값 추출
            String adres = jsonFacilityDetail['dbs']['db']['adres'];
            // Facility 객체 생성 및 리스트에 추가
            item['adres'] = adres;
            facilities.add(Facility.fromJson(item));
          }
        }
        print(jsonFacility);

        return jsonFacility.map<Facility>((item) => Facility.fromJson(item)).toList();
      }
    }
    return null;
  }
}