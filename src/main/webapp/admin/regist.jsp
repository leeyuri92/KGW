<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <%@include file="/common/bootstrap_common.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
        const memberInsert = () => {
            document.querySelector("#f_member").submit();
    };

    /* 자바 스크립트 부분 */
    </script>
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
                    <a class="text-muted fs-6" href="#">관리자페이지</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">사원추가</div>
                </div>
            </div>
            <div class="d-flex align-items-center mt-3">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0"></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">사원추가</div>
                    <div class="text-muted ms-3">사원을 추가 할 수 있는 페이지입니다.</div>
                </div>
            </div>
        </div>
        <!-- 페이지 path end -->
        <div class="content">
            <div class="box">
                <div class="container">
                    <div class="box-header">
                        <h4 style="font-weight: bold; margin-left: 2rem" >사원추가</h4>
                        <hr />
                    </div>
                    <form  id="f_member" method="post" action="/admin/regist">
                     <div class="form-group mb-3 mt-3">
                      <label for="name">이름 <span class="text-danger">*</span>
                      <span id="id" class="text-danger" style="display:none" > 2~5글자로 입력해주세요. </span>
            </label>
            <input type="text" class="form-control" id="name" name="name" onblur="validateId()"  placeholder="이름를 입력하세요.">
        </div>

        <div class="form-group mb-3 mt-3">
            <label for="password">비밀번호 <span class="text-danger">*</span>
                <span id="pw" class="text-danger" style="display:none"> 대소문자와 숫자 4~12자리로 입력하세요.</span></label>
            <input type="password" class="form-control" id="password" name="password"  onblur="validatePassword()"   placeholder="비밀번호를 입렵하세요.">
        </div>


        <div class="form-group mb-3 mt-3">
            <label for="birthdate">생년월일 <span class="text-danger">*</span>
                <span id="date" class="text-danger" style="display:none"  >생년월일 형식이 아닙니다.</span> </label>
            <input type="date" class="form-control" id="birthdate"  name="birthdate" onblur="validateBirthdate()">
        </div>

        <div class="form-group mb-3 mt-3">
            <label for="phone_num">전화번호 <span class="text-danger">*</span>
                <span id="number" class="text-danger" style="display:none"  >전화번호 형식이 아닙니다.</span> </label>
            <input type="tel" class="form-control" id="phone_num" name="phone_num" onblur="validatePhone()" placeholder="전화번호를 입력해주세요.">
        </div>

        <div class="form-group mb-3 mt-3">
            <label for="email">이메일 <span class="text-danger">*</span>
                <span id="email1" class="text-danger" style="display:none"  >이메일형식이 아닙니다.</span> </label>
            <input type="email" class="form-control" id="email" name="email" onblur="validateEmail()" placeholder="이메일을 입력해주세요.">
        </div>

        <div class="form-group mb-3 mt-3">
            <label for="address">주소</label>
            <div class="input-group">
                <input type="text" class="form-control" id="address" name="address" placeholder="우편번호" aria-describedby="search-btn">
                <div class="input-group-append">
                    <button class="btn btn-success" type="button" id="search-btn" onclick="openZipcode()">검색</button>
                </div>
            </div>
        </div>


        <div class="form-group mb-3 mt-3">
            <label for="team_no">부서</label>
            <select class="form-control" id="team_no" name="team_no">
                <option value="0" selected>부서를 선택해주세요.</option>
                <option value="1">경영지원팀</option>
                <option value="2">운영팀</option>
                <!-- Add more options as needed -->
            </select>
        </div>
                        <div class="form-group mb-3 mt-3">
                            <label for="emp_position">직급</label>
                            <select class="form-control" id="emp_position" name="emp_position">
                                <option value="0" selected>직급을 선택해주세요.</option>
                                <option value="사원">사원</option>
                                <option value="팀장">팀장</option>
                                <!-- Add more options as needed -->
                            </select>
                        </div>
                        <div class="form-group mb-3 mt-3">
                            <label for="emp_state">상태</label>
                            <select class="form-control" id="emp_state" name="emp_state">
                                <option value="0" selected>상태를 선택해주세요.</option>
                                <option value="재직">재직</option>
                                <option value="퇴직">퇴직</option>
                                <!-- Add more options as needed -->
                            </select>
                        </div>
                        <div class="form-group mb-3 mt-3">
                            <label for="hire_date">입사일 <span class="text-danger">*</span>
                                <span id="hdate" class="text-danger" style="display:none"  >형식이 아닙니다.</span> </label>
                            <input type="date" class="form-control" id="hire_date" name="hire_date" onblur="validateEmail()" placeholder="입사일을 입력해주세요.">
                        </div>
                        <div class="form-group mb-3 mt-3">
                            <label for="reg_date">생성일 <span class="text-danger">*</span>
                                <span id="rdate" class="text-danger" style="display:none"  >형식이 아닙니다.</span> </label>
                            <input type="date" class="form-control" id="reg_date" name="reg_date" onblur="validateEmail()" placeholder="생성일을 입력해주세요.">
                        </div>
                        <div class="form-group mb-10 mt-10 p-3">
                            <input
                                    type="button"
                                    class="btn btn-primary float-right"
                                    onclick="memberInsert()"
                                    value="회원가입"
                            />
                        </div>
    </form>
    </div>
</div>
</div>
</div>
    <script>
        //회원가입 우편번호찾기
        // 여기배포햇나? -head에 위치 - 호이스팅이슈
        // 단-DOM 읽혀진 이후에만 접근이 가능하다 - undefined - 배포위치 고려해본다 -기준
        const openZipcode = () => {
            new daum.Postcode({//Postcode객체 생성하기  - 생성하자마자 내부에 구현하기가 전기해고있다
                oncomplete: function(data) {//완료되었을때 - 요청에 대한 응답이 완료되었을때 -이벤트처리
                    let addr = '';
                    if (data.userSelectedType === 'R') {
                        addr = data.roadAddress;//도로명
                    } else {
                        addr = data.jibunAddress;//지번
                    }
                    console.log(data);
                    console.log(addr);
                    //console.log(post.postNum);
                    //setPost({...post, zipcode:data.zonecode, addr:addr}) ;
                    // document.querySelector("#mem_zipcode").value = data.zonecode;//우편번호
                    // document.querySelector("#mem_address").value = addr;//주소
                    document.getElementById("address").value = addr;//주소
                    //document.getElementById("postDetail").focus();
                }
            }).open();
        }
    </script>
</body>
</html>
