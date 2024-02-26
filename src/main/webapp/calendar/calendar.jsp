<%@ page import="java.util.List" %>
<%@ page import="com.vo.CalendarVO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
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
<script>
    document.addEventListener('DOMContentLoaded', function() {
        let calendarEl = document.getElementById('calendar');
        let calendar;
        if (calendarEl) {
            calendar = new FullCalendar.Calendar(calendarEl, {
                expandRows: true, // 화면에 맞게 높이 재설정
                initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                slotMinTime: '08:00', // Day 캘린더에서 시작 시간
                slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
                // 해더에 표시할 툴바
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                // initialDate: '', // 초기 날짜 설정 (미설정시 오늘 날짜로 설정)
                navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
                selectable: true,
                editable: true, // 수정 가능
                selectable: true, // 달력 일자 드래그 설정가능
                nowIndicator: true, // 현재 시간 마크
                dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
                height: '570px', // calendar 높이 설정
                locale: 'ko', // 한국어 설정
                // weekends: false, // 주말 표시 여부
                // slotLabelFormat: { hour: 'numeric', minute: '2-digit', hour12: false }, // 시간을 24시간 형식으로 표시
                eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
                    console.log(obj);
                },
                eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
                    console.log(obj);
                },
                eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
                    console.log(obj);
                },
                // 타임라인 드래그 이벤트
                select: function(arg) {
                    if (detailStart === !null) {
                        let modal = document.getElementById('detailModal');
                        modal.style.display = 'block';
                        let startInput = document.getElementById('detailStart');
                        let endInput = document.getElementById('detailEnd');
                        let startTime = moment(arg.start, 'Asia/Seoul').format('YYYY-MM-DDTHH:mm');
                        let endTime = moment(arg.end, 'Asia/Seoul').format('YYYY-MM-DDTHH:mm');
                        startInput.value = startTime;
                        endInput.value = endTime;
                    } else {
                        let modal = document.getElementById('insertModal');
                        modal.style.display = 'block';
                        let startInput = document.getElementById('insertStart');
                        let endInput = document.getElementById('insertEnd');
                        let startTime = moment(arg.start, 'Asia/Seoul').format('YYYY-MM-DDTHH:mm');
                        let endTime = moment(arg.end, 'Asia/Seoul').format('YYYY-MM-DDTHH:mm');
                        startInput.value = startTime;
                        endInput.value = endTime;
                    }
                },
                eventClick: function(info) {
                    if(detailStart != null) {
                        let modal = document.getElementById('detailModal');
                        modal.style.display = 'block';
                        let detailTitleInput = document.getElementById('detailTitle');
                        let detailStartInput = document.getElementById('detailStart');
                        let detailEndInput = document.getElementById('detailEnd');
                        // FullCalendar의 함수를 사용하여 정보 가져오기
                        let event = info.event;
                        detailTitleInput.value = event.title;
                        detailStartInput.value = moment(event.start).format('YYYY-MM-DDTHH:mm');
                        detailEndInput.value = moment(event.end).format('YYYY-MM-DDTHH:mm');
                    }else{
                        let modal = document.getElementById('insertModal');
                        modal.style.display = 'block';
                        let insertTitleInput = document.getElementById('insertTitle');
                        let insertStartInput = document.getElementById('insertStart');
                        let insertEndInput = document.getElementById('insertEnd');
                        // FullCalendar의 함수를 사용하여 정보 가져오기
                        let event = info.event;
                        insertTitleInput.value = event.title;
                        // moment.js를 사용하여 시간 형식 맞추기
                        insertStartInput.value = moment(event.start).format('YYYY-MM-DDTHH:mm');
                        insertEndInput.value = moment(event.end).format('YYYY-MM-DDTHH:mm');
                    }
                },
                events: [
                    <%  List<CalendarVO> calendarList = (List<CalendarVO>) request.getAttribute("calendarList");
                        if (calendarList != null) {
                            for (CalendarVO vo : calendarList) { %>
                    {
                        title: '<%= vo.getCalendar_title() %>',
                        start: '<%= vo.getCalendar_start() %>',
                        end: '<%= vo.getCalendar_end() %>',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    <% }} %>
                ]
            });
            // 캘린더 랜더링
            calendar.render();
        }
    });

    // 이벤트 핸들러 등록
    let submitBtn = document.getElementById('submitEvent');
    let searchBtn = document.getElementById('reservSearch');
    let exitBtn = document.getElementById('exitEvent');
    let deleteBtn = document.getElementById('deleteEvent');
    let updateBtn = document.getElementById('updateEvent');
    let addEventBtn = document.getElementById('addEvent');
    let closeBtnList = document.querySelectorAll('.modal-content .close');

    submitBtn.addEventListener('click', handleEventSubmit);
    submitBtn.addEventListener('click', handleEventUpdate);
    searchBtn.addEventListener('click', handleEventUpdate);
    exitBtn.addEventListener('click', handleEventSubmit);
    exitBtn.addEventListener('click', handleEventUpdate);
    deleteBtn.addEventListener('click', handleEventDelete);
    updateBtn.addEventListener('click', handleEventUpdate);
    addEventBtn.addEventListener('click', function() {
        let insertModal = document.getElementById('insertModal');
        insertModal.style.display = 'block';
    });
    closeBtnList.forEach(function(closeBtn) {
        // closeBtn.addEventListener('click', handleModalClose);
        closeBtn.addEventListener('click', handleEventUpdate);
    });


    function handleEventSubmit() {
        let titleInput = document.getElementById('insertTitle');
        let startInput = document.getElementById('insertStart');
        let endInput = document.getElementById('insertEnd');
        let title = titleInput.value;
        let start = startInput.value;
        let end = endInput.value;
        let url = '/calendar/addCalendar';

        if (title && start && end) {
            let xhr = new XMLHttpRequest();
            xhr.open('POST', url, true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    // console.log(xhr.responseText);
                    console.log(addEventToCalendar.toString());
                    addEventToCalendar(title, start, end);
                    updateReservationList(renderReservationList)
                    console.log('새 이벤트가 성공적으로 등록되었습니다.');
                }
            };

            let data = 'title=' + encodeURIComponent(title) +
                '&start=' + encodeURIComponent(start) +
                '&end=' + encodeURIComponent(end)
            xhr.send(data);
        } else {
            console.error('입력값이 유효하지 않습니다.');
        }
        closeModalAndClearInputs();
    }

    function addEventToCalendar(title, start, end) {
        calendar.addEvent({
            title: title,
            start: start,
            end: end,
            color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
        });
    }

    function handleEventDelete() {
        let assetNoInput = document.getElementById('detailAssetNo');
        let id = assetNoInput.value;
        let reservationNoInput = document.getElementById('detailReservationNo');
        let reservationNo = reservationNoInput.value;
        let eventToDelete = calendar.getEventById(id);
        let url = '/reservation/delReservation';

        // AJAX를 이용하여 서버에 삭제 요청
        let xhr = new XMLHttpRequest();
        xhr.open('DELETE', url, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // Promise를 이용한 비동기 처리
        let promise = new Promise(function(resolve, reject) {
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    console.log(xhr);
                    resolve(); // 비동기 작업 완료를 알림
                }
            };
        });

        promise.then(function() {
            if (eventToDelete) {
                eventToDelete.remove(); // 이벤트 삭제
                updateReservationList(renderReservationList)
                console.log('이벤트가 성공적으로 삭제되었습니다.');
            } else {
                console.log('삭제할 이벤트를 찾을 수 없습니다.');
            }

            let modal = document.getElementById('detailModal');
            modal.style.display = 'none';
        });

        // 서버로 전송할 데이터 설정 (id와 함께 예약번호도 포함)
        let data = 'id=' + encodeURIComponent(id) + '&reservationNo=' + encodeURIComponent(reservationNo);
        console.log(data);
        xhr.send(data); // 데이터 전송
    }

    //업데이트
    function handleEventUpdate() {
        let titleInput = document.getElementById('detailTitle');
        let startInput = document.getElementById('detailStart');
        let endInput = document.getElementById('detailEnd');
        let resourceIdInput = document.getElementById('detailResourceId');
        let reservationNoInput = document.getElementById('detailReservationNo');
        let assetNoInput = document.getElementById('detailAssetNo');
        let title = titleInput.value;
        let start = startInput.value;
        let end = endInput.value;
        let resourceId = resourceIdInput.value;
        let reservationNo = reservationNoInput.value; // 예약 번호 추가
        let id = assetNoInput.value;

        if (title && start && end && resourceId && reservationNo && id) {
            let url = '/reservation/updateReservation';
            let xhr = new XMLHttpRequest();
            xhr.open('PUT', url, true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    console.log('이벤트가 성공적으로 업데이트되었습니다.');
                    let updatedEvent = { // 업데이트된 이벤트 객체 생성
                        title: title,
                        start: start,
                        end: end,
                        resourceId: resourceId,
                        id: id,
                        extendedProps: {
                            reservationNo: reservationNo
                        }
                    };
                    updateToCalendar(updatedEvent); // 캘린더에 바로 업데이트된 이벤트 추가
                    // 예약 목록을 업데이트하는 함수 호출
                    updateReservationList(renderReservationList);
                }
            };

            let eventData = 'id=' + encodeURIComponent(id) +
                '&reservationNo=' + encodeURIComponent(reservationNo) + // 예약 번호를 전송합니다.
                '&title=' + encodeURIComponent(title) +
                '&start=' + encodeURIComponent(start) +
                '&end=' + encodeURIComponent(end);

            xhr.send(eventData);
        } else {
            console.error('입력값이 유효하지 않습니다.');
        }
        let modal = document.getElementById('detailModal');
        modal.style.display = 'none';
        closeModalAndClearInputs();
    }

    // 기존 이벤트를 업데이트 함수
    function updateToCalendar(updatedEvent) {
        if (updatedEvent && updatedEvent.id) {
            let existingEvent = calendar.getEventById(updatedEvent.id); // 기존 이벤트 가져오기
            if (existingEvent) {
                existingEvent.remove(); // 기존 이벤트 삭제
                // 업데이트된 이벤트를 캘린더에 추가
                calendar.addEvent({
                    title: updatedEvent.title,
                    start: updatedEvent.start,
                    end: updatedEvent.end,
                    resourceId: updatedEvent.resourceId,
                    id: updatedEvent.id,
                    extendedProps: {
                        reservationNo: updatedEvent.extendedProps.reservationNo
                    },
                    color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                });
            }
        }
    }

    function closeModalAndClearInputs() {
        let modal = document.getElementById('insertModal');
        modal.style.display = 'none';
        clearModalInputs();
    }

    function clearModalInputs() {
        document.getElementById('insertTitle').value = '';
        document.getElementById('detailTitle').value = '';
        document.getElementById('insertStart').value = '';
        document.getElementById('detailStart').value = '';
        document.getElementById('insertEnd').value = '';
        document.getElementById('detailEnd').value = '';
        document.getElementById('insertAssetNo').value = '';
        document.getElementById('detailAssetNo').value = '';
        document.getElementById('insertResourceId').value = '';
        document.getElementById('detailResourceId').value = '';
        document.getElementById('detailReservationNo').value = '';
    }
</script>
<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
    <%@include file="/include/KGW_bar.jsp"%>
    <div class="content-wrapper">

        <div style="width: 100%; height: 100px; padding-left: 24px; padding-right: 24px; padding-top: 16px; padding-bottom: 16px; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: inline-flex">
            <div style="justify-content: flex-end; align-items: center; display: inline-flex; flex-direction: row-reverse;">
                <div style="justify-content: flex-start; align-items: center; display: flex">
                    <div style="color: rgba(0, 0, 0, 0.45); font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word">일정</div>
                </div>
                <div style="padding-left: 8px; padding-right: 8px; flex-direction: column; justify-content: flex-start; align-items: center; gap: 10px; display: inline-flex">
                    <div style="color: rgba(0, 0, 0, 0.45); font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word">></div>
                </div>
                <div style="justify-content: flex-start; align-items: center; display: flex">
                    <div style="color: rgba(0, 0, 0, 0.85); font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word">일정현황</div>
                </div>
            </div>
            <div style="padding-top: 14px; padding-bottom: 6px; justify-content: flex-start; align-items: center; gap: 16px; display: inline-flex">
                <div style="width: 16.25px; height: 16px; position: relative">
                    <div style="width: 13.35px; height: 12.71px; left: 1.45px; top: 1.64px; position: absolute; background: rgba(0, 0, 0, 0.85)"></div>
                </div>
                <div style="justify-content: flex-start; align-items: center; gap: 12px; display: flex">
                    <div style="color: rgba(0, 0, 0, 0.85); font-size: 20px; font-family: Roboto; font-weight: 700; line-height: 28px; word-wrap: break-word">일정현황</div>
                    <div style="color: rgba(0, 0, 0, 0.45); font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 22px; word-wrap: break-word">일정현황을 조회할 수 있는 페이지입니다.</div>
                </div>
            </div>
        </div>

        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="container-fluid1">
                            <h2 class="cal_title">일정 현황</h2>
                            <input type="button" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary col-md-1" id="addEvent" name="addEvent" value="일정 등록"/>
                        </div>
                        <hr />

                        <%-- 캘린더 태그 --%>
                        <div id="calendar"></div>
                    </div>
                </div>
            </div>
        </section>

    <%
    // 현재 날짜 가져오기
    Date today = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String todayDate = dateFormat.format(today);
%>

<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <%-- 내 일정 현황 태그 --%>
                <div class="container-fluid1">
                    <h2 class="cal_title">오늘 내 일정</h2>
                    <!-- 검색기 시작 -->
                    <div class="row">
                        <div class="col-3">
                            <select id="gubun" class="form-select" aria-label="분류선택">
                                <option value="none">분류선택</option>
                                <option value="b_title">참석자</option>
                                <option value="b_writer">일정명</option>
                                <option value="b_content">일정일</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                                   aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                        </div>
                        <div class="col-3">
                            <input type="button" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" id="searchBtn" name="searchBtn" value="검색" onclick="reservSearch()"/>
                        </div>
                    </div>
                </div>

                <div class="container-fluid">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">참석자</th>
                            <th scope="col">일정명</th>
                            <th scope="col">일정시간</th>
                            <th scope="col">취소</th>
                        </tr>
                        </thead>
                        <tbody id="reservationTableBody">
                        <% List<CalendarVO> calendarList1 = (List<CalendarVO>) request.getAttribute("calendarList");
                            if (calendarList1 != null) {
                                for (CalendarVO vo : calendarList1) {
                                    String startDateTime = vo.getCalendar_start().split("T")[0]; // 일정 시작일자만 추출
                                    String endDateTime = vo.getCalendar_end().split("T")[0]; // 일정 종료일자만 추출
                                    if (startDateTime.equals(todayDate) || endDateTime.equals(todayDate) || (startDateTime.compareTo(todayDate) < 0 && endDateTime.compareTo(todayDate) > 0)) { // 오늘 날짜와 시작일 또는 종료일이 일치하거나 오늘 날짜가 시작일과 종료일 사이에 있는 경우에만 출력
                        %>
                        <tr>
                            <th scope="row">#</th>
                            <td><%= vo.getName() %></td>
                            <td><%= vo.getCalendar_title() %></td>
                            <td><%= startDateTime + "~" + endDateTime %></td>
                            <td><button class="btn btn-danger cancel-button" style="background-color: #652C2C;">취소</button></td>
                        </tr>
                        <%          }
                        }
                        }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

        <!-- 일정등록 모달 -->
        <div class="modal " id="insertModal">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content rounded-4 shadow">
                    <div class="modal-header p-5 pb-2 border-bottom-0">
                        <h1 class="fw-bold mb-0 fs-2">일정 등록</h1>
                    </div>
                    <div class="modal-body p-5 pt-0">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control rounded-3" id="insertTitle" name="insertTitle" placeholder="일정명">
                            <label for="insertTitle">일정명</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="datetime-local" class="form-control rounded-3" id="insertStart" name="insertStart">
                            <label for="insertStart">일정 시작</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="datetime-local" class="form-control rounded-3" id="insertEnd" name="insertEnd">
                            <label for="insertEnd">일정 종료</label>
                        </div>
                        <input type="button" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" id="submitEvent" name="submitEvent" value="등록"/>
                        <input type="button" class="w-100 mb-2 btn btn-lg rounded-3 btn-secondary close" id="exitEvent" name="exitEvent" value="취소"/>
                    </div>
                </div>
            </div>
        </div>

        <!-- 일정 수정/삭제 모달 -->
        <div class="modal " id="detailModal">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content rounded-4 shadow">
                    <div class="modal-header p-5 pb-4 border-bottom-0">
                        <h1 class="fw-bold mb-0 fs-2">일정 상세</h1>
                    </div>
                    <div class="modal-body p-5 pt-0">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control rounded-3" id="detailTitle" name="detailTitle" placeholder="일정명">
                            <label for="detailTitle">일정명</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control rounded-3" id="detailReservationNo" name="detailReservationNo" placeholder="일정명">
                            <label for="detailReservationNo">일정 번호</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="datetime-local" class="form-control rounded-3" id="detailStart" name="detailStart">
                            <label for="detailStart">일정 시작</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="datetime-local" class="form-control rounded-3" id="detailEnd" name="detailEnd">
                            <label for="detailEnd">일정 종료</label>
                        </div>
                        <input type="button" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" id="updateEvent" name="updateEvent" value="수정"/>
                        <input type="button" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" id="deleteEvent" name="deleteEvent" value="삭제"/>
                        <input type="button" class="w-100 mb-2 btn btn-lg rounded-3 btn-secondary close" id="exitEvent2" name="exitEvent" value="취소"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
