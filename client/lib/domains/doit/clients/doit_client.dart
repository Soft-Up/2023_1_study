import 'package:dio/dio.dart';
import 'package:doit_fluttter_study/domains/doit/domain/models/entities/celebrity.dart';

class DoitClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: "http://localhost:3000"));

  Future<List<Celebrity>> getCelebrity() async {
    final response = await _dio.get("/datas");

    return response.data!.map<Celebrity>((json) {
      return Celebrity.fromJson(json as Map<String, dynamic>);
    }).toList();
  }
}
