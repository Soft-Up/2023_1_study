import 'package:dio/dio.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/dtos/celebrity_dto.dart';
import 'package:retrofit/http.dart';

part 'do_it.g.dart';

@RestApi(baseUrl: "http://localhost:3000")
abstract class DoitRestClient {
  factory DoitRestClient(Dio dio, {String? baseUrl}) = _DoitRestClient;

  @GET("/datas")
  Future<List<CelebrityDto>> getCelebrities();
}