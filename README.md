![image](https://github.com/heidi505/advanced_first_project/assets/98313279/b471349b-7f5e-4601-82a5-922300a9ebff)

# 항공사 사이트 [NIMBUS]
## 프로젝트 개요
공공데이터와 항공권 검색 외부 API를 활용하여 항공권 정보를 제공하고 항공권 검색 및 예약, 결제 등 핵심 기능이 많은 항공권 사이트를 주제로 선정하였습니다.

## 💻 프로젝트 2조
+ 김하얀(팀장)
+ 김승신
+ 성민경
+ 이은지
  
## 📚 Stacks

### Back
<img src="https://img.shields.io/badge/Java-EF2D5E.svg?&style=for-the-badge&logo=Java&logoColor=white"/> <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"> <img src="https://img.shields.io/badge/firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=white"> <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/myBatis-003545?style=for-the-badge&logo=myBatis&logoColor=white"> <img src="https://img.shields.io/badge/Jsp-FE5F50?style=for-the-badge&logo=Jsp&logoColor=white"> 

### Front
<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css3-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">

### Collaboration tools
<img src="https://img.shields.io/badge/figma-0769AD?style=for-the-badge&logo=figma&logoColor=white"> <img src="https://img.shields.io/badge/notion-4FC08D?style=for-the-badge&logo=notion&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">

### API
* 카카오 소셜 로그인 API
* 카카오 페이 API
* 카카오 푸시 알림 API
* CoolSMS API
* 공공데이터 API
* 항공권 검색 API
* 웹 푸시 알림 API
* Quartz 스케줄러 API
* 구글 메일 API
* chat Gpt API
  
## SiteMap
![Group 92](https://github.com/heidi505/advanced_first_project/assets/98313279/e366cb62-81ea-4ec9-b4c2-bcf920e24f6c)

## 📓 주요 기능 설명
#### 항공권 검색 (스케줄 선택)
- 왕복 & 편도 선택
- 출발지 & 도착지 선택
- 출발일 & 도착일 선택
- 탑승 인원 & 좌석 선택
- 항공사 & 시간대별로 옵션 선택
#### 최근 검색어 기능
- 검색했던 항공권이 최근 검색 항목에 띄워짐
#### 항공권 예약 및 결제
- 내가 가고자 하는 공항에 대한 소요시간 및 혼잡도, 주차장 등 정보를 보여줌 
- 내 여행 목록에 가면 내가 가고자 하는 여행에 대한 일정 계획을 chatGpt가 제안 
- 내 여행 목록에 예정된, 취소된, 지난 여행이 예약/결제로 나뉨
- 예약한 후 여행 가기 1일 전에 알려주는 카톡 푸시 알림
- 예약 확인 한 후 카카오톡 문자 알림
- 유저에게 쿠폰 등록이 완료되면 문자 발송, 쿠폰으로 차감 시 카카오 페이로 결제
#### 항공권 환불  

  
## 🔖 의존성
```
dependencies {
    implementation 'io.github.flashvayne:chatgpt-spring-boot-starter:1.0.4'
    implementation 'org.springframework.boot:spring-boot-starter-web'
    compileOnly 'org.projectlombok:lombok'
    developmentOnly 'org.springframework.boot:spring-boot-devtools'
    runtimeOnly 'com.h2database:h2'
    runtimeOnly 'com.mysql:mysql-connector-j'
    annotationProcessor 'org.projectlombok:lombok'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
    implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.3.0'
    implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
    implementation 'jakarta.servlet:jakarta.servlet-api' //스프링부트 3.0 이상
    implementation 'jakarta.servlet.jsp.jstl:jakarta.servlet.jsp.jstl-api' //스프링부트 3.0 이상
    implementation 'org.glassfish.web:jakarta.servlet.jsp.jstl' //스프링부트 3.0 이상
    implementation 'org.springframework.boot:spring-boot-starter-aop'
    implementation 'org.springframework.boot:spring-boot-starter-validation'
    implementation "org.springframework.boot:spring-boot-starter-data-jpa"
    implementation 'org.springframework.security:spring-security-crypto'
    implementation group: 'org.springframework.boot', name: 'spring-boot-starter-mail', version: '3.0.5'
    implementation 'org.springframework.boot:spring-boot-starter-data-redis'
    implementation 'net.nurigo:sdk:4.2.7'
//    coolsms라이브러리
    implementation 'javax.xml.bind:jaxb-api:2.3.1' // 현재(2022년 1월)의 최신 버전
    implementation 'com.google.firebase:firebase-admin:9.2.0'
    implementation 'org.springframework.boot:spring-boot-starter-quartz'
}
```

  
## 📋 FlowChart
![플로우차트 (1)](https://github.com/heidi505/advanced_first_project/assets/98313279/0fdb67aa-5b92-4290-9c03-760a3bd5f79f)  

  
## 📒모델링 연관관계
![DB스키마 1](https://github.com/heidi505/advanced_first_project/assets/98313279/11f6d5e1-99ab-4866-9bcf-079fdf32f81e)
