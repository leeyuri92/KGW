<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024-02-18
  Time: 오후 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>메인페이지</title>
</head>
<body>
<div class="wrapper">
  <%@include file="/include/KGW_bar.jsp"%>
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
        <div class="col-4 mr-3 text-center" style=" border: thin solid red">
          <div class="user-panel">
            <img src="/images/go.png" class="img-circle m-3 " alt="User Image" style=" width: 200px; height: 200px; border: thin solid red">
          </div>
          <div>
            [운영팀] 사원
          </div>
          <div>
            이류리
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
          <div class="mb-3">
            <button>출근</button>
            <button>퇴근</button>
          </div>

        </div>
        <div class="col">
          <div class="row mb-3" style="border: thin solid red">
            <div class="col">
              col12
            </div>
          </div>
          <div class="row mb-3" style="border: thin solid red">
            <div class="col">
              col13
            </div>
          </div>
          <div class="row" style="border: thin solid red">
            <div class="col">
              col14
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>
</body>
</html>
