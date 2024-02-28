<%@ page import="java.util.List" %>
<%@ page import="com.vo.CalendarVO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
                // slotLabelFormat: { hour: 'numeric', minute: '2-digit', hour12: false }, // 시간을 24시간 형식으로 표시
                // eventAdd: function(obj) {
                //     console.log(obj);
                // },
                // eventChange: function(obj) {
                //     console.log(obj);
                // },
                // eventRemove: function(obj) {
                //     console.log(obj);
                // },

                // 타임라인 드래그 이벤트
                select: function(arg) {
                    if (detailStart && detailEnd == !null) {
                        let modal = document.getElementById('detailModal');
                        modal.style.display = 'block';

                        let startInput = document.getElementById('detailStart');
                        let endInput = document.getElementById('detailEnd');
                        let resourceIdInput = document.getElementById('detailResourceId');
                        let detailAssetNoInput = document.getElementById('detailAssetNo');

                        let startTime = moment(arg.start, 'Asia/Seoul').format('YYYY-MM-DDTHH:mm');
                        let endTime = moment(arg.end, 'Asia/Seoul').format('YYYY-MM-DDTHH:mm');

                        startInput.value = startTime;
                        endInput.value = endTime;
                        resourceIdInput.value = arg.resource.id;
                        detailAssetNoInput.value = arg.id;
                        console.log(arg.id);
                    } else {
                        let modal = document.getElementById('insertModal');
                        modal.style.display = 'block';

                        let startInput = document.getElementById('insertStart');
                        let endInput = document.getElementById('insertEnd');
                        let resourceIdInput = document.getElementById('insertResourceId');
                        let insertAssetNoInput = document.getElementById('insertAssetNo');

                        let startTime = moment(arg.start, 'Asia/Seoul').format('YYYY-MM-DDTHH:mm');
                        let endTime = moment(arg.end, 'Asia/Seoul').format('YYYY-MM-DDTHH:mm');

                        startInput.value = startTime;
                        endInput.value = endTime;
                        resourceIdInput.value = arg.resource.id;
                        // insertAssetNoInput.value = arg.event.id;
                    }
                },


                eventClick: function(info) {
                    if(detailStart && detailEnd != null) {
                        let modal = document.getElementById('detailModal');
                        modal.style.display = 'block';

                        let detailTitleInput = document.getElementById('detailTitle');
                        let detailStartInput = document.getElementById('detailStart');
                        let detailEndInput = document.getElementById('detailEnd');
                        let detailResourceIdInput = document.getElementById('detailResourceId');
                        let detailAssetNoInput = document.getElementById('detailAssetNo');
                        let detailReservationNoInput = document.getElementById('detailReservationNo');

                        // FullCalendar의 함수를 사용하여 정보 가져오기
                        let event = info.event;
                        detailTitleInput.value = event.title;
                        detailAssetNoInput.value = event.id;

                        detailReservationNoInput.value = event.extendedProps.reservationNo;


                        // 이벤트의 리소스 가져오기
                        let resource = event.getResources()[0]; // 이벤트가 하나의 리소스에만 할당되었다고 가정합니다.

                        if (resource) {
                            detailResourceIdInput.value = resource.id;
                        } else {
                            console.error('Resource not found.');
                            detailResourceIdInput.value = '';
                        }
                        // moment.js를 사용하여 시간 형식 맞추기
                        detailStartInput.value = moment(event.start).format('YYYY-MM-DDTHH:mm');
                        detailEndInput.value = moment(event.end).format('YYYY-MM-DDTHH:mm');
                    }else{
                        let modal = document.getElementById('insertModal');
                        modal.style.display = 'block';

                        let insertTitleInput = document.getElementById('insertTitle');
                        let insertStartInput = document.getElementById('insertStart');
                        let insertEndInput = document.getElementById('insertEnd');
                        let insertResourceIdInput = document.getElementById('insertResourceId');
                        let insertAssetNoInput = document.getElementById('insertAssetNo');
                        let insertReservationNoInput = document.getElementById('insertReservationNo');

                        // FullCalendar의 함수를 사용하여 정보 가져오기
                        let event = info.event;
                        insertTitleInput.value = event.title;
                        insertAssetNoInput.value = event.id;

                        insertReservationNoInput.value = event.extendedProps.reservationNo;


                        // 이벤트의 리소스 가져오기
                        let resource = event.getResources()[0]; // 이벤트가 하나의 리소스에만 할당되었다고 가정합니다.

                        if (resource) {
                            insertResourceIdInput.value = resource.id;
                        } else {
                            console.error('Resource not found.');
                            insertResourceIdInput.value = '';
                        }
                        // moment.js를 사용하여 시간 형식 맞추기
                        insertStartInput.value = moment(event.start).format('YYYY-MM-DDTHH:mm');
                        insertEndInput.value = moment(event.end).format('YYYY-MM-DDTHH:mm');
                    }
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
                        id: '<%= vo1.getAsset_no() %>', // 이벤트의 고유 ID
                        extendedProps: { reservationNo: '<%= vo1.getReservation_no() %>' }, // 예약 정보를 사용자 정의 속성 extendedProps에 포함 (events 배열에서 각 이벤트 객체의 extendedProps를 설정하여 확장 속성을 추가)
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

        // 예약 취소 모달 관련 스크립트
        const modal = document.getElementById('detailModal');
        const span = document.getElementsByClassName("close")[0];

        span.onclick = function () {
            modal.style.display = "none";
        }

        window.onclick = function (event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        }

        //내 예약 현황 취소 버튼
        let cancelButtonList = document.querySelectorAll('.cancel-button');
        cancelButtonList.forEach(function (cancelButton) {
            cancelButton.addEventListener('click', function () {
                let modal = document.getElementById('detailModal');
                modal.style.display = 'block';
            }, { passive: true }); // passive 옵션 추가
        });

        // 이벤트 핸들러 등록
        let submitBtn = document.getElementById('submitEvent');
        let searchBtn = document.getElementById('searchEvent');
        let exitBtn = document.getElementById('exitEvent');
        let deleteBtn = document.getElementById('deleteEvent');
        let updateBtn = document.getElementById('updateEvent');
        let closeBtnList = document.querySelectorAll('.modal-content .close');

        submitBtn.addEventListener('click', handleEventSubmit);
        submitBtn.addEventListener('click', handleEventUpdate);
        searchBtn.addEventListener('click', reservSearch);
        exitBtn.addEventListener('click', handleEventSubmit);
        exitBtn.addEventListener('click', handleEventUpdate);
        deleteBtn.addEventListener('click', handleEventDelete);
        updateBtn.addEventListener('click', handleEventUpdate);
        closeBtnList.forEach(function(closeBtn) {
            closeBtn.addEventListener('click', handleModalClose);
            closeBtn.addEventListener('click', handleEventUpdate);
        });

        function handleEventSubmit() {
            let titleInput = document.getElementById('insertTitle');
            let startInput = document.getElementById('insertStart');
            let endInput = document.getElementById('insertEnd');
            let resourceIdInput = document.getElementById('insertResourceId');
            let assetNoInput = document.getElementById('insertAssetNo');

            let title = titleInput.value;
            let start = startInput.value;
            let end = endInput.value;
            let resourceId = resourceIdInput.value;
            let id = assetNoInput.value;
            let url = '/reservation/addReservation';

            if (title && start && end && id && resourceId) {
                let xhr = new XMLHttpRequest();
                xhr.open('POST', url, true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        // console.log(xhr.responseText);
                        console.log(addEventToCalendar.toString());
                        addEventToCalendar(title, start, end, resourceId, id);
                        console.log('새 이벤트가 성공적으로 등록되었습니다.');
                    }
                };

                let data = 'title=' + encodeURIComponent(title) +
                    '&start=' + encodeURIComponent(start) +
                    '&end=' + encodeURIComponent(end) +
                    '&resourceId=' + encodeURIComponent(resourceId) +
                    '&id=' + encodeURIComponent(id);

                xhr.send(data);
            } else {
                console.error('입력값이 유효하지 않습니다.');
            }
            closeModalAndClearInputs();
        }


        function addEventToCalendar(title, start, end, resourceId, id) {
            updateReservationList(renderReservationList);
            calendar.addEvent({
                title: title,
                start: start,
                end: end,
                resourceId: resourceId,
                id: id,
                color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
            });
        }

        function closeModalAndClearInputs() {
            let modal = document.getElementById('insertModal');
            modal.style.display = 'none';
            clearModalInputs();
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
            let reservationNo = reservationNoInput.value;
            let id = assetNoInput.value;

            if (title && start && end && resourceId && reservationNo && id) {
                let url = '/reservation/updateReservation';
                let xhr = new XMLHttpRequest();
                xhr.open('PUT', url, true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        console.log('이벤트가 성공적으로 업데이트되었습니다.');
                        let updatedEvent = {
                            title: title,
                            start: start,
                            end: end,
                            resourceId: resourceId,
                            id: id,
                            extendedProps: {
                                reservationNo: reservationNo
                            }
                        };
                        updateToCalendar(updatedEvent);
                    }
                };

                let eventData = 'id=' + encodeURIComponent(id) +
                    '&reservationNo=' + encodeURIComponent(reservationNo) +
                    '&title=' + encodeURIComponent(title) +
                    '&start=' + encodeURIComponent(start) +
                    '&end=' + encodeURIComponent(end);

                xhr.send(eventData);
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
                    updateReservationList(renderReservationList);
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

        // 모달 닫기 처리 함수
        function handleModalClose() {
            let modal1 = document.getElementById('insertModal');
            let modal2 = document.getElementById('detailModal');
            modal1.style.display = 'none';
            modal2.style.display = 'none';
            clearModalInputs();
        }

        // 모달 입력값 초기화 함수
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
    });

    // 모달 외부 클릭 시 모달 닫기
    window.onclick = function(event) {
        let modal1 = document.getElementById('insertModal');
        let modal2 = document.getElementById('detailModal');
        if (event.target === modal1) {
            modal1.style.display = 'none';
        } else if (event.target === modal2) {
            modal2.style.display = 'none';
        }
    }

    function searchEnter(event) {
        console.log(event.key);
        if (event.key === 'Enter') {
            noticeSearch();
        }
        event.isComposing; //검색후 잔여검색기록 없애는코드
    }

    // 검색된 값을 서버로 전송하고, 서버로부터 받은 데이터를 처리하여 예약 현황에 출력하는 함수
    function reservSearch() {
        const gubun = document.querySelector("#gubun").value;
        const keyword = document.querySelector("#keyword").value;

        const searchData = new URLSearchParams();
        searchData.append('gubun', gubun);
        searchData.append('keyword', keyword);

        fetch('/reservation/reservList', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: searchData,
        })
            .then(response => response.json())
            .then(data => {
                renderSearchedReservationList(data);
            })
            .catch((error) => {
                console.error('Error:', error);
            });
    }

    // 서버에서 받은 데이터를 처리하여 예약 현황에 출력하는 함수
    function renderSearchedReservationList(data) {
        // 받은 데이터를 예약 현황에 출력하는 코드를 작성
        // 예를 들어, 받은 데이터를 HTML 형식으로 파싱하여 예약 현황에 추가
        // 이 함수는 실제 예약 현황을 업데이트하는 데 필요한 로직을 구현해야함
    }


    // CRUD 작업 후 예약 목록 업데이트
    function updateReservationList() {
        let xhr = new XMLHttpRequest();
        let url = '/reservation/reservationList';

        xhr.open('GET', url, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                let responseText = xhr.responseText;
                renderReservationList(responseText);
            }
        };
        xhr.send();
    }

    // 예약 목록을 화면에 렌더링하는 함수
    function renderReservationList(data) {
        const tempDiv = document.createElement('div');
        tempDiv.innerHTML = data;

        const reservationTableBody = tempDiv.querySelector('#reservationTableBody');

        if (reservationTableBody) {
            const tbody = document.getElementById('reservationTableBody');
            tbody.innerHTML = reservationTableBody.innerHTML;
        }
    }
</script>
<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
    <%@include file="/include/KGW_bar.jsp"%>
    <div class="content-wrapper">

        <div style="width: 100%; height: 100px; padding-left: 24px; padding-right: 24px; padding-top: 16px; padding-bottom: 16px; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: inline-flex">
            <div style="justify-content: flex-end; align-items: center; display: inline-flex; flex-direction: row-reverse;">
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


        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="container-fluid1">
                            <h2 class="cal_title">자산 예약 현황</h2>
                            <button id="addEventBtn" class="btn btn-primary col-md-1">일정 등록</button>
                        </div>
                        <hr />

                        <%-- 캘린더 태그 --%>
                        <div id="calendar1"></div>
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
                                    <input type="button" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" id="searchEvent" name="searchEvent" value="검색" onclick="reservSearch()"/>
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
                                    if (assetReservationList != null) {
                                        for (CalendarVO vo : assetReservationList) {
                                            String startDateCheck = vo.getReservation_start().split("T")[0]; // 예약 시작일자만 추출
                                            String endDateCheck = vo.getReservation_end().split("T")[0]; // 예약 종료일자만 추출
                                            String startDate = vo.getReservation_end();
                                            String endDate = vo.getReservation_end();
                                            if (startDateCheck.equals(todayDate) || endDateCheck.equals(todayDate) || (startDateCheck.compareTo(todayDate) < 0 && endDateCheck.compareTo(todayDate) > 0)) { // 오늘 날짜와 시작일 또는 종료일이 일치하거나 오늘 날짜가 시작일과 종료일 사이에 있는 경우에만 출력
                                %>
                                <tr>
                                    <th scope="row">#</th>
                                    <td><%= vo.getAsset_no() %></td>
                                    <td><%= vo.getName() %></td>
                                    <td><%= vo.getReservation_title() %></td>
                                    <td><%= startDate + "~" + endDate %></td>
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

        <!-- 예약등록 모달 -->
        <div class="modal " id="insertModal">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content rounded-4 shadow">
                    <div class="modal-header p-5 pb-2 border-bottom-0">
                        <h1 class="fw-bold mb-0 fs-2">예약 등록</h1>
                    </div>
                    <div class="modal-body p-5 pt-0">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control rounded-3" id="insertTitle" name="insertTitle" placeholder="일정명">
                            <label for="insertTitle">예약명</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="datetime-local" class="form-control rounded-3" id="insertStart" name="insertStart">
                            <label for="insertStart">예약 시작</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="datetime-local" class="form-control rounded-3" id="insertEnd" name="insertEnd">
                            <label for="insertEnd">예약 종료</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control rounded-3" id="insertResourceId" name="insertResourceId" placeholder="시설 ID">
                            <label for="insertResourceId">시설 ID</label>
                        </div>
                        <select class="form-control" id="insertAssetNo" name="insertAssetNo">
                            <option value="0" selected>자산을 선택하세요.</option>
                            <option value="101">대회의실</option>
                            <option value="102">소회의실</option>
                            <option value="103">미팅룸</option>
                            <option value="104">선수훈련실</option>
                            <option value="105">물리치료실A</option>
                            <option value="106">물리치료실B</option>
                            <option value="107">벤틀리</option>
                            <option value="108">벤츠S</option>
                            <option value="109">전용기</option>
                        </select>
                        <br>
<%--                        <div class="form-floating mb-3">--%>
<%--                            <input type="text" class="form-control rounded-3" id="insertAssetNo" name="insertAssetNo" placeholder="시설 고유ID">--%>
<%--                            <label for="insertAssetNo">시설 고유ID</label>--%>
<%--                        </div>--%>
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
                        <h1 class="fw-bold mb-0 fs-2">예약 상세</h1>
                    </div>
                    <div class="modal-body p-5 pt-0">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control rounded-3" id="detailTitle" name="detailTitle" placeholder="일정명">
                            <label for="detailTitle">예약명</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control rounded-3" id="detailReservationNo" name="detailReservationNo" placeholder="일정명">
                            <label for="detailReservationNo">예약 번호</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="datetime-local" class="form-control rounded-3" id="detailStart" name="detailStart">
                            <label for="detailStart">예약 시작</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="datetime-local" class="form-control rounded-3" id="detailEnd" name="detailEnd">
                            <label for="detailEnd">예약 종료</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control rounded-3" id="detailResourceId" name="detailResourceId" placeholder="시설 ID">
                            <label for="detailResourceId">시설 ID</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control rounded-3" id="detailAssetNo" name="detailAssetNo" placeholder="시설 고유ID">
                            <label for="detailAssetNo">시설 고유ID</label>
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
