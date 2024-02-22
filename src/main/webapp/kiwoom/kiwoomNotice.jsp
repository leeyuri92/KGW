<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.*,com.util.BSPageBar" %>
<%@ page import="com.vo.KiwoomNoticeVO" %>
<%
  int size=0;
  List<KiwoomNoticeVO> kiwoomNoticeList = (List)request.getAttribute("kiwoomNoticeList");
  if(kiwoomNoticeList!=null){
    size=kiwoomNoticeList.size();
  }
  out.print(kiwoomNoticeList);
  //페이징처리
  int numPerPage = 5;
  int nowPage = 0;
  if(request.getParameter("nowPage")!=null){
    nowPage = Integer.parseInt(request.getParameter("nowPage"));
  }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>우리구단 소식</title>

  <!-- Google Font: Source Sans Pro -->
</head>
<script type="text/javascript">
  function searchEnter(event){
    console.log(window.event.keyCode)
    if(window.event.keyCode == 13){
      NoticeSearch()
    }
    event.isComposing//검색후 잔여검색기록 없애는코드
  }
  function kiwoomNoticeSearch(){
    console.log('kiwoomNoticeSearch');
    const gubun = document.querySelector("#gubun").value;
    const keyword = document.querySelector("#keyword").value;
    console.log(`${gubun} , ${keyword}`);
    location.href="/kiwoom/kiwoomNotice?gubun="+gubun+"&keyword="+keyword;
  }

  function kiwoomNoticeForm () {
    location.href = '/kiwoom/kiwoom.jsp';
  }
  const kiwoomDetail=(Board_no) => {
    location.href = '/kiwoom/kiwoomDetail?Board_no='+Board_no;
  }


</script>

<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
  <!-- header start -->
  <%@include file="/include/KGW_bar.jsp"%>
  <link rel="stylesheet" href="/css/kiwoomNoticeCard.css">

  <!-- header end    -->

  <!-- body start    -->
  <div class="content-wrapper">
    <!-- 페이지 path start    -->
    <!-- <div class="card"> -->
    <div class="box-header p-4">
      <div class="d-flex align-items-center">
        <div class="d-flex align-items-center me-2">
          <a class="text-muted fs-6" href="#">우리구단</a>
          <div class="ms-2"></div>
        </div>
        <div class="d-flex align-items-center">
          <div class="text-dark fs-6">우리구단 소식</div>
        </div>
      </div>
      <div class="d-flex align-items-center mt-3">
        <div class="position-relative">
          <div class="position-absolute top-0 start-0"></div>
        </div>
        <div class="d-flex align-items-center ms-2">
          <div class="fw-bold fs-5">우리구단 소식</div>
          <div class="text-muted ms-3">우리구단 소식을 조회할 수 있는 페이지입니다.</div>
        </div>
      </div>
    </div> <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="container">
              <div class="box-header">
                <h4 style="font-weight: bold; margin-left: 2rem">우리구단 소식</h4>
                <hr/>
              </div>

              <!-- 검색기 시작 !! div 안에 있는 태그 건들지마시오!! -->
              <div class="row">
                <div class="col-2">
                  <select id="gubun" class="form-select" aria-label="분류선택">
                    <option value="none">분류선택</option>
                    <option value="board_title">제목</option>
                    <option value="emp_no">작성자</option>
                    <option value="board_content">내용</option>
                  </select>
                </div>
                <div class="col-3">
                  <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                         aria-label="검색어를 입력하세요." aria-describedby="btn_search" onkeyup="searchEnter()"/>
                </div>
                <div class="col-1">
                  <button id="btn_search" class="btn btn-danger" onclick="kiwoomNoticeSearch()">검색</button>
                </div>
                <div class="col-md-6 d-flex justify-content-end">
                  <button type="button" class="btn btn-danger" onclick="kiwoomNoticeForm()">작성</button>
                </div>
              </div>
              <!-- 회원목록 시작 -->
              <div class='board-list'>

                <%  for(int i = nowPage*numPerPage; i < (nowPage*numPerPage)+numPerPage; i++) {
                  if (i == size) break;
                  KiwoomNoticeVO kiwoomnoticeVO = kiwoomNoticeList.get(i);
                %>
                <div class="card mb-3 custom-card">
                  <div class="row g-0">

                    <div class="col-md-4">
                      <img src="..." class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">

                      <div class="card-body">
                        <p class="card-link">
                          <a href="javascript:kiwoomDetail('<%=kiwoomnoticeVO.getBoard_no()%>')">
                            <%=kiwoomnoticeVO.getBoard_title()%>
                          </a>
                        </p>
                        <p class="card-text"><%=kiwoomnoticeVO.getEmp_no()%></p>
                        <p class="card-text"><%=kiwoomnoticeVO.getMod_date()%></p>
                        <p class="card-text">
                          <small class="text-body-secondary"><%=kiwoomnoticeVO.getBoard_no()%></small>
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
                <% } %>
                <hr/>
              </div>

              <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
              <div style="display:flex; justify-content:center;">
                <ul class="pagination">
                  <%
                    String pagePath = "kiwoomNoticeListPage";
                    BSPageBar bspb = new BSPageBar(numPerPage,size,nowPage,pagePath);
                    out.print(bspb.getPageBar());
                  %>
                </ul>
              </div>
              <!-- [[ Bootstrap 페이징 처리  구간  ]] -->

            </div>
            <!-- 회원목록   끝  -->
          </div>
        </div>
      </div>

    </section>
  </div>
</div>

</body>
</html>
