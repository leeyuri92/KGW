<%--
  Created by IntelliJ IDEA.
  User: ROOPRETELCHAM
  Date: 2024-02-28
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<script>
  function handleEventSubmit() {
    let titleInput = document.getElementById('insertTitle');
    let startInput = document.getElementById('insertStart');
    let endInput = document.getElementById('insertEnd');
    let title = titleInput.value;
    let start = startInput.value;
    let end = endInput.value;
    let url = '/calendar/addCalendar';
    let data =  'title=' + encodeURIComponent(title) +
                '&start=' + encodeURIComponent(start) +
                '&end=' + encodeURIComponent(end)

    if (title && start && end) {
      let xhr = new XMLHttpRequest();
      xhr.open('POST', url, true);
      xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

      xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
          console.log(addEventToCalendar.toString());
          addEventToCalendar(title, start, end);
          updateCalendarList();
          console.log('새 이벤트가 성공적으로 등록되었습니다.');
        }
      };
      xhr.send(data);
    }
    closeModalAndClearInputs();
  }
  function addEventToCalendar(title, start, end) {
    // renderCalendarList();
    // updateCalendarList();
    calendar.addEvent({
      title: title,
      start: start,
      end: end,
      color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
    });
  }

</script>

</body>
</html>
