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

  @override
  String toString() {
    return 'CelebrityDto{name: $name, type: $type, gender: $gender, imgUrl: $imgUrl}';
  }
}
