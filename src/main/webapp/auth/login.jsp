<%----------------------------------------------------------
  이름 : 이유리
  날짜 : 2024-02-18
  내용 : login페이지
----------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <%@include file="/common/bootstrap_common.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/login.css">

    <script type="text/javascript">
        /* 자바 스크립트 부분 */

    </script>
</head>
<body>
<section>
    <div class="login-container">
        <form class="login-form">
            <h1 class="mb-4">로그인</h1>
            <p class="mb-4">KIWOOM 구단에 오신 것을 환영합니다.</p>
            <div class="mb-1">
                <label for="employee-id" class="form-label">사원번호</label>
                <input type="text" id="employee-id" class="form-control" placeholder="사원번호를 입력하세요.">
            </div>
            <div class="mb-2 login-options">
                <input type="checkbox" id="remember-me" class="form-check-input">
                <label for="remember-me" class="form-check-label">아이디 기억하기</label>
            </div>
            <div class="mb-2">
                <label for="password" class="form-label">비밀번호</label>
                <input type="password" id="password" class="form-control "  placeholder="비밀번호를 입력하세요.">
            </div>
            <button type="submit" class="btn btn-sm btn-outline-dark">LOGIN</button>
            <div class="d-flex justify-content-between mt-2 gap-2" >
                <button type="button" class="btn btn-sm btn-outline-dark" data-bs-toggle="modal" data-bs-target="#findID">아이디찾기</button>
                <button type="button" class="btn btn-sm btn-outline-dark" data-bs-toggle="modal" data-bs-target="#findPW">비밀번호찾기</button>
            </div>
        </form>
    </div>
</section>

<!-- ========================== [[ find ID Modal Start ]] ========================== -->
<div class="modal" id="findID">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2">아이디 찾기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-5 pt-0">
                <form id="f_findId" method="post" action="/findId">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control rounded-3" id="mbr_nm" name="mbr_nm" placeholder="Leave a comment here">
                        <label for="mbr_nm">이름 입력</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control rounded-3" id="mbr_email" name="mbr_email" placeholder="name@example.com">
                        <label for="mbr_email">이메일주소 입력</label>
                    </div>
                    <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit" style="background-color: #652C2C;"  onclick="findId()">찾기</button>
                    <%--                    <small class="text-body-secondary">아이디 바로 보여주기 구현</small>--%>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- ========================== [[ find ID Modal End ]] ========================== -->

<!-- ========================== [[ find PW Modal Start ]] ========================== -->
<div class="modal " id="findPW">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2">비밀번호 찾기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-0">
                <%--                <form id="findID" method="get" action="/컨트롤러메소드?">--%>
                <form class="">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control rounded-3" id="floatingPW_id" placeholder="ID">
                        <label for="floatingPW_id">아이디 입력</label>
                    </div>
                    <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit"  style="background-color: #652C2C;" onclick="findPW()">찾기</button>
                    <small class="text-body-secondary">입력하신 이메일로 임시비밀번호를 보내드립니다.</small>

                </form>
            </div>
        </div>
    </div>
</div>
<!-- ========================== [[ find PW Modal End ]] ========================== -->

</body>
</html>