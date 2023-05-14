import 'package:doit_fluttter_study/domains/doit/domain/model/dtos/celebrity_dto.dart';

abstract class CelebrityClient {
  Future<Iterable<CelebrityDto>> getCelebrity();
}