<%----------------------------------------------------------
  이름 : 박병현
  날짜 : 2024-02-19
  내용 : 메인페이지jsp
----------------------------------------------------------%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.best.kgw.vo.EmpVO" %>
<%
  List<EmpVO> empDetail = (List) request.getAttribute("empDetail");
  EmpVO empvo = empDetail.get(0);
//  out.print(empDetail);
%>

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
      <link rel="stylesheet" href="/css/dashboard.css">

      <!-- body start    -->
      <div class="content-wrapper">
        <!-- 페이지 path start    -->
        <%--		<div class="card" >--%>
        <div class="mainbox-header p-4" >
          <div class="d-flex align-items-center">
            <div class="d-flex align-items-center me-2">
              <a class="text-muted fs-6" href="#">메인페이지</a>
            </div>
          </div>
          <div class="d-flex align-items-center mt-2">
            <div class="position-relative">
              <div class="position-absolute top-0 start-0" ></div>
            </div>
            <div class="d-flex align-items-center ms-2">
              <div class="fw-bold fs-5">메인페이지</div>
              <div class="text-muted ms-3">메인페이지입니다.</div>
            </div>
          </div>
        </div>
    <!-- 페이지 path end -->
    <section class="content">

      <div class="row">
        <div class="col-2 mr-3 text-center mainbox" >
          <div class="user-panel">
            <img src="/images/go.png" class="img-circle m-5 " alt="User Image" style=" margin: auto; width: 175px; height: 175px; ">
          </div>
          <div>
            [<%=empvo.getEmp_position()%>] 사원
          </div>
          <div>
            <%=empvo.getName()%>
          </div>
          <div>
            12:00:00 [날씨]
          </div>
          <div>
            출근시간 : 09:00:00
          </div>
          <div>
            퇴근시간 : 09:00:00
          </div>
          <hr class="m-5" style="height: 1px; background-color: #0e0e0e; border: 0">
          <div class="mb-5">
            <button id="btn_start" class="btn btn-danger" onclick="workStart()">출근</button>
            <button id="btn_end" class="btn btn-danger" onclick="workEnd()">퇴근</button>
          </div>
        </div>

        <div class="col">
          <div class="row " >

            <div class="col mainbox">
              <div class="mainbox-header">
                <span style="font-weight: bold; margin-left: 1.5rem" >전자결재진행현황</span>
                <hr/>

                <div class="row">
                  <div class="custom-col" >
<%--                    <i class="bi bi-pause-fill custom-i"></i>--%>
                    <button id="btn_approval_wait" class="approval btn btn-danger">결재대기 <p>[0]</p></button>
                  </div>

                  <div class="custom-col" >
<%--                    <i class="bi bi-play-fill custom-i"></i>--%>
                    <button id="btn_approval_progress" class="approval btn btn-danger">결재진행 <p>[0]</p></button>
                  </div>

                  <div class="custom-col" >
<%--                    <i class="bi bi-check-lg custom-i"></i>--%>
                    <button id="btn_approval_complete" class="approval btn btn-danger">결재완료 <p>[0]</p></button>
                  </div>

                  <div class="custom-col" >
<%--                    <i class="bi bi-repeat custom-i"></i>--%>
                    <button id="btn_approval_companion" class="approval btn btn-danger">결재반려 <p>[0]</p></button>
                  </div>

                  <div class="custom-col">
                    <button id="btn_approval" class="approval btn btn-danger" >기안작성 </button>
                  </div>

                </div>
              </div>
            </div>
          </div>

          <div class="row" >
            <div class="col mainbox">
              <div class="mainbox-header">
                <span style="font-weight: bold; margin-left: 1.5rem" >전략분석 차트</span>
                <hr/>
              </div>
            </div>
            <div class="col mainbox">
              <div class="mainbox-header">
                <a style="font-weight: bold; margin-left: 1.5rem" href="/attendance/attendanceCalendar.jsp">근태관리</a>
                <hr/>
                <%@include file="/include/attendance.jsp"%>
              </div>
            </div>

          </div>
          <div class="row" >
            <div class="col mainbox">
              <div class="mainbox-header">
                <span style="font-weight: bold; margin-left: 1.5rem" >공지사항게시판</span>
                <hr/>
              </div>
            </div>
            <div class="col mainbox">
              <div class="mainbox-header">
                <span style="font-weight: bold; margin-left: 1.5rem" >미디어게시판</span>
                <hr/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>
</body>
</html>
