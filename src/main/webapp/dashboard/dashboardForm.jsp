<%----------------------------------------------------------
  이름 : 박병현
  날짜 : 2024-02-19
  내용 : 메인페이지jsp
----------------------------------------------------------%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.EmpVO" %>
<%@ page import="com.vo.AttendanceVO" %>
<%
  AttendanceVO attendance = (AttendanceVO) request.getAttribute("attendance");
  List<AttendanceVO> attendanceCalendar = (List) request.getAttribute("attendanceCalendar");
//out.print(attendance);
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
  <!-- 부트스트랩 라이브러리 -->
  <%@include file="/common/bootstrap_common.jsp" %>
  <link rel="stylesheet" href="/css/mainCalendar.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <title>메인페이지</title>
</head>
<body class="hold-transition sidebar-mini sidebar-collapse ">
    <div class="wrapper">
      <!-- header start -->
      <%@include file="/include/KGW_bar.jsp"%>
      <link rel="stylesheet" href="/css/dashboard.css">
      <script>
          const updateTime = () => {
              let timeString = moment().format('HH:mm:ss');
              document.querySelector("#clock").textContent = timeString;
          }

          // 매 초마다 시간을 업데이트
          setInterval(updateTime, 1000);

          const workStart = () =>{
              let timeString = moment().format('HH:mm:ss');
              const data = {
                  "start_time" : timeString,
                  "emp_no" : <%=sessionVO.getEmp_no()%>
              }
              Swal.fire({
                  title: "출근하시겠습니까?",
                  showCancelButton: true,
                  confirmButtonColor: "#7c1512",
                  cancelButtonColor: "#868686",
                  confirmButtonText: "네",
                  cancelButtonText: "아니요"
              }).then((result) => {
                  if (result.isConfirmed) {
                      $.ajax({
                          type:"POST",
                          url: '/attendance/attendanceTime',
                          data: data,
                          success: function(response) {
                              console.log('성공');
                              Swal.fire({
                                  title: "출근이 완료되었습니다.",
                                  text: "좋은 하루 되세요.",
                                  icon: "success",
                              });
                              document.querySelector("#workStart").textContent = timeString;
                              location.reload();
                          },
                          error: function(error) {
                              console.error('실패:', error);
                              // 실패한 경우 처리할 내용 추가
                          }
                      })
                  }
              });
          }
          const workEnd = () =>{
              let timeString = moment().format('HH:mm:ss');
              let attendace_no = 0;
              <%
                if(attendance != null){
              %>
              attendace_no = <%=attendance.getAttendance_no()%>;

              const data = {
                  "start_time" : '<%=attendance.getStart_time()%>',
                  "end_time" : timeString,
                  "emp_no" : <%=sessionVO.getEmp_no()%>,
                  "attendance_no" : attendace_no
              }

              Swal.fire({
                  title: "퇴근하시겠습니까?",
                  showCancelButton: true,
                  confirmButtonColor: "#7c1512",
                  cancelButtonColor: "#868686",
                  confirmButtonText: "네",
                  cancelButtonText: "아니요"
              }).then((result) => {
                  if (result.isConfirmed) {
                      $.ajax({
                          type:"POST",
                          url: '/attendance/attendanceEndTime',
                          data: data,
                          success: function(response) {
                              console.log('성공');
                              Swal.fire({
                                  title: "퇴근이 완료되었습니다.",
                                  text: "오늘 하루 고생하셨습니다.",
                                  icon: "success",
                              });
                              document.querySelector("#workStart").textContent = timeString;
                              location.reload();
                          },
                          error: function(error) {
                              console.error('실패:', error);
                              // 실패한 경우 처리할 내용 추가
                          }
                      })
                  }
              });
              <%
              }
              %>
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
              location.href = "/mypage?emp_no=<%=sessionVO.getEmp_no()%>";
          }
      </script>

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
        <div class="col-2 text-center" >
          <div class="col" style="position:sticky; top:10px;">
            <div class="row mainbox" style="background-color: #efc3cc;">
              <div class="row" style="margin: auto;">
                <div class="user-panel">
                  <a href="/mypage?emp_no=<%=sessionVO.getEmp_no()%>">
                    <img src="/fileUpload/profile/<%=sessionVO.getProfile_img()%>" class="img-circle m-4 img-responsive" alt="User Image" style=" margin: auto; width: 70%; height: auto;">
                  </a>
                </div>
              </div>
              <div class="row" style="margin: auto;">
                <div class="row" style="margin: auto;">
                  <div class="text text-bold text-lg">
                    [<%=sessionVO.getTeam_name()%>]
                  </div>
                </div>
                <div class="row mb-5" style="margin: auto;">
                  <div class="text text-bold text-lg">
                    <%=sessionVO.getName()%> 사원
                  </div>
                </div>
              </div>
            </div>

            <div class="row mainbox mt-3 pt-5" style="background-color: #efc3cc; ">
                <div class="row text-bold text-lg" style="margin: auto;">
                  <div class="text col-6 ">
                    <label>현재 시간  </label>
                  </div>
                  <div class="text2 col-6">
                    <div id="clock"></div>
                  </div>
                </div>
                <div class="row text-bold text-lg mt-2 mb-5" style="margin: auto;">
                  <div class="text col-6 " style="line-height: 70px">
                    <label>현재 날씨 </label>
                  </div>
                  <div class="text2 col-6">
                    <div>
                      <img class="icon " style="width: 70px; height: 70px; "/>
                    </div>
                  </div>
                </div>
                <div class="row text-bold text-lg" style="margin: auto;">
                  <div class="text col-6 ">
                    <label>출근시간 : </label>
                  </div>
                  <div class="text2 col-6">
                    <%
                      if(attendance != null){
                        if(attendance.getStart_time() != null){
                    %>
                        <label id="workStart"><%=attendance.getStart_time()%></label>
                    <%
                        }else{
                    %>
                        <label id="workStart"></label>
                    <%
                        }
                      }else{
                    %>
                    <label id="workStart"></label>
                    <%
                      }
                    %>
                  </div>
                </div>
                <div class="row text-bold text-lg" style="margin: auto;">
                  <div class="text col-6 ">
                    <label>퇴근시간 : </label>
                  </div>
                  <div class="text2 col-6">
                    <%
                      if(attendance != null){
                        if(attendance.getEnd_time() != null){
                    %>
                      <label id="workStart"><%=attendance.getEnd_time()%></label>
                    <%
                        }else{
                    %>
                      <label id="workEnd"></label>
                    <%
                        }
                      }else{
                    %>
                    <label id="workEnd"></label>
                    <%
                      }
                    %>
                  </div>
                </div>

              <div class="mt-5 mb-5">
                <hr class="m-3" style=" height: 1px; background-color: #0e0e0e; border: 0">
              </div>
              <div class="mb-5" >
                <%
                  if(attendance == null){
                %>
                  <button id="btn_start" class="btn btn-danger" onclick="workStart()">출근</button>
                <%
                  }else {
                    if(attendance.getStart_time() == null){
                %>
                  <button id="btn_start" class="btn btn-danger" onclick="workStart()">출근</button>
                <%
                    }else if(attendance.getEnd_time() == null){
                %>
                  <button id="btn_end" class="btn btn-danger" onclick="workEnd()">퇴근</button>
                <%
                    }else{
                %>
                  <button id="btn_start" class="btn btn-danger" onclick="workStart()" disabled>출근</button>
                  <button id="btn_end" class="btn btn-danger" onclick="workEnd()" disabled>퇴근</button>
                <%
                    }
                  }
                %>
<%--                <%--%>
<%--                  if(attendance != null){--%>
<%--                    if(attendance.getStart_time() != null){--%>
<%--                %>--%>
<%--                    <button id="btn_start" class="btn btn-danger" onclick="workStart()" disabled>출근</button>--%>
<%--                <%--%>
<%--                    }else{--%>
<%--                %>--%>
<%--                    <button id="btn_start" class="btn btn-danger" onclick="workStart()">출근</button>--%>
<%--                <%--%>
<%--                    }--%>
<%--                %>--%>
<%--                <%--%>
<%--                    if(attendance.getEnd_time() != null){--%>
<%--                %>--%>
<%--                    <button id="btn_end" class="btn btn-danger" onclick="workEnd()" disabled>퇴근</button>--%>
<%--                <%--%>
<%--                  }else{--%>
<%--                %>--%>
<%--                    <button id="btn_end" class="btn btn-danger" onclick="workEnd()">퇴근</button>--%>
<%--                <%--%>
<%--                    }--%>
<%--                  }else{--%>
<%--                %>--%>
<%--                <button id="btn_start" class="btn btn-danger" onclick="workStart()">출근</button>--%>
<%--                <button id="btn_end" class="btn btn-danger" onclick="workEnd()">퇴근</button>--%>
<%--                <%--%>
<%--                  }--%>
<%--                %>--%>

              </div>
            </div>
            <div class="row mainbox mt-3 p-4 d-grid gap-5  mx-auto" style="background-color: #efc3cc; ">
              <a href="/mypage?emp_no=<%=sessionVO.getEmp_no()%>" class="btn btn-danger">프로필정보수정</a>
            </div>
          </div>
        </div>

        <div class="col-9">
          <div class="row " >

            <div class="col mainbox">
              <div class="mainbox-header d-flex align-items-center pb-0">
                <div class="d-flex align-items-center">
                  <span style="font-weight: bold; margin-left: 1.5rem" >전자결재진행현황</span>
                </div>
                <div style="margin-left: auto; margin-right: 1.5rem">
                  <a href="#" class="btn btn-danger" style="border-radius:30px">more</a>
                </div>
              </div>
              <hr/>

                <div class="row mb-3">
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

          <div class="row" >
            <div class="col mainbox">
              <div class="mainbox-header d-flex align-items-center pb-0">
                <div class="d-flex align-items-center">
                  <span style="font-weight: bold; margin-left: 1.5rem" >공지게시판</span>
                </div>
                <div style="margin-left: auto; margin-right: 1.5rem">
                  <a href="#" class="btn btn-danger" style="border-radius:30px">more</a>
                </div>
              </div>
              <hr/>
            </div>
            <div class="col mainbox">
              <div class="mainbox-header d-flex align-items-center pb-0">
                <div class="d-flex align-items-center">
                  <span style="font-weight: bold; margin-left: 1.5rem" >미디어게시판</span>
                </div>
                <div style="margin-left: auto; margin-right: 1.5rem">
                  <a href="#" class="btn btn-danger" style="border-radius:30px">more</a>
                </div>
              </div>
              <hr/>
            </div>
          </div>

          <div class="row" >
            <div class="col mainbox">
              <div class="mainbox-header d-flex align-items-center pb-0">
                <div class="d-flex align-items-center">
                  <span style="font-weight: bold; margin-left: 1.5rem" >전략분석 차트</span>
                </div>
                <div style="margin-left: auto; margin-right: 1.5rem">
                  <a href="#" class="btn btn-danger" style="border-radius:30px">more</a>
                </div>
              </div>
                <hr/>
            </div>
            <div class="col mainbox">
              <div class="mainbox-header d-flex align-items-center pb-0">
                <div class="d-flex align-items-center">
                  <span style="font-weight: bold; margin-left: 1.5rem" >근태관리</span>
                </div>
                <div style="margin-left: auto; margin-right: 1.5rem">
                  <a href="/attendance/attendanceCalendar?emp_no=<%=sessionVO.getEmp_no()%>" class="btn btn-danger" style="border-radius:30px">more</a>
                </div>
              </div>
                <hr/>
                <div id='calendar-container'>
                  <%@include file="/include/attendance.jsp"%>
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
