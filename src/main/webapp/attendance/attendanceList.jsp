<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.util.BSPageBar" %>
<%
//  int size = 0;//전체 레코드 수
//  List<Map<String, Object>> empList = (List) request.getAttribute("empList");
//  if(empList !=null){
//    size = empList.size();
//  }
//  out.print(size);//3
//  //페이지처리
//  int numPerPage = 5;
//  int nowPage = 0;
//  if(request.getParameter("nowPage")!=null){
//    nowPage = Integer.parseInt(request.getParameter("nowPage"));
//  }
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
          <a class="text-muted fs-6" href="/">메인페이지</a>
          <div class="ms-2">></div>
          <a class="text-muted fs-6" href="#">근태관리</a>
          <div class="ms-2">></div>
          <a class="text-muted fs-6" href="#">근태수정요청</a>
        </div>
      </div>
      <div class="d-flex align-items-center mt-3">
        <div class="position-relative">
          <div class="position-absolute top-0 start-0"></div>
        </div>
        <div class="d-flex align-items-center ms-2">
          <div class="fw-bold fs-5">근태수정요청목록</div>
          <div class="text-muted ms-3">근태수정요청목록 확인 할 수 있는 페이지입니다.</div>
        </div>
      </div>
    </div> <!-- Main content -->

    <section class="content">
      <div class="box mt-3">
        <div class="box-header d-flex align-items-center pb-0">
          <div class="d-flex align-items-center">
            <h4 style="font-weight: bold; margin-left: 1.5rem">근태수정요청목록</h4>
          </div>
            <div style="margin-left: auto;">
              <button id="bb" class="btn btn-danger" style="width: 100%;" data-bs-toggle="modal" data-bs-target="#modAttendance">근태수정요청</button>
            </div>
        </div>
        <hr />

        <!-- 회원목록 시작 -->
        <div class='board-list'>
          <table class="table table-hover text-center ">
            <thead>
            <tr>
              <th width="15%">번호</th>
              <th width="15%">작성자</th>
              <th width="15%">작성일</th>
              <th width="20%">요청일</th>
              <th width="20%">출/퇴근</th>
              <th width="20%">상태</th>
            </tr>
            </thead>
            <tbody>
            <%
//                   for(int i = nowPage*numPerPage; i < (nowPage*numPerPage)+numPerPage; i++) {
//                     if (i == size) break;
//                      Map<String,Object> rmap = empList.get(i);
            %>
            <tr>
<%--                   <td><%=rmap.get("NAME") %></td>--%>
<%--                   <td><%=rmap.get("TEAM_NAME")%></td>--%>
<%--                    <td><%=rmap.get("EMP_POSITION") %></td>--%>
<%--                    <td><%=rmap.get("PHONE_NUM") %></td>--%>
<%--                    <td><%=rmap.get("EMAIL") %></td>--%>
            </tr>
<%--                  <%--%>
<%--                    }--%>
<%--                  %>--%>
            </tbody>
          </table>
          <hr />

                <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
          <div style="display:flex; justify-content:center;">
            <ul class="pagination">
<%--                    <%--%>
<%--                      String pagePath = "empInfo";--%>
<%--                      BSPageBar bspb = new BSPageBar(numPerPage,size,nowPage,pagePath);--%>
<%--                      out.print(bspb.getPageBar());--%>
<%--                    %>--%>
            </ul>
          </div>
                <!-- [[ Bootstrap 페이징 처리  구간  ]] -->

        </div>
        <!-- 회원목록   끝  -->
      </div>
    </section>
  </div>
</div>

<div class="modal content" id="modAttendance">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <h1 class="fw-bold mb-0 fs-2">근태 수정 요청서</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="f_findId" method="post" action="">
          <div class="form-floating m-3">
            <div class="row mb-3">
              <div class="col-2" style="line-height: 37px"><label for="name">작성자</label></div>
              <div class="col-10" ><input type="text" class="form-control" id="name" name="name" value="이유리" disabled></div>
            </div>
            <div class="row mb-3">
              <div class="col-2" style="line-height: 37px"><label for="name">수정요청일</label></div>
              <div class="col-10" ><input type="date" class="form-control" id="mod_date" name="mod_date" value=""></div>
            </div>
            <div class="row mb-5">
              <div class="col-2" style="line-height: 37px"><label for="name">근태상태</label></div>
              <div class="col-10" ><input type="text" class="form-control" id="state" name="state" value="결근" disabled></div>
            </div>
            <div class="row mb-5">
              <div class="col-2" style="line-height: 37px"><label for="name">요청사유</label></div>
              <div class="col-10" ><textarea type="text" class="form-control" id="mod_content" name="mod_content"></textarea>
            </div>
          </div>

          <div style=" text-align: right;">
            <input type="button" class="btn btn-danger" onclick="insertAttendance()" value="제출"/>
            <input type="button" class="btn btn-danger" data-bs-dismiss="modal" aria-label="Close" value="취소"/>
          </div>

          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>
