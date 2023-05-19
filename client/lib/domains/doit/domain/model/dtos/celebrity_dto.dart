/// 서버나 로컬 스토리지와 통신을 위한 데이터 모델입니다.
class CelebrityDto {
  String name;
  String type;
  String gender;
  String imgUrl;

  CelebrityDto({
    required this.name,
    required this.type,
    required this.gender,
    required this.imgUrl,
  });

  factory CelebrityDto.fromJson(Map<String, dynamic> json) {
    return CelebrityDto(
      name: json['name'],
      type: json['type'],
      gender: json['gender'],
      imgUrl: json['image'],
    );
  }

  @override
  String toString() {
    return 'CelebrityDto{name: $name, type: $type, gender: $gender, imgUrl: $imgUrl}';
  }
}
