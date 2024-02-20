<%@ page import="com.best.kgw.vo.CalendarVO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calendar</title>
    <!-- fullcalendar CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.10.1/main.min.js"></script>
    <!-- moment.js 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <!-- moment-timezone.js 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.34/moment-timezone-with-data.min.js"></script>
    <!-- 부트스트랩 라이브러리 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/reservation.css" />
    <!-- fullcalendar CSS -->
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.10.1/main.min.css" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
    <%@include file="/include/KGW_bar.jsp"%>
    <div class="content-wrapper">

        <div style="width: 100%; height: 100px; padding-left: 24px; padding-right: 24px; padding-top: 16px; padding-bottom: 16px; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: inline-flex">
            <div style="justify-content: flex-end; align-items: center; display: inline-flex; flex-direction: row-reverse;">
                <button id="addEventBtn" class="btn btn-primary">일정 등록</button>
                <div style="justify-content: flex-start; align-items: center; display: flex">
                    <div style="color: rgba(0, 0, 0, 0.45); font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word">예약</div>
                </div>
                <div style="padding-left: 8px; padding-right: 8px; flex-direction: column; justify-content: flex-start; align-items: center; gap: 10px; display: inline-flex">
                    <div style="color: rgba(0, 0, 0, 0.45); font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word">></div>
                </div>
                <div style="justify-content: flex-start; align-items: center; display: flex">
                    <div style="color: rgba(0, 0, 0, 0.85); font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word">예약현황</div>
                </div>
            </div>
            <div style="padding-top: 14px; padding-bottom: 6px; justify-content: flex-start; align-items: center; gap: 16px; display: inline-flex">
                <div style="width: 16.25px; height: 16px; position: relative">
                    <div style="width: 13.35px; height: 12.71px; left: 1.45px; top: 1.64px; position: absolute; background: rgba(0, 0, 0, 0.85)"></div>
                </div>
                <div style="justify-content: flex-start; align-items: center; gap: 12px; display: flex">
                    <div style="color: rgba(0, 0, 0, 0.85); font-size: 20px; font-family: Roboto; font-weight: 700; line-height: 28px; word-wrap: break-word">예약현황</div>
                    <div style="color: rgba(0, 0, 0, 0.45); font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word">예약현황을 조회할 수 있는 페이지입니다.</div>
                </div>
            </div>
        </div>



        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="container-fluid1">
                        <h2 class="cal_title">자산 예약 현황</h2>
                    </div>
                    <hr />

                    <%-- 캘린더 태그 --%>
                    <div id="calendar1"></div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <%-- 내 예약 현황 태그 --%>
                    <div class="container-fluid1">
                        <h2 class="cal_title">내 예약 현황</h2>
                        <!-- 검색기 시작 -->
                        <div class="row">
                            <div class="col-3">
                                <select id="gubun" class="form-select" aria-label="분류선택">
                                    <option value="none">분류선택</option>
                                    <option value="b_title">제목</option>
                                    <option value="b_writer">작성자</option>
                                    <option value="b_content">내용</option>
                                </select>
                            </div>
                            <div class="col-6">
                                <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                                       aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                            </div>
                            <div class="col-3">
                                <button id="btn_search" class="btn btn-danger" style="background-color: #652C2C;" onclick="boardSearch()">검색</button>
                            </div>
                        </div>
                    </div>

                    <div class="container-fluid">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">예약장소</th>
                                <th scope="col">예약자</th>
                                <th scope="col">예약시간</th>
                                <th scope="col">취소</th>
                            </tr>
                            </thead>
                            <tbody id="reservationTableBody">
                            <% List<CalendarVO> assetReservationList = (List<CalendarVO>) request.getAttribute("assetReservationList");
                                List<CalendarVO> assetList = (List<CalendarVO>) request.getAttribute("assetList");
                                if (assetReservationList != null && assetList != null ) {
                                    for (CalendarVO vo : assetReservationList) {
                                        for (CalendarVO vo1 : assetList) { %>
                            <tr>
                                <th scope="row">#</th>
                                <td><% if(vo1.getAsset_name() != null) { %> <%= vo1.getAsset_name() %> <% } %></td>
                                <td><%= vo.getEmp_no() %></td>
                                <td><%= vo.getReservation_start() + "~" + vo.getReservation_end() %></td>
                                <td><button class="btn btn-danger cancel-button" style="background-color: #652C2C;">취소</button></td>
                            </tr>
                            <%
                                        }
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 모달 태그 -->
        <div id="eventModal" class="modal" style="display: none;">
            <div class="modal-content">
                <span class="close">&times;</span>
                <label for="eventTitle">일정명:</label>
                <input type="text" id="eventTitle" name="eventTitle"><br>

                <label for="eventStart">일정 시작:</label>
                <input type="datetime-local" id="eventStart" name="eventStart"><br>

                <label for="eventEnd">일정 종료:</label>
                <input type="datetime-local" id="eventEnd" name="eventEnd"><br>

                <label for="eventResourceId">시설 ID:</label>
                <input type="text" id="eventResourceId" name="eventResourceId"><br>

                <button id="submitEvent">등록</button>
                <button class="close">취소</button>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        let calendarEl = document.getElementById('calendar1');
        let calendar;
        if (calendarEl) {
            calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'resourceTimelineDay',
                resourceAreaWidth: '87px',
                expandRows: false,
                aspectRatio: 1,
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'resourceTimelineDay,resourceTimelineWeek,resourceTimelineMonth,listWeek',
                },
                navLinks: true,
                editable: true,
                selectable: true,
                nowIndicator: true,
                resourceAreaHeaderContent: '',
                height: 'auto',
                locale: 'ko',
                // eventAdd: function(obj) {
                //     console.log(obj);
                // },
                // eventChange: function(obj) {
                //     console.log(obj);
                // },
                // eventRemove: function(obj) {
                //     console.log(obj);
                // },
                select: function(arg) {
                    let modal = document.getElementById('eventModal');
                    modal.style.display = 'block';

                    let startInput = document.getElementById('eventStart');
                    let endInput = document.getElementById('eventEnd');
                    let resourceIdInput = document.getElementById('eventResourceId');
                    let submitBtn = document.getElementById('submitEvent');

                    let startTime = moment.tz(arg.start, 'Asia/Seoul').format('YYYY-MM-DDTHH:mm');
                    let endTime = moment.tz(arg.end, 'Asia/Seoul').format('YYYY-MM-DDTHH:mm');

                    startInput.value = startTime;
                    endInput.value = endTime;
                    resourceIdInput.value = arg.resource.id;
                },

                eventClick: function(info) {
                    let modal = document.getElementById('eventModal');
                    modal.style.display = 'block';

                    let titleInput = document.getElementById('eventTitle');
                    let startInput = document.getElementById('eventStart');
                    let endInput = document.getElementById('eventEnd');
                    let resourceIdInput = document.getElementById('eventResourceId');
                    let submitBtn = document.getElementById('submitEvent');

                    // FullCalendar의 함수를 사용하여 정보 가져오기
                    let event = info.event;
                    titleInput.value = event.title;

                    // 이벤트의 리소스 가져오기
                    let resource = event.getResources()[0]; // 이벤트가 하나의 리소스에만 할당되었다고 가정합니다.

                    if (resource) {
                        resourceIdInput.value = resource.id;
                    } else {
                        console.error('Resource not found.');
                        resourceIdInput.value = '';
                    }


                    // moment.js를 사용하여 시간 형식 맞추기
                    startInput.value = moment(event.start).format('YYYY-MM-DDTHH:mm');
                    endInput.value = moment(event.end).format('YYYY-MM-DDTHH:mm');

                    // // 리소스 ID 가져오기
                    // let resourceId = resourceIdInput.value;
                    // if (resourceId) {
                    //     resourceIdInput.value = event.resource.id;
                    // } else {
                    //     console.error('Resource ID not found.');
                    //     resourceIdInput.value = '';
                    // }
                },


                resources: [
                    <%  List<CalendarVO> assetList1 = (List<CalendarVO>) request.getAttribute("assetList");
                        if (assetList1 != null) {
                            for (CalendarVO vo : assetList1) {
                                if (vo != null) {
                    %>
                    {
                        id: '<%= vo.getAsset_id()%>',
                        title : '<%= vo.getAsset_name() %>',
                        eventColor: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    <% }}} %>
                ],
                events: [
                    <%  List<CalendarVO> assetReservationList1 = (List<CalendarVO>) request.getAttribute("assetReservationList");
                        if (assetReservationList1 != null) {
                            for (CalendarVO vo1 : assetReservationList1) { %>
                    {
                        resourceId: '<%= vo1.getAsset_id() %>',
                        title: '<%= vo1.getReservation_title() %>',
                        start: '<%= vo1.getReservation_start() %>',
                        end: '<%= vo1.getReservation_end() %>',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    <% }} %>
                ]
            });
            calendar.render();
        } else {
            console.error('calendarEl = NULL');
        }

        let cancelButtonList = document.querySelectorAll('.cancel-button');
        cancelButtonList.forEach(function (cancelButton) {
            cancelButton.addEventListener('click', function () {
                let modal = document.getElementById('eventModal');
                modal.style.display = 'block';
            }, { passive: true }); // passive 옵션 추가
        });

        // 이벤트 핸들러 등록
        let submitBtn = document.getElementById('submitEvent');
        let closeBtnList = document.querySelectorAll('.modal-content .close');

        submitBtn.addEventListener('click', handleEventSubmit);
        closeBtnList.forEach(function(closeBtn) {
            closeBtn.addEventListener('click', handleModalClose);
        });

        // 이벤트 등록 처리 함수
        function handleEventSubmit() {
            let titleInput = document.getElementById('eventTitle');
            let startInput = document.getElementById('eventStart');
            let endInput = document.getElementById('eventEnd');
            let resourceIdInput = document.getElementById('eventResourceId');

            let title = titleInput.value;
            let start = startInput.value;
            let end = endInput.value;
            let resourceId = resourceIdInput.value;

            if (title && start && end && resourceId) {
                calendar.addEvent({
                    title: title,
                    start: start,
                    end: end,
                    resourceId: resourceId,
                    color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                });
            }

            let modal = document.getElementById('eventModal');
            modal.style.display = 'none';
            clearModalInputs();
        }

        // 모달 닫기 처리 함수
        function handleModalClose() {
            let modal = document.getElementById('eventModal');
            modal.style.display = 'none';
            clearModalInputs();
        }

        // 모달 입력값 초기화 함수
        function clearModalInputs() {
            document.getElementById('eventTitle').value = '';
            document.getElementById('eventStart').value = '';
            document.getElementById('eventEnd').value = '';
            document.getElementById('eventResourceId').value = '';
        }
    });
</script>
</body>
</html>
