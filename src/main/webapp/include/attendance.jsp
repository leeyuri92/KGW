<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
    <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <!-- jquery CDN -->
    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN 라이선스 표시 없애기 위해 locale 사용 -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <!-- moment-timezone.js 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.34/moment-timezone-with-data.min.js"></script>
    <!-- 부트스트랩 라이브러리 -->
    <link rel="stylesheet" href="/css/calendar.css">
</head>
<body class="hold-transition sidebar-mini sidebar-collapse ">
<div class="wrapper">
    <%@include file="/include/KGW_bar.jsp"%>
    <!-- body start    -->
    <div class="content-wrapper">
        <!-- 페이지 path start    -->
        <%--		<div class="card" >--%>
        <div class="box-header p-4" >
            <div class="d-flex align-items-center">
                <div class="d-flex align-items-center me-2">
                    <a class="text-muted fs-6" href="#">마이페이지</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">근태관리</div>
                </div>
            </div>
            <div class="d-flex align-items-center mt-2">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0" ></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">근태관리</div>
                    <div class="text-muted ms-3">출퇴근 정보를 조회할 수 있는 페이지입니다.</div>
                </div>
            </div>
        </div>
        <div class="box">
            <!-- calendar 태그 -->
            <div id='calendar-container'>
                <div id='calendar'></div>
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
