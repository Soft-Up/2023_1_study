import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';

abstract class CelebrityService {
  Future<Iterable<Celebrity>> getCelebrity();
}