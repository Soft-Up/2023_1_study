import 'package:doit_fluttter_study/domains/doit/domain/model/dtos/dtos.dart';
import 'package:doit_fluttter_study/domains/doit/domain/model/entities/entities.dart';

/// Dto와 Entity 클래스를 서로 변환해주는 걸 도와줍니다.
class CelebrityMapper {
  static Celebrity dtoToEntity(CelebrityDto celebrityDto) {
    return Celebrity(
        name: celebrityDto.name,
        type: celebrityDto.type,
        gender: celebrityDto.gender,
        imgUrl: celebrityDto.imgUrl);
  }
}
