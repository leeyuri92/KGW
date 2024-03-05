<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.ApprovalVO" %>


<%--<%--%>
<%--    List<ApprovalVO> saveDetail = (List<ApprovalVO>) request.getAttribute("saveDetail");--%>
<%--    if (saveDetail != null && !saveDetail.isEmpty()) {--%>
<%--        ApprovalVO approvalVO = saveDetail.get(0);--%>
<%--        out.print(saveDetail);--%>
<%--%>--%>
<%--<%}%>--%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{임시보관함 상세} -휴가</title>


    <script>

    </script>
</head>

<body>
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
                    <a class="text-muted fs-6" href="#">전자결재</a>
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

                                <div class="col-md-6 d-flex justify-content-end gap-2">
                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm">임시보관함</button>
                                    <button id="btn_search2" class="btn btn-danger" onclick="boardSearch()">기안문서 </button>
                                </div>

                                <form id="saveDocumentPost" name="saveDocumentPost" method="post" action="saveDetailUpdate">
                                <div class="frame " id="save_document">
                                    <div class="document-section">
                                        <%
                                            List<ApprovalVO> saveDetail = (List<ApprovalVO>) request.getAttribute("saveDetail");
                                            if (saveDetail != null && !saveDetail.isEmpty()) {
                                                ApprovalVO approvalVO = saveDetail.get(0);
                                        %>

                                        <div class="item">
                                            <span class="title">가태고리 :</span>
                                            <select id="playersList1" name="document_category">
                                                <option value="document_category">선수관련 </option>
                                                <option value="document_category">휴가관련 </option>
                                            </select>
                                        </div>
                                        <div class="item">
                                            <span class="title">타이틀 :</span>
                                            <input type="text" class="value-input" id="document_title" name=" document_title" value=" <%=approvalVO.getDocument_title()%>" >
                                        </div>
                                        <div class="item">
                                            <span class="title">담당자:</span>
                                            <input type="text" class="value-input" id="approval_name" name= "approval_name" value="<%=approvalVO.getApproval_name()%>" >
                                        </div>
                                        <div class="item">
                                            <span class="title">신청자:</span>
                                            <input type="text" class="value-input" id="name" name="name"  value="<%=sessionVO.getName()%>" >
                                        </div>
                                        <div class="item">
                                            <span class="title">휴가 사유:</span>
                                          <input type="text" class="value-input" id="dayoff_content" name="dayoff_content" value="<%=approvalVO.getDayoff_content()%>" >
                                        </div>
<%--                                        <input type="hidden" id="state" name="state"    value="대기" >--%>
                                        <div class="item">
                                            <span class="title">휴가시작일</span>
                                            <input type="date" id="startDate"  name="start_date" value="<%=approvalVO.getStart_date()%>">
                                        </div>
                                        <div class="item">
                                            <span class="title">휴가만료일</span>
                                            <input type="date" id="endDate"  name="end_date"  value="<%=approvalVO.getEnd_date()%>">
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
                                            <input type="date" id="contract_term"  name="contract_term"  value="<%=approvalVO.getContract_term()%>">
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                                <div  id ="documentButton" class="col-md-6 d-flex justify-content-end gap-2">
                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm" onclick="saveUpdate()">재출</button>
                                </div>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
            </div>

        </section>
    </div>


    <script>
        <%--수정처리 --%>
        const saveUpdate=()=>{
            console.log("update처리");
            document.querySelector("#saveDocumentPost").submit();
        }
    </script>

    </body>
    </html>