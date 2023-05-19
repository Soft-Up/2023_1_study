import 'package:json_annotation/json_annotation.dart';

part 'celebrity.g.dart';

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

  factory Celebrity.fromJson(Map<String, dynamic> json) => _$CelebrityFromJson(json);
  Map<String, dynamic> toJson() => _$CelebrityToJson(this);

  @override
  String toString() {
    return 'Celebrity{name: $name, type: $type, gender: $gender, imgUrl: $imgUrl}';
  }
}
