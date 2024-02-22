<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.util.BSPageBar" %>
<%

%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>인사정보</title>
  <script type="text/javascript">

  </script>
</head>

<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
  <!-- header start -->
  <%@include file="/include/KGW_bar.jsp"%>
  <div class="content-wrapper">
    <!-- 페이지 path start    -->
    <!-- <div class="card"> -->
    <div class="box-header p-4">
      <div class="d-flex align-items-center">
        <div class="d-flex align-items-center me-2">
          <a class="text-muted fs-6" href="/">관리자메뉴</a>
          <div class="ms-2">></div>
          <a class="text-muted fs-6" href="#">근태관리</a>
          <div class="ms-2">></div>
          <a class="text-muted fs-6" href="#">근태수정요청안</a>
        </div>
      </div>
      <div class="d-flex align-items-center mt-3">
        <div class="position-relative">
          <div class="position-absolute top-0 start-0"></div>
        </div>
        <div class="d-flex align-items-center ms-2">
          <div class="fw-bold fs-5">근태수정요청안</div>
          <div class="text-muted ms-3">근태수정요청안을 확인 할 수 있는 페이지입니다.</div>
        </div>
      </div>
    </div> <!-- Main content -->

    <section class="content">
      <div class="box mt-3">
        <div class="box-header d-flex align-items-center pb-0">
          <div class="d-flex align-items-center">
            <h4 style="font-weight: bold; margin-left: 1.5rem">근태수정요청안</h4>
          </div>
        </div>
        <hr />

        <div class="row mt-5">
          <div class="col-5 mr-3 ml-5">
            <div class="row mb-3">
              <div class="col-2" style="line-height: 37px"><label>작성자</label></div>
              <div class="col-10"><input type="text" class="form-control" value="[이유리]" disabled></div>
            </div>
            <div class="row mb-3">
              <div class="col-2" style="line-height: 37px"><label>작성일</label></div>
              <div class="col-10"><input type="text" class="form-control" value="[2024-02-01]" disabled></div>
            </div>
            <div class="row mb-3">
              <div class="col-2" style="line-height: 37px"><label>수정요청일</label></div>
              <div class="col-10"><input type="text" class="form-control" value="[2024-02-04]" disabled></div>
            </div>
            <div class="row mb-3" style="line-height: 37px"><label>요청사유</label></div>
            <div class="row mb-3"><textarea type="text" class="form-control" id="mod_content" name="mod_content"></textarea></div>
          </div>

          <div class="col-5 ml-5" style="border: 1px solid grey">
            <div class="row m-4">
              <div class="col-6"><label>출근일</label></div>
              <div class="col-6">[2024-02-01]</div>
            </div>
            <hr/>
            <div class="row m-4" >
              <div class="col-6"><label>출근시간</label></div>
              <div class="col-6">[00:00:00]</div>
            </div>
            <hr/>
            <div class="row m-4" >
              <div class="col-6"><label>퇴근시간</label></div>
              <div class="col-6">[00:00:00]</div>
            </div>
            <hr/>
            <div class="row m-4" >
              <div class="col-6"><label>근태상태</label></div>
              <div class="col-6">[결근]</div>
            </div>
          </div>
        </div>

        <hr style="margin-top: 50px; margin-bottom: 50px;"/>
        <form id="#" method="post" action="">
          <div class="form-floating m-3">
            <div class="row mb-3" >
              <div class="col-1" style=" line-height: 37px"><label>상태수정</label></div>
              <div class="col-2" >
                <select id="gubun" class="form-select" aria-label="분류선택">
                  <option value="none">분류선택</option>
                  <option value="name">정상출근</option>
                  <option value="state">지각</option>
                  <option value="state">결근</option>
                  <option value="state">휴가</option>
                  <option value="state">조퇴</option>
                </select>
              </div>
            </div>

            <div class="row mb-3">
              <div class="col" style="line-height: 37px"><label>수정사유</label></div>
            </div>
            <div class="row mb-3">
              <textarea type="text" class="form-control" id="res_content" name="res_content"></textarea>
            </div>

            <div style=" text-align: right;">
              <input type="button" class="btn btn-danger" onclick="" value="목록"/>
              <input type="button" class="btn btn-danger" onclick="" value="승인"/>
              <input type="button" class="btn btn-danger" onclick="" value="반려"/>
            </div>

          </div>
        </form>
      </div>
    </section>
  </div>
</body>
</html>
