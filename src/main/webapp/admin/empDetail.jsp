<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%

    List<Map<String, Object>> empList = (List) request.getAttribute("empList");
    Map<String,Object> rmap = empList.get(0);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>사원정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        const empInfoUpdate = () =>{
            console.log("수정 클릭");
            document.querySelector("#f_member").submit();
        }

        const btn_Cancel = () =>{
            location.href = "/admin/empList";
        }

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
                <a class="text-muted fs-6" href="#">관리자페이지</a>
                <div class="ms-2">></div>
            </div>
            <div class="d-flex align-items-center">
                <div class="text-dark fs-6">사원관리</div>
                <div class="ms-2">></div>
            </div>
            <div class="d-flex align-items-center">
                <div class="text-dark fs-6">사원정보</div>
            </div>
        </div>
        <div class="d-flex align-items-center mt-3">
            <div class="position-relative">
                <div class="position-absolute top-0 start-0"></div>
            </div>
            <div class="d-flex align-items-center ms-2">
                <div class="fw-bold fs-5">사원정보</div>
                <div class="text-muted ms-3">사원정보를 관리 및 수정 할 수 있는 페이지입니다.</div>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="box">
            <div class="container">
                <div class="box-header">
                    <h4 style="font-weight: bold; margin-left: 2rem" >사원추가</h4>
                    <hr />
                </div>
                <div class="box-header">
                    <h3 style="display: flex; align-items: center; justify-content: center;" ><%=rmap.get("NAME")%>님 정보</h3>
                </div>
                <div class="box-header" style="display: flex; align-items: center; justify-content: center;">
                    <img src="/images/go.png" class="img-circle m-5 " alt="User Image" style=" width: 200px; height: 200px; ">
                </div>

                <form  id="f_member" method="get" action="/admin/empInfoUpdate">
                    <input type="hidden" name="emp_no" value="<%=rmap.get("EMP_NO")%>">
                    <div class="row">
                    <div class="col-6 mb-3 mt-3">
                        <label for="name">이름 <span class="text-danger">*</span>
                            <span id="id" class="text-danger" style="display:none" > 2~5글자로 입력해주세요. </span>
                        </label>
                        <input type="text" class="form-control" id="name" name="name" onblur="validateId()" value="<%=rmap.get("NAME")%>">
                    </div>
                    <div class="col-6 mb-3 mt-3">
                        <label for="password">비밀번호 <span class="text-danger">*</span>
                            <span id="pw" class="text-danger" style="display:none"> 대소문자와 숫자 4~12자리로 입력하세요.</span></label>
                        <input type="password" class="form-control" id="password" name="password"  onblur="validatePassword()" value="<%=rmap.get("PASSWORD")%>">
                    </div>
                    </div>

                    <div class="row">
                        <div class="col-6 mb-3 mt-3">
                        <label for="birthdate">생년월일 <span class="text-danger">*</span>
                            <span id="date" class="text-danger" style="display:none"  >생년월일 형식이 아닙니다.</span> </label>
                        <input type="date" class="form-control" id="birthdate"  name="birthdate" onblur="validateBirthdate()" value="<%=rmap.get("BIRTHDATE")%>" >
                    </div>
                    <div class="col-6 mb-3 mt-3">
                        <label for="phone_num">전화번호 <span class="text-danger">*</span>
                            <span id="number" class="text-danger" style="display:none"  >전화번호 형식이 아닙니다.</span> </label>
                        <input type="tel" class="form-control" id="phone_num" name="phone_num" onblur="validatePhone()" value="<%=rmap.get("PHONE_NUM")%>">
                    </div>
                    </div>

                    <div class="row">
                        <div class="col-6 mb-3 mt-3">
                        <label for="email">이메일 <span class="text-danger">*</span>
                            <span id="email1" class="text-danger" style="display:none"  >이메일형식이 아닙니다.</span> </label>
                        <input type="email" class="form-control" id="email" name="email" onblur="validateEmail()" value="<%=rmap.get("EMAIL")%>">
                    </div>
                    <div class="col-6 mb-3 mt-3">
                        <label for="address">주소</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="address" name="address" placeholder="우편번호" aria-describedby="search-btn" value="<%=rmap.get("ADDRESS")%>">
                            <div class="input-group-append">
                                <button class="btn btn-success" type="button" id="search-btn" onclick="openZipcode()">검색</button>
                            </div>
                        </div>
                    </div>
                    </div>

                    <div class="row">
                        <div class="col-6 mb-3 mt-3">
                        <label for="team_no">부서</label>
                        <select class="form-control" id="team_no" name="team_no">
                            <option value="<%=rmap.get("TEAM_NO")%>" selected><%=rmap.get("TEAM_NAME")%></option>
                            <option value="1">경영지원팀</option>
                            <option value="2">운영팀</option>
                            <!-- Add more options as needed -->
                        </select>
                    </div>
                    <div class="col-6 mb-3 mt-3">
                        <label for="emp_position">직급</label>
                        <select class="form-control" id="emp_position" name="emp_position">
                            <option value="<%=rmap.get("EMP_POSITION")%>" selected><%=rmap.get("EMP_POSITION")%></option>
                            <option value="사원">사원</option>
                            <option value="팀장">팀장</option>
                            <!-- Add more options as needed -->
                        </select>
                    </div>
                    </div>

                    <div class="row">
                        <div class="col-6 mb-3 mt-3">
                        <label for="emp_state">상태</label>
                        <select class="form-control" id="emp_state" name="emp_state" >
                            <option value="<%=rmap.get("EMP_STATE")%>" selected><%=rmap.get("EMP_STATE")%></option>
                            <option value="재직">재직</option>
                            <option value="퇴직">퇴직</option>
                            <!-- Add more options as needed -->
                        </select>
                    </div>
                    <div class="col-6 mb-3 mt-3">
                        <label for="hire_date">입사일 <span class="text-danger">*</span>
                            <span id="hdate" class="text-danger" style="display:none"  >형식이 아닙니다.</span> </label>
                        <input type="date" class="form-control" id="hire_date" name="hire_date" onblur="validateEmail()" value="<%=rmap.get("HIRE_DATE")%>">
                    </div>
                    </div>

                    <div class="row">
                        <div class="col-6 mb-3 mt-3">
                        <label for="reg_date">생성일 <span class="text-danger">*</span>
                            <span id="rdate" class="text-danger" style="display:none"  >형식이 아닙니다.</span> </label>
                        <input type="date" class="form-control" id="reg_date" name="reg_date" onblur="validateEmail()" value="<%=rmap.get("REG_DATE")%>">
                    </div>
                        <div class="col-6 mb-3 mt-3">
                        <label for="mod_date">수정일 <span class="text-danger">*</span>
                            <span id="mdate" class="text-danger" style="display:none"  >형식이 아닙니다.</span> </label>
                        <input type="text" class="form-control" id="mod_date" name="mod_date" onblur="validateEmail()" value="<%=rmap.get("MOD_DATE")%>">
                    </div>
                    </div>
                    <div class="row">
                        <div class="col-6 mb-3 mt-3">
                        <label for="retire_date">퇴사일 <span class="text-danger">*</span>
                            <span id="redate" class="text-danger" style="display:none"  >형식이 아닙니다.</span> </label>
                        <input type="text" class="form-control" id="retire_date" name="retire_date" onblur="validateEmail()" value="<%=rmap.get("RETIRE_DATE")%>">
                    </div>

                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-6 mb-3 mt-3" style="display: flex; align-items: center; justify-content: center;">
                        <input
                                type="button"
                                class="btn btn-primary float-right"
                                onclick="btn_Cancel()"
                                value="취소"
                        />

                    </div>
                        <div class="col-6 mb-3 mt-3" style="display: flex; align-items: center; justify-content: center;">
                        <input
                                type="button"
                                class="btn btn-primary float-right"
                                onclick="empInfoUpdate()"
                                value="수정"
                        />

                    </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
