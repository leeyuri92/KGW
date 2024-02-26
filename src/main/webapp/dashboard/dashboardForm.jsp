<%----------------------------------------------------------
  이름 : 박병현
  날짜 : 2024-02-19
  내용 : 메인페이지jsp
----------------------------------------------------------%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.EmpVO" %>
<%
  EmpVO empDetail = (EmpVO) request.getAttribute("empDetail");
//  out.print(empDetail);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN 라이선스 표시 없애기 위해 locale 사용 -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  <!-- moment-timezone.js 라이브러리 -->
<%--  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.34/moment-timezone-with-data.min.js"></script>--%>
  <!-- 부트스트랩 라이브러리 -->
  <link rel="stylesheet" href="/css/mainCalendar.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <title>메인페이지</title>

  <script>
      const updateTime = () => {
          let timeString = moment().format('HH:mm:ss');
          document.querySelector("#clock").textContent = timeString;
      }

      // 매 초마다 시간을 업데이트
      setInterval(updateTime, 1000);

      const workStart = () =>{
          let timeString = moment().format('HH:mm:ss');
              Swal.fire({
                  title: "출근하시겠습니까?",
                  showCancelButton: true,
                  confirmButtonColor: "#7c1512",
                  cancelButtonColor: "#868686",
                  confirmButtonText: "네",
                  cancelButtonText: "아니요"
              }).then((result) => {
                  if (result.isConfirmed) {
                      Swal.fire({
                          title: "출근이 완료되었습니다.",
                          text: "좋은 하루 되세요.",
                          icon: "success"
                      });
                      document.querySelector("#workStart").textContent = timeString;
                      const button = document.querySelector("#btn_start");
                      // 버튼을 비활성화합니다.
                      button.disabled = true;
                  }
              });
      }
      const workEnd = () =>{
          let timeString = moment().format('HH:mm:ss');
          Swal.fire({
              title: "퇴근하시겠습니까?",
              showCancelButton: true,
              confirmButtonColor: "#7c1512",
              cancelButtonColor: "#868686",
              confirmButtonText: "네",
              cancelButtonText: "아니요"
          }).then((result) => {
              if (result.isConfirmed) {
                  Swal.fire({
                      title: "퇴근이 완료되었습니다.",
                      text: "오늘 하루도 수고하셨습니다.",
                      icon: "success"
                  });
                  document.querySelector("#workEnd").textContent = timeString;
                  const button = document.querySelector("#btn_start");
                  // 버튼을 비활성화합니다.
                  button.disabled = false;
              }
          });
      }



      function success (position){
          const latitude = position.coords.latitude;
          const longitude = position.coords.longitude;

          getWeather(latitude, longitude);
      }



      function getWeather (lat, lon) {
          const API_KEY = '151ebeae4d0dc3a80ce3b6ba4912e175';
          fetch(
              `https://api.openweathermap.org/data/2.5/weather?lat=\${lat}&lon=\${lon}&appid=\${API_KEY}&units=metric&lang=kr`
          )
              .then((response) => {
                  if (!response.ok) {
                      throw new Error('날씨 정보를 가져오는 데 실패했습니다.');
                  }
                  return response.json();
              })
              .then((data) => {
                  const iconSection = document.querySelector('.icon');
                  const icon = data.weather[0].icon;
                  console.log(icon)
                  const iconURL = `http://openweathermap.org/img/wn/\${icon}.png`;
                  console.log(iconURL)
                  iconSection.setAttribute('src', iconURL);
                  iconSection.setAttribute('alt', data.weather[0].description);
              })
              .catch((error) => {
                  console.error('Error:', error);
              });
      }

      navigator.geolocation.getCurrentPosition(success);

      const mypage = () =>{
          location.href = "/mypage?emp_no=<%=1004%>";
      }
  </script>
</head>
<body class="hold-transition sidebar-mini sidebar-collapse ">
    <div class="wrapper">
      <!-- header start -->
      <%@include file="/include/KGW_bar.jsp"%>
      <link rel="stylesheet" href="/css/dashboard.css">

      <!-- body start    -->
      <div class="content-wrapper">
        <!-- 페이지 path start    -->
        <%--		<div class="card" >--%>
        <div class="mainbox-header p-4" >
          <div class="d-flex align-items-center">
            <div class="d-flex align-items-center me-2">
              <a class="text-muted fs-6" href="#">메인페이지</a>
            </div>
          </div>
          <div class="d-flex align-items-center mt-2">
            <div class="position-relative">
              <div class="position-absolute top-0 start-0" ></div>
            </div>
            <div class="d-flex align-items-center ms-2">
              <div class="fw-bold fs-5">메인페이지</div>
              <div class="text-muted ms-3">메인페이지입니다.</div>
            </div>
          </div>
        </div>
    <!-- 페이지 path end -->
    <section class="content">

      <div class="row">
        <div class="col-2 mr-3 text-center mainbox" style="background-color: #dfded0";>
          <div class="row">
            <div class="row">
              <div class="user-panel">
                <a href="/mypage?emp_no=<%=empDetail.getEmp_no()%>"><img src="/images/<%=empDetail.getProfile_img()%>" class="img-circle m-5 " alt="User Image" style=" margin: auto; width: 175px; height: 175px; "></a>
              </div>
            </div>
            <div class="row">
              <div class="text-bold text-lg">
                [<%=empDetail.getTeam_name()%>]
              </div>
            </div>
            <div class="row mb-5">
              <div class="text-bold text-lg">
                <%=empDetail.getName()%> 사원
              </div>
            </div>
          </div>
          <hr class="m-3" style=" height: 1px; background-color: #0e0e0e; border: 0">

          <div class="row mt-5 pt-5" style=" padding-bottom: 100%">
              <div class="row text-bold text-lg">
                <div class="col-6 ">
                  <label>현재 시간 : </label>
                </div>
                <div class="col-6">
                  <div id="clock"></div>
                </div>
              </div>
              <div class="row text-bold text-lg mt-2 mb-5">
                <div class="col-6 " style="line-height: 70px">
                  <label>현재 날씨 : </label>
                </div>
                <div class="col-6">
                  <div>
                    <img class="icon " style="width: 70px; height: 70px; "/>
                  </div>
                </div>
              </div>
              <div class="row text-bold text-lg">
                <div class="col-6 ">
                  <label>출근시간 : </label>
                </div>
                <div class="col-6">
                  <label id="workStart"></label>
                </div>
              </div>
              <div class="row text-bold text-lg">
                <div class="col-6 ">
                  <label>퇴근시간 : </label>
                </div>
                <div class="col-6">
                  <label id="workEnd"></label>
                </div>
              </div>

            <div class="mt-5 mb-5">
              <hr class="m-3" style=" height: 1px; background-color: #0e0e0e; border: 0">
            </div>
            <div class="mb-5">
              <button id="btn_start" class="btn btn-danger" onclick="workStart()">출근</button>
              <button id="btn_end" class="btn btn-danger" onclick="workEnd()">퇴근</button>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="row " >

            <div class="col mainbox">
              <div class="mainbox-header">
                <span style="font-weight: bold; margin-left: 1.5rem" >전자결재진행현황</span>
                <hr/>

                <div class="row">
                  <div class="custom-col" >
<%--                    <i class="bi bi-pause-fill custom-i"></i>--%>
                    <button id="btn_approval_wait" class="approval btn btn-danger">결재대기 <p>[0]</p></button>
                  </div>

                  <div class="custom-col" >
<%--                    <i class="bi bi-play-fill custom-i"></i>--%>
                    <button id="btn_approval_progress" class="approval btn btn-danger">결재진행 <p>[0]</p></button>
                  </div>

                  <div class="custom-col" >
<%--                    <i class="bi bi-check-lg custom-i"></i>--%>
                    <button id="btn_approval_complete" class="approval btn btn-danger">결재완료 <p>[0]</p></button>
                  </div>

                  <div class="custom-col" >
<%--                    <i class="bi bi-repeat custom-i"></i>--%>
                    <button id="btn_approval_companion" class="approval btn btn-danger">결재반려 <p>[0]</p></button>
                  </div>

                  <div class="custom-col">
                    <button id="btn_approval" class="approval btn btn-danger" >기안작성</button>
                  </div>

                </div>
              </div>
            </div>
          </div>

          <div class="row" >
            <div class="col mainbox">
              <div class="mainbox-header">
                <span style="font-weight: bold; margin-left: 1.5rem" >전략분석 차트</span>
                <hr/>
              </div>
            </div>
            <div class="col mainbox">
              <div class="mainbox-header">
                <a style="font-weight: bold; margin-left: 1.5rem" href="/attendance/attendanceCalendar.jsp">근태관리</a>
                <hr/>
                <%@include file="/include/attendance.jsp"%>
              </div>
            </div>

          </div>
          <div class="row" >
            <div class="col mainbox">
              <div class="mainbox-header">
                <span style="font-weight: bold; margin-left: 1.5rem" >공지사항게시판</span>
                <hr/>
              </div>
            </div>
            <div class="col mainbox">
              <div class="mainbox-header">
                <span style="font-weight: bold; margin-left: 1.5rem" >미디어게시판</span>
                <hr/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>
</body>
</html>
