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

  @override
  String toString() {
    return 'Celebrity{name: $name, type: $type, gender: $gender, imgUrl: $imgUrl}';
  }
}
