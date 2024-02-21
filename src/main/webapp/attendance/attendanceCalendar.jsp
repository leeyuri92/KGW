<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN 라이선스 표시 없애기 위해 locale 사용 -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  <!-- moment-timezone.js 라이브러리 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.34/moment-timezone-with-data.min.js"></script>
  <!-- 부트스트랩 라이브러리 -->
  <link rel="stylesheet" href="/css/calendar.css">
  <title>메인페이지</title>
</head>
<body class="hold-transition sidebar-mini sidebar-collapse ">
<div class="wrapper">
  <!-- header start -->
  <%@include file="/include/KGW_bar.jsp"%>
  <!-- header end    -->

  <!-- body start    -->
  <div class="content-wrapper">
    <!-- 페이지 path start    -->
    <%--		<div class="card" >--%>
    <div class="box-header p-4" >
      <div class="d-flex align-items-center">
        <div class="d-flex align-items-center me-2">
          <a class="text-muted fs-6" href="/">메인페이지</a>
          <div class="ms-2">></div>
        </div>
        <div class="d-flex align-items-center">
          <div class="text-dark fs-6">근태관리</div>
        </div>
      </div>
      <div class="d-flex align-items-center mt-2">
        <div class="position-relative">
          <div class="position-absolute top-0 start-0" ></div>
        </div>
        <div class="d-flex align-items-center ms-2">
          <div class="fw-bold fs-5">근태관리</div>
          <div class="text-muted ms-3">근태관리를 검색할 수 있는 페이지입니다.</div>
        </div>
      </div>
    </div>
    <div class="box mt-3">
        <%@include file="/include/attendance.jsp"%>
    </div>


</body>
</html>
