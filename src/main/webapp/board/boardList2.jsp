<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>게시판 예시</title>
	  <!-- Google Font: Source Sans Pro -->
	  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
	  <!-- Theme style -->
	  <link rel="stylesheet" href="../../dist/css/adminlte.css">
	  <%@ include file="/common/bootstrap_common.jsp" %>
	  <link rel="stylesheet" href="/css/board.css">
	  <!-- jQuery -->
	  <script src="../../plugins/jquery/jquery.min.js"></script>
	  <!-- AdminLTE App -->
	  <script src="../../dist/js/adminlte.min.js"></script>

<%--  <script type="text/javascript">--%>

<%--	const searchEnter = (event)=> {--%>
<%--		console.log('searchEnter')--%>
<%--		console.log(window.event.keyCode); // 13--%>
<%--		if(window.event.keyCode==13){--%>
<%--			boardSearch(); // 재사용성 ---%>
<%--		}--%>
<%--	}--%>
<%--	const boardSearch = () => {--%>
<%--		console.log('boardSearch');--%>
<%--		const gubun = document.querySelector("#gubun").value;--%>
<%--		const keyword = document.querySelector("#keyword").value;--%>
<%--		console.log(`${gubun} , ${keyword}`);--%>
<%--		location.href="/board/boardList?gubun="+gubun+"&keyword="+keyword;--%>
<%--	}--%>
<%--  	const boardList = () => {--%>
<%--  		location.href="/board/boardList";--%>
<%--  	}--%>
<%--  	const boardInsert = () => {--%>
<%--  		document.querySelector("#f_board").submit(); // form태그에 묶인 컴포넌트 값들이 전송됨--%>
<%--  	}--%>
<%--	const boardDetail = (b_no) => {--%>
<%--		location.href = "/board/boardDetail?b_no="+b_no;--%>
<%--	}--%>
<%--  </script>--%>
  </head>

  <body class="hold-transition sidebar-mini sidebar-collapse">
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
					<a class="text-muted fs-6" href="#">전력분석</a>
					<div class="ms-2">></div>
				</div>
				<div class="d-flex align-items-center">
					<div class="text-dark fs-6">FA선수현황</div>
				</div>
			</div>
			<div class="d-flex align-items-center mt-3">
				<div class="position-relative">
					<div class="position-absolute top-0 start-0" ></div>
				</div>
				<div class="d-flex align-items-center ms-2">
					<div class="fw-bold fs-5">FA선수현황</div>
					<div class="text-muted ms-3">사원 정보를 검색할 수 있는 페이지입니다.</div>
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
								<h2 style="font-weight: bold; margin-left: 2rem" >게시판1</h2>
								<hr />
							</div>

					<!-- 검색기 시작 !! div 안에 있는 태그 건들지마시오!! -->
							<div class="row">
								<div class="col-2">
									<select id="gubun" class="form-select" aria-label="분류선택">
										<option value="none">분류선택</option>
										<option value="b_title">제목</option>
										<option value="b_writer">작성자</option>
										<option value="b_content">내용</option>
									</select>
								</div>
								<div class="col-3">
									<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
										   aria-label="검색어를 입력하세요." aria-describedby="btn_search" onkeyup="searchEnter()"/>
								</div>
								<div class="col-1 ">
									<button id="btn_search" class="btn btn-danger" onclick="boardSearch()">검색</button>
								</div>
								<div class="col-md-6 d-flex justify-content-end ">
									<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm">모달버튼</button>
								</div>
								<%-- 버튼 두 개 일 때 --%>
								<%--			<div class="col-md-6 d-flex justify-content-end gap-2">--%>
								<%--				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm">모달버튼</button>--%>
								<%--				<button id="btn_search2" class="btn btn-danger" onclick="boardSearch()">onclick버튼</button>--%>
								<%--			</div>--%>
							</div>
							<!-- 검색기 끝 -->

							<!-- 회원목록 시작 -->
							<div class='board-list'>
								<table class="table table-hover text-center ">
									<thead>
										<tr>
											<th width="10%" >#</th>
											<th width="30%">제목</th>
											<th width="15%">컬럼1</th>
											<th width="15%">컬럼2</th>
											<th width="15%">컬럼3</th>
											<th width="15%">컬럼4</th>
										</tr>
									</thead>
									<tbody>
<%--									<%--%>
<%--										for(int i=0;i<size;i++){--%>
<%--											Map<String,Object> rmap = bList.get(i);--%>
<%--									%>--%>
<%--									<tr>--%>
<%--										<td><%=rmap.get("B_NO") %></td>--%>
<%--										<td>--%>
<%--											<a href="javascript:boardDetail('<%=rmap.get("B_NO") %>')"> <%=rmap.get("B_TITLE") %></a>--%>
<%--										</td>--%>
<%--										<td><%=rmap.get("B_FILE") %>	</td>--%>
<%--										<td><%=rmap.get("B_WRITER") %></td>--%>
<%--										<td><%=rmap.get("B_HIT") %></td>--%>
<%--										<td><%=rmap.get("B_HIT") %></td>--%>
<%--									</tr>--%>
<%--									<%--%>
<%--										}--%>
<%--									%>--%>
									</tbody>
								</table>
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
								<!-- [[ Bootstrap 페이징 처리  구간  ]] -->
							</div>
							<!-- 회원목록   끝  -->
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<!-- /.box-header -->
	<%--					<div class="box-body">--%>
							<div class="row">
								<div class="col-md-8">
									<div class="container">
										<div class="box-header">
											<h2 style="font-weight: bold; margin-left: 2rem">게시판2</h2>
											<hr />
										</div>

										<!-- 검색기 시작 !! div 안에 있는 태그 건들지마시오!! -->
										<div class="row">
											<div class="col-2">
												<select id="gubun" class="form-select" aria-label="분류선택">
													<option value="none">분류선택</option>
													<option value="b_title">제목</option>
													<option value="b_writer">작성자</option>
													<option value="b_content">내용</option>
												</select>
											</div>
											<div class="col-3">
												<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
													   aria-label="검색어를 입력하세요." aria-describedby="btn_search" onkeyup="searchEnter()"/>
											</div>
											<div class="col-1 ">
												<button id="btn_search" class="btn btn-danger" onclick="boardSearch()">검색</button>
											</div>
											<div class="col-md-6 d-flex justify-content-end ">
												<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm">모달버튼</button>
											</div>
											<%-- 버튼 두 개 일 때 --%>
											<%--			<div class="col-md-6 d-flex justify-content-end gap-2">--%>
											<%--				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm">모달버튼</button>--%>
											<%--				<button id="btn_search2" class="btn btn-danger" onclick="boardSearch()">onclick버튼</button>--%>
											<%--			</div>--%>
										</div>
										<!-- 검색기 끝 -->

										<!-- 회원목록 시작 -->
										<div class='board-list'>
											<table class="table table-hover text-center ">
												<thead>
												<tr>
													<th width="10%" >#</th>
													<th width="30%">제목</th>
													<th width="15%">컬럼1</th>
													<th width="15%">컬럼2</th>
													<th width="15%">컬럼3</th>
													<th width="15%">컬럼4</th>
												</tr>
												</thead>
												<tbody>
<%--												<%--%>
<%--													for(int i=0;i<size;i++){--%>
<%--														Map<String,Object> rmap = bList.get(i);--%>
<%--												%>--%>
<%--												<tr>--%>
<%--													<td><%=rmap.get("B_NO") %></td>--%>
<%--													<td>--%>
<%--														<a href="javascript:boardDetail('<%=rmap.get("B_NO") %>')"> <%=rmap.get("B_TITLE") %></a>--%>
<%--													</td>--%>
<%--													<td><%=rmap.get("B_FILE") %>	</td>--%>
<%--													<td><%=rmap.get("B_WRITER") %></td>--%>
<%--													<td><%=rmap.get("B_HIT") %></td>--%>
<%--													<td><%=rmap.get("B_HIT") %></td>--%>
<%--												</tr>--%>
<%--												<%--%>
<%--													}--%>
<%--												%>--%>
												</tbody>
											</table>
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
											<!-- [[ Bootstrap 페이징 처리  구간  ]] -->
										</div>
										<!-- 회원목록   끝  -->
									</div>
									<!-- /.chart-responsive -->
								</div>
								<!-- /.col -->
								<div class="col-md-4">
									<div class="box-header">
										<h2 style="font-weight: bold; margin-left: 2rem">게시판3</h2>
										<hr />
									</div>
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
						<!-- ./box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-8">
					<!-- TABLE: LATEST ORDERS -->
					<div class="box">
						<div class="container">
							<div class="box-header">
								<h2 style="font-weight: bold; margin-left: 2rem">게시판4 <small> 클릭기능 없는건 hover 뺏음</small></h2>
								<hr />
							</div>

							<!-- 검색기 시작 !! div 안에 있는 태그 건들지마시오!! -->
							<div class="row">
								<div class="col-2">
									<select id="gubun" class="form-select" aria-label="분류선택">
										<option value="none">분류선택</option>
										<option value="b_title">제목</option>
										<option value="b_writer">작성자</option>
										<option value="b_content">내용</option>
									</select>
								</div>
								<div class="col-3">
									<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
										   aria-label="검색어를 입력하세요." aria-describedby="btn_search" onkeyup="searchEnter()"/>
								</div>
								<div class="col-1 ">
									<button id="btn_search" class="btn btn-danger" onclick="boardSearch()">검색</button>
								</div>
								<div class="col-md-6 d-flex justify-content-end ">
									<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm">모달버튼</button>
								</div>
								<%-- 버튼 두 개 일 때 --%>
								<%--			<div class="col-md-6 d-flex justify-content-end gap-2">--%>
								<%--				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm">모달버튼</button>--%>
								<%--				<button id="btn_search2" class="btn btn-danger" onclick="boardSearch()">onclick버튼</button>--%>
								<%--			</div>--%>
							</div>
							<!-- 검색기 끝 -->

							<!-- 회원목록 시작 -->
							<div class='board-list'>
								<table class="table text-center ">
									<thead>
									<tr>
										<th width="10%" >#</th>
										<th width="30%">제목</th>
										<th width="15%">컬럼1</th>
										<th width="15%">컬럼2</th>
										<th width="15%">컬럼3</th>
										<th width="15%">컬럼4</th>
									</tr>
									</thead>
									<tbody>
<%--									<%--%>
<%--										for(int i=0;i<size;i++){--%>
<%--											Map<String,Object> rmap = bList.get(i);--%>
<%--									%>--%>
<%--									<tr>--%>
<%--										<td><%=rmap.get("B_NO") %></td>--%>
<%--										<td>--%>
<%--											<a href="javascript:boardDetail('<%=rmap.get("B_NO") %>')"> <%=rmap.get("B_TITLE") %></a>--%>
<%--										</td>--%>
<%--										<td><%=rmap.get("B_FILE") %>	</td>--%>
<%--										<td><%=rmap.get("B_WRITER") %></td>--%>
<%--										<td><%=rmap.get("B_HIT") %></td>--%>
<%--										<td><%=rmap.get("B_HIT") %></td>--%>
<%--									</tr>--%>
<%--									<%--%>
<%--										}--%>
<%--									%>--%>
									</tbody>
								</table>
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
								<!-- [[ Bootstrap 페이징 처리  구간  ]] -->
							</div>
							<!-- 회원목록   끝  -->
						</div>
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->

				<div class="col-md-4">
					<div class="box">
						<div class="container">
							<div class="box-header">
								<h2 style="font-weight: bold; margin-left: 2rem">게시판5</h2>
								<hr />
							</div>
							<div>
								아무거나
							</div>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</section>
	</div>
	<!-- content-wrapper end-->
	</div>
  <!-- body end   -->



	<!-- ========================== [[ 게시판 Modal ]] ========================== -->
<%--	<div class="modal" id="boardForm">--%>
<%--  		<div class="modal-dialog modal-dialog-centered">--%>
<%--	<div class="modal-content">--%>

<%--	  <!-- Modal Header -->--%>
<%--	  <div class="modal-header">--%>
<%--		<h4 class="modal-title">게시판</h4>--%>
<%--		<button type="button" class="btn-close" data-bs-dismiss="modal"></button>--%>
<%--	  </div>--%>
<%--	  <!-- Modal body -->--%>
<%--	  <div class="modal-body">--%>
<%--		<!-- <form id="f_board" method="get" action="./boardInsert"> -->--%>
<%--		<form id="f_board" method="post" enctype="multipart/form-data" action="./boardInsert">--%>
<%--		  <input type="hidden" name="method" value="boardInsert">--%>
<%--		  <div class="form-floating mb-3 mt-3">--%>
<%--			<input type="text"  class="form-control" id="b_title" name="b_title" placeholder="Enter 제목" />--%>
<%--			<label for="b_title">제목</label>--%>
<%--		  </div>--%>
<%--		  <div class="form-floating mb-3 mt-3">--%>
<%--			<input type="text"  class="form-control" id="b_writer" name="b_writer" placeholder="Enter 작성자" />--%>
<%--			<label for="b_writer">작성자</label>--%>
<%--		  </div>--%>
<%--		  <div class="form-floating mb-3 mt-3">--%>
<%--			<textarea rows="5" class="form-control h-25" aria-label="With textarea" id="b_content" name="b_content"></textarea>--%>
<%--		  </div>--%>
<%--		  <div class="input-group mb-3">--%>
<%--			  <input type="file" class="form-control" id="b_file" name="b_file">--%>
<%--			  <label class="input-group-text" for="b_file">Upload</label>--%>
<%--		  </div>--%>
<%--		</form>--%>
<%--	  </div>--%>
<%--	  <div class="modal-footer">--%>
<%--		<input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="boardInsert()"  value="저장">--%>
<%--		<input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="닫기">--%>
<%--	  </div>--%>

	</div>
  </div>
	</div>
	<!-- ========================== [[ 게시판 Modal ]] ========================== -->
</body>
</html>