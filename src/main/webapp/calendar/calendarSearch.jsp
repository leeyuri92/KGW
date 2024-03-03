<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.util.BSPageBar" %>
<%@ page import="com.vo.NoticeBoardVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.vo.CalendarVO" %>
<%
    int size=0;
    List<NoticeBoardVO> noticeList = (List)request.getAttribute("noticeList");
    if(noticeList!=null){
        size=noticeList.size();
    }

    //페이지처리
    int numPerPage = 15;
    int nowPage = 0;
    if(request.getParameter("nowPage")!=null){
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }

    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/certificate.css" />
    <script type="text/javascript">
        function searchEnter(event){
            console.log(window.event.keyCode)
            if(window.event.keyCode == 13){
                noticeSearch()
            }
            event.isComposing//검색후 잔여검색기록 없애는코드
        }
        function noticeSearch(){
            console.log('noticeSearch');
            const gubun = document.querySelector("#gubun").value;
            const keyword = document.querySelector("#keyword").value;
            console.log(`${gubun} , ${keyword}`);
            location.href="/notice/noticeList?gubun="+gubun+"&keyword="+keyword;
        }
        const noticeDetail= (notice_no) => {
            location.href= "/notice/noticeDetail?notice_no="+notice_no;
        }
        function NoticeForm () {
            location.href = '../admin/noticeForm.jsp';
        }
    </script>
    <!-- Google Font: Source Sans Pro -->
</head>

<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
    <!-- header start -->
    <%@include file="/include/KGW_bar.jsp"%>
    <link rel="stylesheet" href="/css/mediaNoticeCard.css">
    <!-- header end    -->

    <!-- body start    -->
    <div class="content-wrapper">
        <!-- 페이지 path start    -->
        <!-- <div class="card"> -->
        <div class="box-header p-4">
            <div class="d-flex align-items-center">
                <div class="d-flex align-items-center me-2">
                    <a class="text-muted fs-6" href="#">일정</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">일정 관리</div>
                </div>
            </div>
            <div class="d-flex align-items-center mt-3">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0"></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">일정 관리</div>
                    <div class="text-muted ms-3">상세 일정을 관리할 수 있는 페이지입니다.</div>
                </div>
            </div>
        </div> <!-- Main content -->
        <section class="content">
            <!-- Info boxes -->
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="container">
                            <div class="box-header">
                                <h4 style="font-weight: bold; margin-left: 2rem">일정 관리</h4>
                                <hr/>
                            </div>

                            <!-- 검색기 시작 !! div 안에 있는 태그 건들지마시오!! -->                            <!-- 검색기 시작 -->
                            <div class="row search">
                                <div class="col-2 col-sm-2">
                                    <select id="gubun" class="form-select" aria-label="분류선택">
                                        <option value="my">자산 예약</option>
                                        <option value="team">차량 예약</option>
                                    </select>
                                </div>
                                <div class="col-2 col-sm-2">
                                    <select id="calendarGubun" class="form-select" aria-label="분류선택">
                                        <option value="date">일정</option>
                                        <option value="name">예약자</option>
                                    </select>
                                </div>
                                <div class="col-7 col-sm-6">
                                    <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                                           aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                                </div>
                                <div class="col-1 col-sm-2">
                                    <input type="button" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" id="searchEvent" name="searchEvent" value="검색" style="border-radius: 3px;" onclick="calendarSearch()"/>
                                </div>
                            </div>
                        </div>
                            <div class='board-list'>
                                <table class="table table-hover text-center ">
                                    <thead>
                                    <tr>
                                        <th style="width: 10%;">#</th>
                                        <th style="width: 17%;">참석자</th>
                                        <th style="width: 45%;">일정명</th>
                                        <th style="width: 17%;">일정일</th>
                                    </tr>
                                    </thead>
                                    <hr />
<%--                                        <% for (int i = nowPage * numPerPage; i < (nowPage * numPerPage) + numPerPage; i++) {--%>
<%--                                            if (i == size) break;--%>
<%--                                            NoticeBoardVO noticeVO = noticeList.get(i);--%>
<%--                                            String originalString  = noticeVO.getReg_date();--%>
<%--                                            String newFormatString = originalString.substring(0, 10);--%>
<%--                                        %>--%>
                                    <tr>
                                        <% List<CalendarVO> calendarDetail = (List<CalendarVO>) request.getAttribute("calendarDetail");
                                            if (calendarDetail != null) {
                                                int count = 0; // 일정 카운터 변수 추가
                                                for (CalendarVO vo : calendarDetail) {%>
                                        <%
                                            String startDate = vo.getCalendar_start();
                                            String endDate = vo.getCalendar_end();
                                        %>
                                        <th scope="row"><%= ++count %></th> <!-- 일정 번호 출력 -->
                                        <td><%= vo.getName() %></td>
                                        <td><%= vo.getCalendar_title() %></td>
                                        <td><%= startDate + "~" + endDate %></td>
                                    </tr>
                                        <% }
} } %>


                                <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                                <div style="display:flex; justify-content:center;">
                                    <ul class="pagination">
                                        <%
                                            String pagePath = "noticeList";
                                            BSPageBar bspb = new BSPageBar(numPerPage,size,nowPage,pagePath);
                                            out.print(bspb.getPageBar());
                                        %>
                                    </ul>
                                </div>
                                <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                            </div>
                            <!-- 회원목록   끝  -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>
