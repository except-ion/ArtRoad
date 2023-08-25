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

      if (jsonFacility != null) {
        return jsonFacility.map<Facility>((item) => Facility.fromJson(item)).toList();
      }
    }
    return null;
  }
}