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

## 목표

### Cubic

<table>
<thead>
    <th align="center">
      <font style="vertical-align: inherit;">Cubic으로 API 데이터 패칭하기</font>
    </th>
  </thead>
  <tbody>
    <tr>
      <td align="center">
        <img src="assets/showcases/cubic.gif" style="height: 250px;"/>
      </td>
    </tr>
  </tbody>
</table>

### Bloc

<table>
  <thead>
    <th align="center">
      <font style="vertical-align: inherit;">Bloc으로 API 데이터 패칭하기</font>
    </th>
  </thead>
  <tbody>
    <tr>
      <td align="center">
        <img src="assets/showcases/bloc.gif" style="height: 250px;"/>
      </td>
    </tr>
  </tbody>
</table>

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
## 스터디 진행 내용

### 1주차 ~ 4주차: Dart & Flutter 기초 다지기
<a href="https://www.youtube.com/@codingchef/playlists"> 코딩셰프 님의 Flutter 강의 </a>를 바탕으로 기초를 다졌습니다.

+ 1주차: Dart와 Flutter에 대한 마인드맵
  + 3/21
  + 무엇을 아는지 => 클래스, 함수, 자료형 등
  + 무엇을 모르는지 => Flutter로 개발을 어떻게 하는지, Dart의 Null Safety 등
  + 관심 있는 주제는 무엇인지 => Flutter 개발, 프로젝트 구조 설계, 상태 관리 등
+ 2주차 ~ 4주차: Flutter로 UI 만들어보기
  + 3/28, 4/4, 5/2
  + <a href="https://www.youtube.com/watch?v=zTTP8XBR6fI&t=725s">Flutter UI 튜토리얼 | 인스피레이션 앱 UI 및 애니메이션 - 1일차</a> 영상을 보고 비슷한 UI를 만들었습니다.
  + TextField, ListView 등

### 5주차 ~ 8주차: Flutter 프로젝트 설계하기
+ (5/17 예정) 5주차: Flutter에서 API 호출하고 데이터 가공하기
+ (5/24 예정) 6주차: Data Model을 설계하고 Layer를 나누며 프로젝트 구조 설계하기
+ (5/31 예정) 7주차: Flutter와 Cubic으로 상태관리 하기
+ (6/7 예정) 8주차: Flutter와 Bloc으로 상태관리 하기 및 회고

## 스터디 자료
+ <a href="https://docs.google.com/document/d/1hO1YK7BsiJ6bG7Vz7ARk6x3f2i_MN_xjjALxMHKNQrU/edit#">Bloc와 함께 하는 상태관리</a>
+ <a href="https://docs.google.com/document/d/18gixkWynlIKolDShnt9ayIEZ_EYXXW1prmuyCSH4yjQ/edit#heading=h.dr1m1iyy05mm">DI with GetIt</a>
+ <a href="https://docs.google.com/document/d/1pc5oMlZdyzUNptFe5AXZT9pFkUJeq4w5WTWUHt8h8Hs/edit#heading=h.4lreeypi5sl2">Rxdart와 함께 하는 ReactiveX</a>
+ <a href="https://docs.google.com/document/d/1siJ7sObO55X5u_59MXOgQvlil2CIME-2eC0q5AJpZls/edit">Stream과 함께 하는 Async programming
  </a>

## 브랜치
+ 각 팀원의 이름 별로 브랜치가 존재합니다. 스터디한 결과물을 업로드합니다.
+ "feature-xxx" 브랜치는 xxx의 예제 브랜치입니다.
  + feature-client: HTTP 연결 예제
  + feature-server: 간단한 Express 서버 API 추가 
  + feature-api: Express 서버와의 API 통신 추가
  + feature-layered-architecture: API 데이터 가공 레이어 추가
  + feature-bloc: Bloc을 사용한 Business logic layer 추가

## 폴더 구조
```shell
client # 클라이언트 
  ├── lib
  │   ├── app # 앱 설정 관련 폴더
  │   ├── datas # 데이터 처리 레이어 폴더
  │   │   └── doit # 도메인 이름
  │   │       ├── clients # API 호출 관련 클래스
  │   │       └── repositories # 데이터 가공 레이어 1
  │   │
  │   ├── domains # 도메인 레이어 폴더 모음
  │   │    ├── core # 핵심 파일들 ex) 공통 Exception
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