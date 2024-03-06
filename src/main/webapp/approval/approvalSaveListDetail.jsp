<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.ApprovalVO" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{임시보관함 상세} -휴가</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
        const saveUpdate=()=>{
            let document_no=document.getElementById('document_no').value;
            let document_category=document.getElementById('document_category').value;
            let document_title=document.getElementById('document_title').value;
            let salary = document.getElementById('salary').value;
            let contract_term = document.getElementById('contract_term').value;
            let start_date=document.getElementById('start_date').value;
            let end_date=document.getElementById('end_date').value;
            let k_name=document.getElementById('k_name').value;
            let state=document.getElementById('state').value;


            $('#document_no').val(document_no);
            $('#document_category').val(document_category);
            $('#document_title').val(document_title);
            $('#salary').val(salary);
            $('#contract_term').val(contract_term);
            $('#start_date').val(start_date);
            $('#end_date').val(end_date);
            $('#k_name').val(k_name);
            $('#state').val(state);

            $('#saveDocumentPost').submit();
        }
    </script>

    <link  rel="stylesheet " href="../css/approvalDocu.css">

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
                    <a class="text-muted fs-6" href="../approval/documentList">전자결재</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">임시보관함</div>
                </div>
            </div>
            <div class="d-flex align-items-center mt-2">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0" ></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">임시보관함</div>
                    <div class="text-muted ms-3">임시보관문서   상세정보 조회할수 있는 페이지입니다.</div>
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
                                <h4 style="font-weight: bold; margin-left: 1.5rem" >임시보관문서 상세 </h4>
                                <hr />
                            </div>

                            <!-- 검색기 시작 !! div 안에 있는 태그 건들지마시오!! -->
                            <div class="row">

<%--추가 수정 부분   --%>

                                <form id="saveDocumentPost" name="saveDocumentPost" action="saveDetailUpdate" method="post">
                                    <div class="frame " id="do_vocation">
                                    <div class="document-section">
                                 <%  List<ApprovalVO> saveDetail = (List<ApprovalVO>) request.getAttribute("saveDetail");
                                    if (saveDetail != null && !saveDetail.isEmpty()) {
                                        ApprovalVO approvalVO = saveDetail.get(0);
                                %>

                                        <input type="text" hidden="hidden" name="document_no" id="document_no" value="<%=approvalVO.getDocument_no()%>">
                                        <div class="item">
                                                <span class="title">사원번호:</span>
                                                <input type="text" class="value-input" id="emp_no"  name="emp_no" value="<%=sessionVO.getEmp_no()%>">
                                            </div>
                                            <div class="item" hidden="hidden">
                                                <span class="title">상태값:</span>
                                            <input type="text" id="state" name="state"    value="대기" >
                                            </div>
                                            <div class="item">
                                                <span class="title">문서제목:</span>
                                                <input type="text" class="value-input" id="document_title" name="document_title" value="<%=approvalVO.getDocument_title()%>"  >
                                            </div>
                                            <div class="item" >
                                                <span class="title">문서타이틀:</span>
                                                <input type="text" class="value-input" id="document_category"  name="document_category" value="<%=approvalVO.getDocument_category()%>" >
                                            </div>
                                            <div class="item">
                                                <span class="title">담당자:</span>
                                                <input type="text" class="value-input" id="approval_name" name="approval_name" value="<%=approvalVO.getApproval_name()%>">
                                            </div>
                                            <div class="item">
                                                <span class="title">신청자:</span>
                                                <input type="text" class="value-input" id="name"  name="name" value="<%=sessionVO.getName()%> " >
                                            </div>
                                            <div class="item">
                                                <span class="title">휴가 사유:</span>
                                                <input type="text" class="value-input" id="dayoff_content" name="dayoff_content" value="<%=approvalVO.getDayoff_content()%>" >
                                            </div>
                                            <div class="item">
                                                <span class="title">휴가시작일:</span>
                                                <input type="date" id="start_date" name="start_date"   value="<%=approvalVO.getStart_date()%>">
                                            </div>
                                            <div class="item">
                                                <span class="title">휴가만료일：</span>
                                                <input type="date" id="end_date" name="end_date"  value="<%=approvalVO.getEnd_date()%>">
                                            </div>
                                            <div class="item">
                                                <span class="title">선수</span>
                                                <input type="text" id="k_name"  name="k_name"  value="<%=approvalVO.getK_name()%>">
                                            </div>

                                            <div class="item">
                                                <span class="title">계약금액 </span>
                                                <input type="text" id="salary"  name="salary"  value="<%=approvalVO.getSalary()%>">
                                            </div>
                                            <div class="item">
                                                <span class="title">계약년수 </span>
                                                <input type="text" id="contract_term"  name="contract_term"  value="<%=approvalVO.getContract_term()%>">
                                            </div>
                                            <%}%>
                                        </div>
                                        <div id ="documentButton " class="col-md-6 d-flex justify-content-end gap-2">
                                            <button type="button"  id="btn_docSubmit" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm"  onclick="saveUpdate()" >제출</button>
                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm" href="./approval/saveList">임시보관함</button>
                                        </div>
                                    </div>
                                </form>
                             </div>

                    </div>
                </div>
            </div>
            </div>
        </section>
        </div>


    </body>
    </html>