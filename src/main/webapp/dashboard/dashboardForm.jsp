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
  <title>메인페이지</title>
</head>
<body class="hold-transition sidebar-mini sidebar-collapse ">
<div class="wrapper">
  <%@include file="/include/KGW_bar.jsp"%>
  <link rel="stylesheet" href="/css/dashboard.css">
  <div class="content-wrapper">
    <!-- 페이지 path start    -->
    <%--		<div class="card" >--%>
    <div class="box-header p-4" >
      <div class="d-flex align-items-center">
        <div class="d-flex align-items-center">
          <div class="text-dark fs-6">메인페이지</div>
        </div>
      </div>
    </div>
    <!-- 페이지 path end -->
    <section class="content">

      <div class="row" style="height: 90%;">
        <div class="col-4 mr-3 text-center mainbox" >
          <div class="user-panel">
            <img src="/images/go.png" class="img-circle m-5 " alt="User Image" style=" width: 200px; height: 200px; ">
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
          <div class="row mb-3 mainbox" >
            <div class="col ">
              <div class="mainbox-header">
                <span style="font-weight: bold; margin-left: 1.5rem" >전자결재진행현황</span>
                <hr/>
                <div class="row">
                  <div class="custom-col" style="background-color: #efc30f">
                    <i class="bi bi-pause-fill custom-i"></i>
                    <p class="main-p" >결재대기 [0]</p>
                  </div>
                  <div class="custom-col" style="background-color: #467ece">
                    <i class="bi bi-play-fill custom-i"></i>
                    <p class="main-p" >결재진행 [0]</p>
                  </div>
                  <div class="custom-col" style="background-color: #5eb900">
                    <i class="bi bi-check-lg custom-i"></i>
                    <p class="main-p" >결재완료 [0]</p>
                  </div>
                  <div class="custom-col" style="background-color: #cc201f">
                    <i class="bi bi-repeat custom-i"></i>
                    <p class="main-p" >결재반려 [0]</p>
                  </div>
                  <div class="custom-col-1">
                    <button id="btn_approval" class="btn btn-danger" >기안하기</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row mb-3 mainbox" >
            <div class="col">
              <div class="mainbox-header">
                <span style="font-weight: bold; margin-left: 1.5rem" >근태관리</span>
                <hr/>

              </div>
            </div>
          </div>
          <div class="row mainbox" >
            <div class="col">
              <div class="mainbox-header">
                <span style="font-weight: bold; margin-left: 1.5rem" >공지사항게시판</span>
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
