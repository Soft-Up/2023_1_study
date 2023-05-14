var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
    const result = [];

    for(let index = 0; index < Math.floor(datas.length / 2 - 1); index++) {
        result.push(datas[getRandomIntInclusive(0, datas.length - 1)]);
    }
    res.send(result);
});

function getRandomIntInclusive(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min; //최댓값도 포함, 최솟값도 포함
}

class Data {
  constructor(name, type, gender, image) {
    this.name = name;
    this.type = type;
    this.gender = gender;
    this.image = image;
  }

  toJson() {
    return {
      "name": this.name,
      "type": this.type,
      "gender": this.gender,
      "image": this.image
    };
  }
}

const datas = [
    new Data("설인아", "배우", "여자", "https://image.jtbcplus.kr/data/contents/jam_photo/202205/13/905f1990-dcb8-4e60-ab04-99aaf2bff7c9.jpg"),
    new Data("유재석", "예능인", "남자", "https://cdn.mindgil.com/news/photo/202201/73470_12193_834.png"),
    new Data("김유정", "배우", "여자", "https://mblogthumb-phinf.pstatic.net/MjAxNjExMDVfMTQ1/MDAxNDc4MzM0MjgwMTQ3.G8xUmFHbbSGdbKl7X6vl4H8d7COko_MN_37HyMLAfgsg.Bk2IBJgtgWt_TjT15GyTLSVt3vXFBn335mpVRL7MSdwg.JPEG.wkao9489/NaverBlog_20161105_172439_12.jpg?type=w2"),
    new Data("아이유", "가수", "여자", "https://getfile.fmkorea.com/getfile.php?code=75e5f84ffa2638203365827bfe556f64&file=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbAPdqx%2FbtrFVi67cgg%2FjkHLXOn4nI4s0t9jWe0CFK%2Fimg.jpg&"),
    new Data("미연", "아이돌", "여자", "https://blog.kakaocdn.net/dn/med08/btrndnmWMNj/tobxNWHk8tG26KNZ527pK0/img.jpg"),
    new Data("황민현", "아이돌", "남자", "https://file.mk.co.kr/meet/neds/2021/06/image_readtop_2021_530955_16225970114666915.jpg"),
    new Data("김수현", "배우", "남자", "https://t1.daumcdn.net/cfile/tistory/99FAED4C5F70861A16"),
    new Data("이동욱", "배우", "남자", "https://i.namu.wiki/i/x2E4ZUNHccQAQO5Ps2c65-rLf_6yF-X8GjDG-_9PKxl66JzeXmEFKdQ14e_V8Amf_nNbJhr0Hx-_4BU6e_wR2w.webp"),
    new Data("차은우", "아이돌", "남자", "https://pickcon.co.kr/site/data/img_dir/2022/06/29/2022062980010_0.jpg"),
    new Data("지민", "아이돌", "남자", "https://blog.kakaocdn.net/dn/cpQBjG/btqARYGkiwU/azvB4KSUaxCmBRqyB1oqJK/img.jpg"),
    new Data("카리나", "아이돌", "여자", "https://upload3.inven.co.kr/upload/2023/04/18/bbs/i15950226572.jpg?MW=800"),
    new Data("채원", "아이돌", "여자", "https://cdn.ppomppu.co.kr/zboard/data3/2023/0314/20230314123355_WXJP21kmxD.jpg"),
    new Data("공유", "배우", "남자", "https://t1.daumcdn.net/cfile/tistory/254CA44A586FB40828"),
    new Data("수지", "배우", "여자", "https://www.bulkwang.co.kr/news/photo/202111/36950_16361_3228.jpg"),
    new Data("안유진", "아이돌", "여자", "https://blog.kakaocdn.net/dn/cgeau6/btrzmkypFWq/DmDjPKiUHllycaX8lSiP6k/img.jpg"),
    new Data("장원영", "아이돌", "여자", "https://i20.tcafe2a.com/1905/20190526014846_125ea46236729de32f1219e5b9dabd9c_fkvj.jpg"),
    new Data("정한", "아이돌", "남자", "https://file3.instiz.net/data/cached_img/upload/2019/05/19/2/ab1a81f22502ab27db79075437a70bbd.jpg"),
];

module.exports = router;
