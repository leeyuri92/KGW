<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//    List<AttendanceVO> attendanceCalendar = (List) request.getAttribute("attendanceCalendar");

//  out.print(attendanceCalendar);
%>

    <!-- calendar 태그 -->
    <div id='calendar-container'>
        <div id='calendar'></div>
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
                editable: true, // 수정 가능
                selectable: true, // 달력 일자 드래그 설정가능
                nowIndicator: true, // 현재 시간 마크
                dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
                height: '650px', // calendar 높이 설정
                locale: 'ko', // 한국어 설정

                events: [
                    <%
                      for(int i = 0; i < attendanceCalendar.size(); i++) {
                        if (attendanceCalendar.get(i).getState() != null){
                    %>
                    {
                        title: '<%=attendanceCalendar.get(i).getState()%>',
                        start: '<%=attendanceCalendar.get(i).getWork_date()%>',
                        color:
                                `
                                            <% if (attendanceCalendar.get(i).getState().equals("지각")){ %>
                                              #ba1b39
                                            <%
                                              }else if(attendanceCalendar.get(i).getState().equals("조퇴")){
                                            %>
                                              #efc30f
                                            <%
                                              }
                                            %>
                                            `
                    },
                    <%
                        }
                      }
                    %>
                ]

            });
            // 캘린더 랜더링
            calendar.render();
        });
    })();
</script>
