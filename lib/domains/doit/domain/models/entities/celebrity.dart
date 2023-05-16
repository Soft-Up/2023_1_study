class Celebrity {
  String name;
  String gender;
  String job;
  String image;

  Celebrity({required this.name, required this.gender, required this.job, required this.image});
}

final List<Celebrity> datas = [
  Celebrity(
      name: "공유",
      job: "배우",
      gender: "남자",
      image: "https://t1.daumcdn.net/cfile/tistory/254CA44A586FB40828"),
  Celebrity(
      name: "수지",
      job: "배우",
      gender: "여자",
      image: "https://www.bulkwang.co.kr/news/photo/202111/36950_16361_3228.jpg"),
  Celebrity(
      name: "안유진",
      job: "아이돌",
      gender: "여자",
      image: "https://blog.kakaocdn.net/dn/cgeau6/btrzmkypFWq/DmDjPKiUHllycaX8lSiP6k/img.jpg"),
  Celebrity(
      name: "장원영",
      job: "아이돌",
      gender: "여자",
      image:
          "https://i20.tcafe2a.com/1905/20190526014846_125ea46236729de32f1219e5b9dabd9c_fkvj.jpg"),
  Celebrity(
      name: "정한",
      job: "아이돌",
      gender: "남자",
      image:
          "https://file3.instiz.net/data/cached_img/upload/2019/05/19/2/ab1a81f22502ab27db79075437a70bbd.jpg")
];
