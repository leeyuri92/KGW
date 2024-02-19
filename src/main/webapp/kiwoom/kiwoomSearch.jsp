<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>우리구단 선수조회</title>
</head>
<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
  <!-- header start -->
  <%@include file="/include/KGW_bar.jsp"%>
  <link rel="stylesheet" href="/kiwoom.css">
  <!-- header end    -->

  <!-- body start    -->
  <div class="content-wrapper">
    <!-- 페이지 path start    -->
    <%-- <div class="card" >--%>
    <div class="box-header p-4">
      <div class="d-flex align-items-center">
        <div class="d-flex align-items-center me-2">
          <a class="text-muted fs-6" href="#">우리구단</a>
          <div class="ms-2">></div>
        </div>
        <div class="d-flex align-items-center">
          <div class="text-dark fs-6">우리구단 선수조회</div>
        </div>
      </div>
      <div class="d-flex align-items-center mt-3">
        <div class="position-relative">
          <div class="position-absolute top-0 start-0"></div>
        </div>
        <div class="d-flex align-items-center ms-2">
          <div class="fw-bold fs-5">우리구단 선수조회</div>
          <div class="text-muted ms-3">우리구단 선수를 조회 할 수 있는 페이지입니다.</div>
        </div>
      </div>
    </div>
    <!-- 페이지 path end -->

    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="container">
              <div class="box-header">
                <h4 style="font-weight: bold; margin-left: 2rem" >우리구단 선수조회</h4>
                <hr />
              </div>
              <!-- 검색기 시작 !! div 안에 있는 태그 건들지마시오!! -->
              <div class="row">
                <div class="col-2">
                  <select id="gubun" class="form-select" aria-label="분류선택">
                    <option value="none">분류선택</option>
                    <option value="b_title">이름</option>
                    <option value="b_writer">등번호</option>
                    <option value="b_content">포지션</option>
                    <option value="b_content">연차</option>
                  </select>
                </div>
                <div class="col-3">
                  <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                         aria-label="검색어를 입력하세요." aria-describedby="btn_search" onkeyup="searchEnter()"/>
                </div>
                <div class="col-1 ">
                  <button id="btn_search" class="btn btn-danger" onclick="boardSearch()">검색</button>
                </div>
              </div>
              <div class='board-list'>
               <div class="row">
                 <div class="col">
                   <div class="card mb-3 mx-auto" style="max-width: 290px;height:180px;">
                     <div class="row g-0">
                       <div class="col-md-4">
                         <img src="/images/profile.jpg" class="img-fluid rounded-start" alt="profile;">
                       </div>
                       <div class="col-md-8">
                         <div class="card-body">
                           <h5 class="card-title">이름</h5>
                           <p class="card-text">포지션</p>
                           <p class="card-text">등번호</p>
                         </div>
                       </div>
                     </div>
                   </div>
                 </div>
                 <div class="col">
                   <div class="card mb-3 mx-auto" style="max-width: 290px;height:180px;">
                     <div class="row g-0">
                       <div class="col-md-4">
                         <img src="/images/profile.jpg" class="img-fluid rounded-start" alt="profile;">
                       </div>
                       <div class="col-md-8">
                         <div class="card-body">
                           <h5 class="card-title">이름</h5>
                           <p class="card-text">포지션</p>
                           <p class="card-text">등번호</p>
                         </div>
                       </div>
                     </div>
                   </div>
                 </div>
                 <div class="col">
                   <div class="card mb-3 mx-auto" style="max-width: 290px;height:180px;">
                     <div class="row g-0">
                       <div class="col-md-4">
                         <img src="/images/profile.jpg" class="img-fluid rounded-start" alt="profile;">
                       </div>
                       <div class="col-md-8">
                         <div class="card-body">
                           <h5 class="card-title">이름</h5>
                           <p class="card-text">포지션</p>
                           <p class="card-text">등번호</p>
                         </div>
                       </div>
                     </div>
                   </div>
                 </div>

               </div>
                  <hr />

                  <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                  <ul class="pagination">
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                  </ul>
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