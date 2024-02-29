<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.DocumentVO,com.vo.ApprovalVO" %>
<%@ page import="com.google.gson.Gson" %>
<%
    List<Map<String, Object>> list2 = (List<Map<String,Object>>) request.getAttribute("list2");
    int size=0;
    if(list2!=null){
        size=list2.size();
    }


%>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>기안 문서</title>




    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>





    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const navLinks = document.querySelectorAll('.navbar-nav .nav-link'); //nav 링크전채 확보
            const frames = document.querySelectorAll('.frame'); // frame 링크 전채 확보

            // 디폴트로 첫 휴가문서 보여주기
            frames.forEach((frame, index) => frame.style.display = index === 0 ? 'block' : 'none');
            navLinks[0].classList.add('active');

            navLinks.forEach(link => link.addEventListener('click', e => {
                e.preventDefault();

                const targetId = link.getAttribute('data-target'); //클릭 이밴트 발동시 id 식별
                if (!targetId) return; // data-target 없는경우  리턴

                frames.forEach(frame => frame.style.display = frame.id === targetId ? 'block' : 'none'); // id값 맞는 frame 만 보여주기
                navLinks.forEach(nav => nav.classList.toggle('active', nav === link)); // 업데이트 처리
            }));
        });




    </script>
    <link  rel="stylesheet " href="../css/approvalDocu.css">
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
                    <div class="text-dark fs-6">문서함</div>
                </div>

            </div>
            <div class="d-flex align-items-center mt-2">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0" ></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">기안문서 </div>
                    <div class="text-muted ms-3">문서 을 기안할수 있는 페이지입니다.</div>
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
                                <h4 style="font-weight: bold; margin-left: 1.5rem" > 기안문서 </h4>
                                <hr />
                            </div>
                            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                <div class="container-fluid">
                                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                                        <span class="navbar-toggler-icon"></span>
                                    </button>
                                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                                        <div class="navbar-nav">
                                            <a class="nav-link " href="#" data-target="do_vocation">휴가문서</a>
                                            <a class="nav-link" href="#" data-target="do_pla_a">계약문서</a>
                                            <a class="nav-link" href="#" data-target="do_pla_b">방출문서</a>
                                            <a class="nav-link" href="#" data-target="do_pla_c">영입문서</a>
                                        </div>
                                    </div>
                                </div>
                            </nav>




                            <div class="frame " id="do_vocation">   <%--휴가문서--%>
                                <div class="document-section">
                                    <div class="item">
                                        <span class="title">사원번호:</span>
                                        <input type="text" class="value-input" id="pla_depat_no" value="숫자값">
                                    </div>
                                    <div class="item">
                                        <span class="title">문서제목:</span>
                                        <input type="text" class="value-input" id="pla_depart_title" value="휴가관련"  readonly>
                                    </div>
                                    <div class="item">
                                        <span class="title">문서타이틀:</span>
                                        <input type="text" class="value-input" id="pla_departTitle" value="휴가관련" readonly>
                                    </div>
                                    <div class="item">
                                        <span class="title">담당자:</span>
                                        <% for (int i = 0; i < size; i++) {
                                            ApprovalVO approvalVO = (ApprovalVO) list2.get(i);
                                            if(approvalVO.getName()!=null) {
                                        %>
                                        <input type="text" class="value-input" id="pla_manager" value="<%= approvalVO.getEmp_no()%>"hidden="hidden"> 김운영
                                        <% }} %>
                                    </div>
                                    <div class="item">
                                        <span class="title">신청자:</span>
                                        <input type="text" class="value-input" id="va_applicant" value="자동불러옴" readonly>
                                    </div>
                                    <div class="item">
                                        <span class="title">휴가 사유:{insert}</span>
                                        <select id="leaveReason">
                                            <option value="sickLeave">병가</option>
                                            <option value="annualLeave">연차</option>
                                            <option value="familyEvent">경조사</option>
                                        </select>
                                    </div>
                                    <div class="item">
                                        <span class="title">휴가시작일:</span>
                                        <input type="date" id="startDate" value="2024-01-12">
                                    </div>
                                    <div class="item">
                                        <span class="title">휴가만료일：</span>
                                        <input type="date" id="endDate" value="2024-01-15">
                                    </div>
                                    <div    class="text-wrapper-2">상기와 같이 휴가  희망함</div>
                                </div>
                            </div>

                            <div class="frame" id="do_pla_a"> <%--계약연장 문서--%>
                                <div class="document-section">
                                    <!-- Existing items: 부서, 담당자, 신청자 -->
                                    <div class="item">
                                        <span class="title">사원번호:</span>
                                        <input type="text" class="value-input" id="pla2_depat_no" value="숫자값">
                                    </div>
                                    <div class="item">
                                        <span class="title">문서제목:</span>
                                        <input type="text" class="value-input" id="pla2_depart_title" value="선수관련"  readonly>
                                    </div>
                                    <div class="item">
                                        <span class="title">문서타이틀:</span>
                                        <input type="text" class="value-input" id="pla2_departTitle" value="선수관련" readonly>
                                    </div>
                                    <div class="item">
                                        <span class="title">담당자:</span>
                                        <% for (int i = 0; i < size; i++) {
                                            ApprovalVO approvalVO = (ApprovalVO) list2.get(i);
                                            if(approvalVO.getName()!=null) {
                                        %>
                                        <input type="text" class="value-input" id="pla3_manager" value="<%= approvalVO.getEmp_no() %>"hidden="hidden"> 김운영
                                        <% }} %>
                                    </div>
                                    <div class="item">
                                        <span class="title">신청자:</span>
                                        <input type="text" class="value-input" id="pla2_applicant" value="자동불러옴" readonly>
                                    </div>

                                    <div class="item">
                                        <span class="title">계약연장  선수:</span>
                                        <select id="playersList3" name="playersList3">
                                                 <% for (int i = 0; i < size; i++) {
                                                   ApprovalVO approvalVO = (ApprovalVO) list2.get(i);
                                                   if(approvalVO.getK_name() != null) {
                                                   %>
                                                   <option value="<%= approvalVO.getK_name() %>"><%= approvalVO.getK_name() %></option>
                                                   <% }} %>

                                        </select>

                                    </div>
                                    <div class="item flex-row">
                                        <div class="flex-item">
                                            <span class="title">연봉:</span>
                                            <input type="text" class="value-input short-input" id="salary" placeholder="연봉 입력">
                                        </div>
                                        <div class="flex-item">
                                            <span class="title">계약년수:</span>
                                            <input type="text" class="value-input short-input" id="contractYears" placeholder="계약년수 입력">
                                        </div>
                                    </div>
                                    <div class="text-wrapper-2">상기와 같이 계약연장 희망함</div>
                                </div>
                            </div>


                            <div class="frame" id="do_pla_b"><%-- 방출문서--%>
                                <div class="document-section">
                                        <div class="item">
                                            <span class="title">사원번호:</span>
                                            <input type="text" class="value-input" id="pla3_depat_no" value="숫자값">
                                        </div>
                                        <div class="item">
                                            <span class="title">문서제목:</span>
                                            <input type="text" class="value-input" id="pla3_depart_title" value="선수관련"  readonly>
                                        </div>
                                        <div class="item">
                                            <span class="title">문서타이틀:</span>
                                            <input type="text" class="value-input" id="pla3_departTitle" value="선수관련" readonly>
                                        </div>
                                        <div class="item">
                                            <span class="title">담당자:</span>
                                            <% for (int i = 0; i < size; i++) {
                                                ApprovalVO approvalVO = (ApprovalVO) list2.get(i);
                                                if(approvalVO.getName()!=null) {
                                            %>
                                            <input type="text" class="value-input" id="pla3_manager" value="<%= approvalVO.getEmp_no() %>"hidden="hidden"> 김운영
                                            <% }} %>
                                        </div>
                                    <div class="item">
                                        <span class="title">신청자:</span>
                                        <input type="text" class="value-input" id="pla1_applicant" value="자동불러옴" readonly>
                                    </div>
                                    <div class="item">
                                        <span class="title">방출선수:</span>
                                        <select id="myTeamPlayers">
                                            <% for (int i = 0; i < size; i++) {
                                                ApprovalVO approvalVO = (ApprovalVO) list2.get(i);
                                                if(approvalVO.getK_name() != null) {
                                            %>
                                            <option value="<%= approvalVO.getK_name() %>"><%= approvalVO.getK_name() %></option>
                                            <% }} %>
                                            <option value="동적value">testoption</option>
                                        </select>
                                    </div>
                                    <div class="text-wrapper-2">상기와 같이 방출 희망함</div>
                                </div>
                            </div>


                            <div class="frame" id="do_pla_c"> <%--영입 문서--%>
                                <div class="document-section">
                                    <div class="item">
                                        <span class="title">사원번호:</span>
                                        <input type="text" class="value-input" id="pla4_depat_no" value="숫자값">
                                    </div>
                                    <div class="item">
                                        <span class="title">문서제목:</span>
                                        <input type="text" class="value-input" id="pla4_depart_title" value="선수관련"  readonly>
                                    </div>
                                    <div class="item">
                                        <span class="title">문서타이틀:</span>
                                        <input type="text" class="value-input" id="pla4_departTitle" value="선수관련" readonly>
                                    </div>
                                    <div class="item">
                                        <span class="title">담당자:</span>
                                        <% for (int i = 0; i < size; i++) {
                                            ApprovalVO approvalVO = (ApprovalVO) list2.get(i);
                                            if(approvalVO.getName()!=null) {
                                        %>
                                        <input type="text" class="value-input" id="pla3_manager" value="<%= approvalVO.getEmp_no() %>"hidden="hidden"> 김운영
                                        <% }} %>
                                    </div>
                                    <div class="item">
                                        <span class="title">신청자:</span>
                                        <input type="text" class="value-input" id="pla3_applicant" value="자동불러옴" readonly>
                                    </div>
                                    <div class="item">
                                        <span class="title">영입 선수:</span>
                                        <select id="playersList">
                                            <% for (int i = 0; i < size; i++) {
                                                ApprovalVO approvalVO = (ApprovalVO) list2.get(i);
                                                if(approvalVO.getK_name() != null) {
                                            %>
                                            <option value="<%= approvalVO.getK_no() %>"><%= approvalVO.getK_name() %></option>
                                            <% }} %>
                                        </select>
                                    </div>
                                    <div class="text-wrapper-2">상기와 같이 영입 희망함</div>
                                </div>



    </div>
                        <div  id ="documentButton" class="col-md-6 d-flex justify-content-end gap-2">
                            <button  type="button"  id="submitEv" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm"  onclick="" >재출</button>
                            <button id="btn_search2" class="btn btn-danger" onclick="boardSearch()">임시보관 </button>
                            <button id="btn_search3" class="btn btn-danger" onclick="Search()">삭제 </button>
                        </div>
    <!-- content-wrapper end-->
<!-- body end   -->

                            <script>
                                $(document).ready(function() {
                                    $('#submitEv').click(function(event) {
                                        event.preventDefault();

                                        let selectedDivId = $('.frame:visible').attr('id');
                                        let formData = {};

                                        switch (selectedDivId) {
                                            case 'do_pla_c':
                                                let selectedOptionValue = $('#playersList').val();
                                                formData = {
                                                    emp_no: $('#pla4_depat_no').val(),
                                                    document_title: $('#pla4_depart_title').val(),
                                                    document_category: $('#pla4_departTitle').val(),
                                                    approval_empNo: $('#pla3_manager').val(),
                                                    selectedOption: selectedOptionValue
                                                };
                                                break;
                                            // Add cases for other frames if needed
                                        }

                                        $.ajax({
                                            type: 'POST',
                                            url: './approvalInsert',
                                            data: formData,
                                            success: function (response) {
                                                console.log('요청성공', response);
                                            },
                                            error: function (error) {
                                                console.error('실패', error);
                                            }
                                        });
                                    });
                                });
                            </script>


</body>
</html>