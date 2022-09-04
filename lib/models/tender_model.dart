import 'package:tender_mobile/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:tender_mobile/shared/values.dart';

class TenderModel {
  final int? id;
  final String? lpse, hps, url, namaTender, tanggalAkhir, type, isNew;

  TenderModel({
    this.id,
    this.hps,
    this.isNew,
    this.lpse,
    this.namaTender,
    this.tanggalAkhir,
    this.type,
    this.url,
  });

  factory TenderModel.createTender(Map<String, dynamic> object) {
    return TenderModel(
      id: object['id'],
      hps: object['hps'],
      isNew: object['isNew'],
      lpse: object['lpse'],
      namaTender: object['nama_tender'],
      tanggalAkhir: object['tanggal_akhir'],
      type: object['type'],
      url: object['url'],
    );
  }
}
