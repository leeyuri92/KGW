<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.EmpVO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.StandardCopyOption" %>
<%
  EmpVO empDetail = (EmpVO)request.getAttribute("empDetail");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>사원정보</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/signature_pad/1.5.3/signature_pad.min.js"></script>
  <script type="text/javascript">
      const empDetailUpdate = () =>{
          console.log("수정 클릭");
          document.querySelector("#f_member").submit();
      }

      const btn_Cancel = () =>{
          location.href = "/";
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
          <a class="text-muted fs-6" href="/">Home</a>
          <div class="ms-2">></div>
        </div>
        <div class="d-flex align-items-center">
          <div class="text-dark fs-6">마이페이지</div>
        </div>
      </div>
      <div class="d-flex align-items-center mt-3">
        <div class="position-relative">
          <div class="position-absolute top-0 start-0"></div>
        </div>
        <div class="d-flex align-items-center ms-2">
          <div class="fw-bold fs-5">마이페이지</div>
          <div class="text-muted ms-3">사원정보를 관리 및 수정 할 수 있는 페이지입니다.</div>
        </div>
      </div>
    </div>
    <div class="content">
      <div class="box">
        <div class="container">
          <div class="box-header">
            <h4 style="font-weight: bold; margin-left: 2rem" >프로필 정보</h4>
            <hr />
          </div>
          <div class="box-header">
            <p style="display: flex; align-items: center; justify-content: flex-end;" >생성일 : <%=empDetail.getReg_date()%></p>
            <p style="display: flex; align-items: center; justify-content: flex-end;" >수정일 : <%=empDetail.getMod_date()%></p>
          </div>
          <div class="box-header">
            <h3 style="display: flex; align-items: center; justify-content: center;" ><%=empDetail.getName()%>님 정보</h3>
          </div>
          <div class="row">
            <div class="col-2">
              <div class="signImg" style="border: 2px solid grey; width: 200px; height: 200px">
                <img id="signImage" src="/fileUpload/sign/<%=empDetail.getEmp_no()%>.png" style="width: 190px; height: 190px" class="sign" alt="sign" data-bs-toggle="modal" data-bs-target="#signSelect">
              </div>
            </div>
            <div class="col-8">
              <div class="box-header" style="display: flex; align-items: center; justify-content: center;">
                <img src="/images/<%=empDetail.getProfile_img()%>" class="img-circle m-5 " alt="User Image" style=" width: 200px; height: 200px; ">
              </div>
            </div>
          </div>

          <form  id="f_member" method="get" action="/empDetailUpdate">
            <input type="hidden" name="emp_no" value="<%=empDetail.getEmp_no()%>">
            <div class="row">
              <div class="col-6 mb-3 mt-3">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" name="name" onblur="validateName()" value="<%=empDetail.getName()%>" disabled>
              </div>
              <div class="col-6 mb-3 mt-3">
                <label for="password">비밀번호 <span class="text-danger">*</span>
                  <span id="password_" class="text-danger" style="display:none"> 대소문자와 숫자 4~12자리로 입력하세요.</span></label>
                <input type="password" class="form-control" id="password" name="password"  onblur="validatePassword()" value="<%=empDetail.getPassword()%>">
              </div>
            </div>

            <div class="row">
              <div class="col-6 mb-3 mt-3">
                <label for="birthdate">생년월일</label>
                <input type="date" class="form-control" id="birthdate"  name="birthdate" onblur="validateBirthdate()" value="<%=empDetail.getBirthdate()%>" disabled>
              </div>
              <div class="col-6 mb-3 mt-3">
                <label for="phone_num">전화번호 <span class="text-danger">*</span>
                  <span id="phone_num_" class="text-danger" style="display:none"  >전화번호 형식이 아닙니다.</span> </label>
                <input type="tel" class="form-control" id="phone_num" name="phone_num" onblur="validatePhone()" value="<%=empDetail.getPhone_num()%>">
              </div>
            </div>

            <div class="row">
              <div class="col-6 mb-3 mt-3">
                <label for="email">이메일 <span class="text-danger">*</span>
                  <span id="email_" class="text-danger" style="display:none"  >이메일형식이 아닙니다.</span> </label>
                <input type="email" class="form-control" id="email" name="email" onblur="validateEmail()" value="<%=empDetail.getEmail()%>">
              </div>
              <div class="col-6 mb-3 mt-3">
                <label for="address">주소
                  <span id="address_" class="text-danger" style="display:none"  >주소형식이 아닙니다.</span>
                </label>
                <div class="input-group">
                  <input type="text" class="form-control" id="address" name="address" onblur="validateAddress()" placeholder="우편번호" aria-describedby="search-btn" value="<%=empDetail.getAddress()%>">
                  <div class="input-group-append">
                    <button class="btn btn-success" type="button" id="search-btn" onclick="openZipcode()">검색</button>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-6 mb-3 mt-3">
                <label for="team_no">부서</label>
                <select class="form-control" id="team_no" name="team_no" onblur="validateTeam()" disabled>
                  <option value="<%=empDetail.getTeam_no()%>" selected><%=empDetail.getTeam_name()%></option>
                  <hr class="dropdown-divider">
                  <option value="1">운영팀</option>
                  <option value="2">지원팀</option>
                  <!-- Add more options as needed -->
                </select>
              </div>
              <div class="col-6 mb-3 mt-3">
                <label for="emp_position">직급</label>
                <select class="form-control" id="emp_position" name="emp_position" onblur="validatePosition()" disabled>
                  <option value="<%=empDetail.getEmp_position()%>" selected><%=empDetail.getEmp_position()%></option>
                  <hr class="dropdown-divider">
                  <option value="사원">사원</option>
                  <option value="팀장">팀장</option>
                  <!-- Add more options as needed -->
                </select>
              </div>
            </div>

            <div class="row">
              <div class="col-6 mb-3 mt-3">
                <label for="hire_date">입사일</label>
                <input type="date" class="form-control" id="hire_date" name="hire_date" onblur="validateHire()" value="<%=empDetail.getHire_date()%>" disabled>
              </div>
              <div class="col-6 mb-3 mt-3">
                <label for="retire_date">퇴사일</label>
                <input type="date" class="form-control" id="retire_date" name="retire_date" onblur="validate()" value="<%=empDetail.getRetire_date()%>" disabled>
              </div>

            </div>


            <div class="row">
              <div class="col-6 mb-3 mt-3">
                <label for="emp_state">상태</label>
                <select class="form-control" id="emp_state" name="emp_state"  disabled>
                  <% if (empDetail.getEmp_state().equals("0")){ %>
                  <option value="<%=empDetail.getEmp_state()%>" selected>퇴직</option>
                  <% }else{ %>
                  <option value="<%=empDetail.getEmp_state()%>" selected>재직</option>
                  <%  } %>
                  <hr class="dropdown-divider">
                  <option value="0">퇴직</option>
                  <option value="1">재직</option>

                  <!-- Add more options as needed -->
                </select>
              </div>
              <div class="col-6 mb-3 mt-3">
                <label for="emp_access">권한</label>
                <select class="form-control" id="emp_access" name="emp_access" disabled>
                  <option value="<%=empDetail.getEmp_access()%>" selected><%=empDetail.getEmp_position()%></option>
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
                        onclick="empDetailUpdate()"
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

      //비밀번호 정규식표현
      const expPwText = /^[A-Za-z0-9]{4,12}$/;
      //핸드폰 정규식표현
      const expPhoneText = /^\d{3}-\d{3,4}-\d{4}$/;
      //이메일 정규실표현
      const expEmailText = /^[a-zA-Z0-9._+=-]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/;
      //주소 정규식표현
      const expAddressText = /^[가-힣a-zA-Z0-9-.,\s]{1,60}$/;

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
  <div class="modal" id="signSelect">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content rounded-4 shadow">
        <div class="modal-header p-5 pb-0 border-bottom-0" style="margin-bottom: -20px;">
          <h1 class="fw-bold  fs-2" >전자서명변경</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body p-5 pt-0">
          <form id="signInsert" method="post" action="/fileSave" enctype="multipart/form-data">
            <canvas id="signature-pad" width=400 height=200 style="margin-bottom: 20px; border: 2px solid black"></canvas>
            <input type="hidden" id="emp_no" name="emp_no" value="<%=empDetail.getEmp_no()%>">
            <div>
              <button type="button" id="clear" class="btn btn-danger">초기화</button>
              <button type="button" id="save" class="btn btn-danger">저장</button>
              <button type="button" class="btn btn-danger button save" data-action="save-png">내 pc에 저장</button>
            </div>
            <script>
                let canvas = document.getElementById('signature-pad');
                let signaturePad = new SignaturePad(canvas);


                //button clear
                document.getElementById('clear').addEventListener('click', function () {
                    signaturePad.clear();
                });

                // button action save-png  Event부여
                document.querySelector('[data-action="save-png"]').addEventListener('click', function () {

                    let dataURL = signaturePad.toDataURL();

                    let downloadLink = document.createElement('a');
                    downloadLink.href = dataURL;
                    downloadLink.download = '<%=empDetail.getEmp_no()%>.png';
                    //다운로드 처리
                    document.body.appendChild(downloadLink);
                    downloadLink.click();
                    document.body.removeChild(downloadLink);
                });

                // button save
                document.getElementById('save').addEventListener('click', function () {
                    let canvas = document.getElementById('signature-pad');
                    let dataURL = canvas.toDataURL('image/png'); // 캔버스 내용을 데이터 URL로 가져옴
                    // 데이터 URL을 Blob 객체로 변환
                    let blob = dataURItoBlob(dataURL);

                    // FormData 객체 생성
                    let formData = new FormData();
                    formData.append('image', blob, '<%=empDetail.getEmp_no()%>.png');

                    $.ajax({
                        type: 'POST',
                        url: '/fileSave',
                        data: formData,
                        processData: false, // FormData를 처리하지 않도록 설정
                        contentType: false, // 컨텐츠 타입을 false로 설정하여 jQuery가 컨텐츠 타입을 설정하지 않도록 함
                        success: function (response) {
                            console.log('파일 전송 성공');
                            let modal = document.querySelector(".modal")
                            modal.style.display = "none";
                            var backdrop = document.querySelector(".modal-backdrop");
                            // 요소가 존재하는 경우에만 숨김 처리
                            if (backdrop) {
                                backdrop.classList.remove("show"); // modal-backdrop의 show 클래스 제거
                                backdrop.style.display = "none"; // 요소를 화면에서 숨기기
                            }
                            document.querySelector("#signImage").src = "/fileUpload/sign/<%=empDetail.getEmp_no()%>.png";
                            signaturePad.clear();
                        },
                        error: function (xhr, status, error) {
                            console.error('파일 전송 실패:', error);
                            // 실패한 경우 처리할 내용 추가
                        }
                    });

                    // 데이터 URL을 Blob 객체로 변환하는 함수
                    function dataURItoBlob(dataURI) {
                        // Base64 데이터 부분 분리
                        let byteString = atob(dataURI.split(',')[1]);
                        let mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
                        // Blob 객체 생성
                        let arrayBuffer = new ArrayBuffer(byteString.length);
                        let intArray = new Uint8Array(arrayBuffer);
                        for (let i = 0; i < byteString.length; i++) {
                            intArray[i] = byteString.charCodeAt(i);
                        }
                        return new Blob([arrayBuffer], {type: mimeString});
                    }
                })
            </script>
          </form>

        </div>
      </div>
    </div>
  </div>
</body>
</html>