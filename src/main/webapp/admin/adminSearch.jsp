<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>우리구단 소식</title>
    <!-- Google Font: Source Sans Pro -->
</head>

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
                    <a class="text-muted fs-6" href="#">관리자페이지</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">사원관리</div>
                </div>
            </div>
            <div class="d-flex align-items-center mt-3">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0"></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">사원관리</div>
                    <div class="text-muted ms-3">사원을 관리할 수 있는 페이지입니다.</div>
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
                                <h4 style="font-weight: bold; margin-left: 2rem">사원관리</h4>
                                <hr/>
                            </div>

                            <!-- 검색기 시작 !! div 안에 있는 태그 건들지마시오!! -->
                            <div class="row">
                                <div class="col-2">
                                    <select id="gubun" class="form-select" aria-label="분류선택">
                                        <option value="none">분류선택</option>
                                        <option value="name">이름</option>
                                        <option value="emp_no">사번</option>
                                    </select>
                                </div>
                                <div class="col-3">
                                    <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                                           aria-label="검색어를 입력하세요." aria-describedby="btn_search" onkeyup="searchEnter()"/>
                                </div>
                                <div class="col-1">
                                    <button id="btn_search" class="btn btn-danger" onclick="boardSearch()">검색</button>
                                </div>
                                <div class="col-md-3 d-flex justify-content-end">
                                    <button type="button" class="btn btn-danger">선택사원 다운로드</button>
                                </div>
                                <div class="col-md-3 d-flex justify-content-end">
                                    <button type="button" class="btn btn-danger">전체사원 다운로드</button>
                                </div>
                            </div>
                            <!-- 회원목록 시작 -->
                            <div class='board-list'>
                                <table class="table table-hover text-center ">
                                    <thead>
                                    <tr>
                                        <th width="10%" >#</th>
                                        <th width="10%">이름</th>
                                        <th width="10%">사번</th>
                                        <th width="10%">부서</th>
                                        <th width="10%">직급</th>
                                        <th width="15%">이메일</th>
                                        <th width="15%">잔여연차</th>
                                        <th width="15%">증명서</th>
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
        </section>
    </div>
</div>
</body>
</html>
