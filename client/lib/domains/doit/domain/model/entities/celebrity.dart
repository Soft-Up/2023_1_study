import 'package:json_annotation/json_annotation.dart';

part 'celebrity.g.dart';

/// 앱 전반에서 사용하는 데이터 모델입니다.
///
/// JsonSerializable Annotation을 붙이면 fromJson과 toJson 함수를 자동으로 만들어 줍니다.
/// Annotation은 아래에 있는 @JsonSerializable()에서 @를 말합니다.
@JsonSerializable()
class Celebrity {
  String name;
  String type;
  String gender;
  String imgUrl;

  Celebrity({
    required this.name,
    required this.type,
    required this.gender,
    required this.imgUrl,
  });

  factory Celebrity.fromJson(Map<String, dynamic> json) =>
      _$CelebrityFromJson(json);

  Map<String, dynamic> toJson() => _$CelebrityToJson(this);

  @override
  String toString() {
    return 'Celebrity{name: $name, type: $type, gender: $gender, imgUrl: $imgUrl}';
  }
}
