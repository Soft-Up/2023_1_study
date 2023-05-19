import 'package:dio/dio.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/dtos/celebrity_dto.dart';
import 'package:retrofit/http.dart';

part 'do_it.g.dart';

/// Doit Flutter Study 서버와 연결하는 Dio Client입니다.
///
/// 기본 baseUrl은 로컬 서버입니다. 생성자에서 baseUrl를 입력하면 기본 baseUrl을 덮어씌웁니다.
@RestApi(baseUrl: "http://localhost:3000")
abstract class DoitRestClient {
  factory DoitRestClient(Dio dio, {String? baseUrl}) = _DoitRestClient;

  @GET("/datas")
  Future<List<CelebrityDto>> getCelebrities();
}