import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';

abstract class CelebrityRepository {
  Future<Iterable<Celebrity>> getCelebrity();
}