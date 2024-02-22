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
                    <h4 style="font-weight: bold; margin-left: 2rem" >사원정보</h4>
                    <hr />
                </div>
                <div class="box-header">
                    <p style="display: flex; align-items: center; justify-content: flex-end;" >생성일 : <%=rmap.get("REG_DATE")%></p>
                    <p style="display: flex; align-items: center; justify-content: flex-end;" >수정일 : <%=rmap.get("MOD_DATE")%></p>

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
                            <span id="name_" class="text-danger" style="display:none" > 2~5글자로 입력해주세요. </span>
                        </label>
                        <input type="text" class="form-control" id="name" name="name" onblur="validateName()" value="<%=rmap.get("NAME")%>">
                    </div>
                    <div class="col-6 mb-3 mt-3">
                        <label for="password">비밀번호 <span class="text-danger">*</span>
                            <span id="password_" class="text-danger" style="display:none"> 대소문자와 숫자 4~12자리로 입력하세요.</span></label>
                        <input type="password" class="form-control" id="password" name="password"  onblur="validatePassword()" value="<%=rmap.get("PASSWORD")%>">
                    </div>
                    </div>

                    <div class="row">
                        <div class="col-6 mb-3 mt-3">
                        <label for="birthdate">생년월일 <span class="text-danger">*</span>
                            <span id="birthdate_" class="text-danger" style="display:none"  >생년월일 형식이 아닙니다.</span> </label>
                        <input type="date" class="form-control" id="birthdate"  name="birthdate" onblur="validateBirthdate()" value="<%=rmap.get("BIRTHDATE")%>" >
                    </div>
                    <div class="col-6 mb-3 mt-3">
                        <label for="phone_num">전화번호 <span class="text-danger">*</span>
                            <span id="phone_num_" class="text-danger" style="display:none"  >전화번호 형식이 아닙니다.</span> </label>
                        <input type="tel" class="form-control" id="phone_num" name="phone_num" onblur="validatePhone()" value="<%=rmap.get("PHONE_NUM")%>">
                    </div>
                    </div>

                    <div class="row">
                        <div class="col-6 mb-3 mt-3">
                        <label for="email">이메일 <span class="text-danger">*</span>
                            <span id="email_" class="text-danger" style="display:none"  >이메일형식이 아닙니다.</span> </label>
                        <input type="email" class="form-control" id="email" name="email" onblur="validateEmail()" value="<%=rmap.get("EMAIL")%>">
                    </div>
                    <div class="col-6 mb-3 mt-3">
                        <label for="address">주소
                            <span id="address_" class="text-danger" style="display:none"  >주소형식이 아닙니다.</span>
                        </label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="address" name="address" onblur="validateAddress()" placeholder="우편번호" aria-describedby="search-btn" value="<%=rmap.get("ADDRESS")%>">
                            <div class="input-group-append">
                                <button class="btn btn-success" type="button" id="search-btn" onclick="openZipcode()">검색</button>
                            </div>
                        </div>
                    </div>
                    </div>

                    <div class="row">
                        <div class="col-6 mb-3 mt-3">
                        <label for="team_no">부서
                            <span id="team_no_" class="text-danger" style="display:none">부서형식이 아닙니다.</span>
                        </label>
                        <select class="form-control" id="team_no" name="team_no" onblur="validateTeam()">
                            <option value="<%=rmap.get("TEAM_NO")%>" selected><%=rmap.get("TEAM_NAME")%></option>
                            <hr class="dropdown-divider">
                            <option value="1">운영팀</option>
                            <option value="2">경영지원팀</option>
                            <!-- Add more options as needed -->
                        </select>
                    </div>
                    <div class="col-6 mb-3 mt-3">
                        <label for="emp_position">직급
                            <span id="emp_position_" class="text-danger" style="display:none">직급형식이 아닙니다.</span>
                        </label>
                        <select class="form-control" id="emp_position" name="emp_position" onblur="validatePosition()">
                            <option value="<%=rmap.get("EMP_POSITION")%>" selected><%=rmap.get("EMP_POSITION")%></option>
                            <hr class="dropdown-divider">
                            <option value="사원">사원</option>
                            <option value="팀장">팀장</option>
                            <!-- Add more options as needed -->
                        </select>
                    </div>
                    </div>

                    <div class="row">
                        <div class="col-6 mb-3 mt-3">
                            <label for="hire_date">입사일 <span class="text-danger">*</span>
                                <span id="hire_date_" class="text-danger" style="display:none"  >형식이 아닙니다.</span> </label>
                            <input type="date" class="form-control" id="hire_date" name="hire_date" onblur="validateHire()" value="<%=rmap.get("HIRE_DATE")%>">
                        </div>
                        <div class="col-6 mb-3 mt-3">
                            <label for="retire_date">퇴사일 <span class="text-danger">*</span>
                                <span id="retire_date_" class="text-danger" style="display:none"  >형식이 아닙니다.</span> </label>
                            <input type="date" class="form-control" id="retire_date" name="retire_date" onblur="validate()" value="<%=rmap.get("RETIRE_DATE")%>">
                        </div>

                    </div>


                    <div class="row">
                        <div class="col-6 mb-3 mt-3">
                            <label for="emp_state">상태
                                <span id="emp_state_" class="text-danger" style="display:none">형식이 아닙니다.</span>
                            </label>
                            <select class="form-control" id="emp_state" name="emp_state" >
                                <option value="<%=rmap.get("EMP_STATE")%>" selected><%=rmap.get("EMP_STATE")%></option>
                                <hr class="dropdown-divider">
                                <option value="퇴직">퇴직</option>
                                <option value="재직">재직</option>

                                <!-- Add more options as needed -->
                            </select>
                        </div>
                        <div class="col-6 mb-3 mt-3">
                            <label for="emp_access">권한
                                <span id="emp_access_" class="text-danger" style="display:none">형식이 아닙니다.</span>
                            </label>
                            <select class="form-control" id="emp_access" name="emp_access" >
                                <option value="<%=rmap.get("EMP_ACCESS")%>" selected><%=rmap.get("EMP_POSITION")%></option>
                                <hr class="dropdown-divider">
                                <option value="ROLE_USER">사원</option>
                                <option value="ROLE_READER">팀장</option>
                                <!-- Add more options as needed -->
                            </select>
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
    <script>


        // 정규표현식 패턴 상수 선언
        //아이디 정규식표현
        const expIdText = /^[A-Za-z0-9]{4,12}$/;
        //비밀번호 정규식표현
        const expPwText = /^[A-Za-z0-9]{4,12}$/;
        //이름 정규식표현
        const expNameText = /^[가-힣]{2,5}$/;
        //핸드폰 정규식표현
        const expPhoneText = /^\d{3}-\d{3,4}-\d{4}$/;
        //생년월일 정규식표현
        const expDateText = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
        //이메일 정규실표현
        const expEmailText = /^[a-zA-Z0-9._+=-]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/;
        //부서 정규식표현
        const expTeamText = /^[1-9]{1,2}$/;
        //권한 정규식표현
        const expRoleText = /ROLE/;
        //주소 정규식표현
        const expAddressText = /^[가-힣a-zA-Z0-9-.,\s]{1,60}$/;

        const validateName = () => {
            const nmSpan = document.getElementById('name_');
            const mbrNmInput = document.getElementById('name');
            const isValid = expNameText.test(mbrNmInput.value);

            if (isValid) {
                nmSpan.style.display = 'none';
            } else {
                nmSpan.style.display = 'inline';
            }
            return isValid;
        }

        const validatePassword = () => {
            const pwSpan = document.getElementById('password_');
            const mbrPwInput = document.getElementById('password');
            const isValid = expPwText.test(mbrPwInput.value);

            if (isValid) {
                pwSpan.style.display = 'none';
            } else {
                pwSpan.style.display = 'inline';
            }
            return isValid;
        }


        const validateBirthdate = () => {
            const dateSpan = document.getElementById('birthdate_');
            const mbrBirthdateInput = document.getElementById('birthdate');
            const isValid = expDateText.test(mbrBirthdateInput.value);

            if (isValid) {
                dateSpan.style.display = 'none';
            } else {
                dateSpan.style.display = 'inline';
            }
            return isValid;
        }

        const validatePhone = () => {
            const numberSpan = document.getElementById('phone_num_');
            const mbrPhoneInput = document.getElementById('phone_num');
            const isValid = expPhoneText.test(mbrPhoneInput.value);

            if (isValid) {
                numberSpan.style.display = 'none';
            } else {
                numberSpan.style.display = 'inline';
            }
            return isValid;
        }

        const validateEmail = () => {
            const emailSpan = document.getElementById('email_');
            const mbrEmailInput = document.getElementById('email');
            const isValid = expEmailText.test(mbrEmailInput.value);

            if (isValid) {
                emailSpan.style.display = 'none';
            } else {
                emailSpan.style.display = 'inline';
            }
            return isValid;
        }
        const validateTeam = () => {
            const teamSpan = document.getElementById('team_no_');
            const mbrNmInput = document.getElementById('team_no');
            const isValid = expTeamText.test(mbrNmInput.value);

            if (isValid) {
                teamSpan.style.display = 'none';
            } else {
                teamSpan.style.display = 'inline';
            }
            return isValid;
        }

        const validatePosition = () => {
            const positionSpan = document.getElementById('emp_position_');
            const mbrNmInput = document.getElementById('emp_position');
            const isValid = expNameText.test(mbrNmInput.value);

            if (isValid) {
                positionSpan.style.display = 'none';
            } else {
                positionSpan.style.display = 'inline';
            }
            return isValid;
        }

        const validateState  = () => {
            const stateSpan = document.getElementById('emp_state_');
            const mbrNmInput = document.getElementById('emp_state');
            const isValid = expNameText.test(mbrNmInput.value);

            if (isValid) {
                stateSpan.style.display = 'none';
            } else {
                stateSpan.style.display = 'inline';
            }
            return isValid;
        }

        const validateAccess  = () => {
            const acSpan = document.getElementById('emp_access_');
            const mbrNmInput = document.getElementById('emp_access');
            const isValid = expRoleText.test(mbrNmInput.value);
            if (isValid) {
                acSpan.style.display = 'none';
            } else {
                acSpan.style.display = 'inline';
            }
            return isValid;
        }
        const validateHire  = () => {
            const hireSpan = document.getElementById('hire_date_');
            const mbrNmInput = document.getElementById('hire_date');
            const isValid = expDateText.test(mbrNmInput.value);
            if (isValid) {
                hireSpan.style.display = 'none';
            } else {
                hireSpan.style.display = 'inline';
            }
            return isValid;
        }

        const validateAddress  = () => {
            const addressSpan = document.getElementById('address_');
            const mbrNmInput = document.getElementById('address');
            const isValid = expAddressText.test(mbrNmInput.value);
            if (isValid) {
                addressSpan.style.display = 'none';
            } else {
                addressSpan.style.display = 'inline';
            }
            return isValid;
        }

    </script>
</body>
</html>
