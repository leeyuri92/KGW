<%--
  Created by IntelliJ IDEA.
  User: ROOPRETELCHAM
  Date: 2024-02-22
  Time: 오후 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<script>

    // 예약 삭제 이벤트 및 DB 데이터 삭제
    function handleEventDelete(id, reservationNo) {
        let assetNoInput = document.getElementById('detailAssetNo');
        id = assetNoInput.value;
        let reservationNoInput = document.getElementById('detailReservationNo');
        reservationNo = reservationNoInput.value;
        let eventToDelete = calendar.getEventById(id);
        let url = '/reservation/delReservation?reservation_no=' + reservationNo;

        // AJAX를 이용 서버에 삭제
        let xhr = new XMLHttpRequest();
        xhr.open('DELETE', url, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                console.log(xhr);
                let response = xhr.responseText;
                eventToDelete.remove(); // 이벤트 삭제
                console.log('이벤트가 성공적으로 삭제되었습니다.');
                let modal = document.getElementById('detailModal');
                modal.style.display = 'none';
            }
        };
        // 서버로 전송할 데이터 설정 (id와 함께 예약번호도 포함)
        let data = 'id=' + encodeURIComponent(id) + '&reservationNo=' + encodeURIComponent(reservationNo);
        xhr.send(data); // 데이터 전송
    }

    let deleteBtn = document.getElementById('deleteEvent');
    deleteBtn.addEventListener('click', handleEventDelete);






    // 등록모달 입력값 등록 함수
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
        let url = '/reservation/addReservation?asset_no='+ id; // 데이터베이스에 새 이벤트를 추가하는 엔드포인트

        if (title && start && end && id && resourceId) {
            // AJAX를 이용 서버에 등록
            let xhr = new XMLHttpRequest();
            xhr.open('POST', url, true); // GET 대신 POST로 변경
            xhr.setRequestHeader('Content-Type', 'application/json');

            console.log(id);

            // 요청이 완료되면 실행되는 함수를 정의합니다.
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    console.log(xhr);
                    // 성공적으로 이벤트가 추가되면 달력에도 추가합니다.
                    calendar.addEvent({
                        title: title,
                        start: start,
                        end: end,
                        resourceId: resourceId,
                        id: id,
                        color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
                    });
                    console.log(xhr);
                    console.log('새 이벤트가 성공적으로 등록되었습니다.');
                }
            };
            // 서버로 보낼 데이터를 준비합니다.
            let eventData = {
                title: title,
                start: start,
                end: end,
                resourceId: resourceId,
                id: id
            };
            // 데이터를 JSON 형식으로 변환하여 전송합니다.
            // 서버로 전송할 데이터 설정 (id와 함께 예약번호도 포함)
            xhr.send(JSON.stringify(eventData)); // JSON 문자열로 변환하여 데이터 전송
        } else {
            console.error('입력값이 유효하지 않습니다.');
        }
        // 모달을 닫고 입력값 초기화
        let modal = document.getElementById('insertModal');
        modal.style.display = 'none';
        clearModalInputs();
    }
</script>

</body>
</html>
