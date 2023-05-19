import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';

abstract class CelebrityService {
  Stream<Iterable<Celebrity>> get celebrityIterableStream;

  Future<Iterable<Celebrity>> getCelebrity();
}