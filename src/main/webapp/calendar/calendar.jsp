<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
    <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN 라이선스 표시 없애기 위해 locale 사용 -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <!-- moment.js 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <!-- moment-timezone.js 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.34/moment-timezone-with-data.min.js"></script>

    <!-- 부트스트랩 라이브러리 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/calendar.css" />
</head>
<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
    <%@include file="/include/KGW_bar.jsp"%>
    <div class="content-wrapper">

        <div style="width: 100%; height: 100px; padding-left: 24px; padding-right: 24px; padding-top: 16px; padding-bottom: 16px; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: inline-flex">
            <div style="justify-content: flex-start; align-items: center; display: inline-flex">
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
                            <button id="addEventBtn" class="btn btn-primary col-md-1">일정 등록</button>
                        </div>
                        <hr />

                        <%-- 캘린더 태그 --%>
                        <div id="calendar"></div>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <%-- 내 예약 현황 태그 --%>
                        <div class="container-fluid1">
                            <h2 class="cal_title">내 일정 현황</h2>
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
                                    <th scope="col">일정명</th>
                                    <th scope="col">참여자</th>
                                    <th scope="col">시간</th>
                                    <th scope="col">수정</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- DB에서 가져온 정보를 동적으로 표시 -->
                                <c:forEach var="vo" items="${assetList}">
                                    <c:forEach var="vo1" items="${assetReservationList}">
                                        <!-- 여기에서 필요한 정보를 가져와 사용 -->
                                        <tr>
                                            <th scope="row">#</th>
                                            <td><c:out value="${vo.asset_name}"/></td>
                                            <td><c:out value="${vo.emp_no}"/></td>
                                            <td><c:out value="${vo1.reservation_start}~${vo1.reservation_end}"/></td>
                                            <td><button class="btn btn-danger cancel-button" style="background-color: #652C2C;">취소</button></td>
                                        </tr>
                                    </c:forEach>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- modal 태그 -->
        <div id="eventModal" class="modal" style="display: none;">
            <div class="modal-content">
                <span class="close">&times;</span>
                <label for="eventTitle">일정명:</label>
                <input type="text" id="eventTitle" name="eventTitle"><br>

                <label for="eventStart">일정 시작:</label>
                <input type="datetime-local" id="eventStart" name="eventStart"><br>

                <label for="eventEnd">일정 종료:</label>
                <input type="datetime-local" id="eventEnd" name="eventEnd"><br>

                <button id="submitEvent">Add Event</button>
            </div>
        </div>
    </div>
</div>
<script>
    (function(){
        $(function(){
            // calendar element 취득
            let calendarEl = $('#calendar')[0];
            // full-calendar 생성하기
            let calendar = new FullCalendar.Calendar(calendarEl, {
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
                eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
                    console.log(obj);
                },
                eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
                    console.log(obj);
                },
                eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
                    console.log(obj);
                },

                select: function(arg) {
                    let modal = document.getElementById('eventModal');
                    modal.style.display = 'block';

                    let titleInput = document.getElementById('eventTitle');
                    let startInput = document.getElementById('eventStart');
                    let endInput = document.getElementById('eventEnd');
                    let submitBtn = document.getElementById('submitEvent');
                    let closeBtn = document.querySelector('.modal-content .close');

                    // 한국 시간대로 시작 시간과 종료 시간을 설정합니다.
                    let startTime = moment.tz(arg.start, 'Asia/Seoul').format('YYYY-MM-DDTHH:mm');
                    let endTime = moment.tz(arg.end, 'Asia/Seoul').format('YYYY-MM-DDTHH:mm');

                    startInput.value = startTime;
                    endInput.value = endTime;

                    submitBtn.onclick = function() {
                        let title = titleInput.value;
                        let start = startInput.value;
                        let end = endInput.value;

                        if (title && start && end) {
                            calendar.addEvent({
                                title: title,
                                start: start,
                                end: end,
                                color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                            });
                        }

                        modal.style.display = 'none';
                        // 모달이 닫힐 때 입력 필드 초기화
                        titleInput.value = '';
                        startInput.value = '';
                        endInput.value = '';
                    };

                    closeBtn.onclick = function() {
                        modal.style.display = 'none';
                    };

                    window.onclick = function(event) {
                        if (event.target == modal) {
                            modal.style.display = 'none';
                        }
                    };
                },

                events: [
                    {
                        title: 'All Day Event',
                        start: '2024-02-01',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    {
                        title: 'Long Event',
                        start: '2024-02-07',
                        end: '2024-02-10',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    {
                        groupId: 999,
                        title: 'Repeating Event',
                        start: '2024-02-09T16:00:00',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    {
                        groupId: 999,
                        title: 'Repeating Event',
                        start: '2024-02-16T16:00:00',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    {
                        title: 'Conference',
                        start: '2024-02-11',
                        end: '2024-02-13',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    {
                        title: 'Meeting',
                        start: '2024-02-12T10:30:00',
                        end: '2024-02-12T12:30:00',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    {
                        title: 'Lunch',
                        start: '2024-02-12T12:00:00',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    {
                        title: 'Meeting',
                        start: '2024-02-12T14:30:00',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    {
                        title: 'Happy Hour',
                        start: '2024-02-12T17:30:00',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    {
                        title: 'Dinner',
                        start: '2024-02-12T20:00:00',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    {
                        title: 'Birthday Party',
                        start: '2024-02-13T07:00:00',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    },
                    {
                        title: 'Click for Google',
                        url: 'http://google.com/', // 클릭시 해당 url로 이동
                        start: '2024-02-28',
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    }
                ]
            });
            // 캘린더 랜더링
            calendar.render();
        });
    })();
</script>
</body>
</html>
