import 'dart:convert';

import 'package:tender_mobile/models/tender_model.dart';
import 'package:tender_mobile/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:tender_mobile/shared/values.dart';

class TenderService {
  Future<List<TenderModel>> getTender() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
          Uri.parse(
            '$baseUrl/tender',
          ),
          headers: {
            'Authorization': token,
          });

      if (res.statusCode == 200) {
        return List<TenderModel>.from(
          jsonDecode(res.body)['data'].map(
            (tender) => TenderModel(),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
