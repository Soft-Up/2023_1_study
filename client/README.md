# 2023-1 DoiT! Flutter Study

2023년도 아주대학교 중앙동아리 DoiT! Flutter 스터디입니다.

## 스터디 팀원

+ (팀장) 소프트웨어학과 18학번 장성호
+ 금융공학과 19학번 고지혜
+ 소프트웨어학과 20학번 김관주
+ 소프트웨어학과 20학번 김명준
+ 미디어학과 19학번 김병규
+ 소프트웨어학과 21학번 윤석호
+ 사이버보안학과 19학번 조재현
+ 소프트웨어학과 21학번 홍준서
+ 소프트웨어학과 19학번 조민주
+ 소프트웨어학과 22학번 나현흠
+ 소프트웨어학과 22학번 이나현

## 실행
### Client
```shell
# workspace: 2023_1_study/client
flutter run
```

### Server
```shell
# workspace: 2023_1_study/server
npm install
npm run
```

## 스터디 내용
Stream을 활용해 다음 목표를 이루고자 합니다.

1. Bloc event deboucing 처리
2. Business logic 구조를 Request & Response에서 Pub & Sub 구조로 변경
3. Rxdart와 bloc_concurrency 라이브러리 기능을 바닐라로 구현해보기

## 폴더 구조
```shell
client # 클라이언트 
  ├── lib
  │   ├── app # 앱 설정 관련 폴더
  │   ├── datas # 데이터 처리 레이어 폴더
  │   │   └── doit # 도메인 이름
  │   │       └── repositories # Repository 레이어
  │   │
  │   ├── domains # 도메인 레이어 폴더 모음
  │   │    ├── core # 핵심 파일들 ex) 공통 Exception
  │   │    │     ├── bloc # bloc util 모음
  │   │    │     ├── http  # http client, exception 등 모음
  │   │    │     └── stream # stream util 모음
  │   │    └── doit # 도메인 이름
  │   │         ├── domain # 도메인 레이어 폴더
  │   │         │     ├── model # 모델
  │   │         │     │    ├── dtos # 서버 <=> 클라이언트 간 데이터 매핑용 데이터 모델
  │   │         │     │    ├── entities # 클라이언트 내에서 사용하는 데이터 모델
  │   │         │     │    └── mappers # 각 모델간 Mapping을 도와주는 클래스
  │   │         │     └── services # 데이터 가공 레이어 2
  │   │         └── presentation # UI & 비즈니스 로직
  │   │               ├── blocs # 비즈니스 로직 처리 블록 모음
  │   │               ├── cubits # 비즈니스 로직 처리 큐빅 모음
  │   │               └── pages # UI 모음
  │   └── main.dart
  └── server # 간단한 로컬 express 서버
```