import 'package:http/http.dart' as http;
import 'package:tender_mobile/models/keywords_model.dart';
import 'package:tender_mobile/services/auth_service.dart';
import 'package:tender_mobile/shared/values.dart';

class KeywordsService {
  Future getKeywords() async {
    final token = await AuthService().getToken();
    final res = await http.get(Uri.parse('$baseUrl/keywords'), headers: {
      'Authorization': token,
    });

    if (res.statusCode == 200) {
      return keywordsModelFromJson(res.body.toString());
    } else {
      throw Exception('Data Gagal diambil');
    }
  }
}
