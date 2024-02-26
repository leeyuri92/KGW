<%--
  이름 : 이유리
  날짜 : 2024-02-18
  내용 : FAChart
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    List<Map<String, Object>> fList = (List)request.getAttribute("fList");
//    String wChart = (String)request.getAttribute("wChart");
    int size = fList.size();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>FA선수현황차트</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        <%-----------------------------------------------------------------------------------
          이름 : 이유리
          날짜 : 2024-02-21
          내용 : 등록/방출에 따른 WAR값 Ajax 처리
        ---------------------------------------------------------------------------------------%>

        function faUpdate(FA_NO) {
            $.ajax({
                url: '/faUpdate',
                type: 'GET',
                data: {FA_NO: FA_NO},
                success: function (response) {
                    console.log("response : " + response); // 넘어 오는 값은 없을 거임

                    //faUpdate가 성공하면 /faWar 실행
                    $.ajax({
                        url: '/faWar',
                        type: 'GET',
                        success: function (data) {
                            // id가 "chart"인 부분을 다시 그리기
                            console.log("data : " + data + ", type : " + typeof (data));
                            document.querySelector('#barchart_material').innerHTML = data;
                            google.charts.setOnLoadCallback(drawChart(data));
                        },
                        error: function () {
                            alert('Error occurred while loading new chart.');
                        }
                    });

                    // 버튼 다시 그려주기
                    console.log("FA_NO : " + FA_NO);
                    let btn = document.querySelector('#btn_' + FA_NO);
                    (btn.innerHTML === "방출") ? btn.innerHTML = "등록" : btn.innerHTML = "방출";
                },
                error: function () {
                    alert('Error occurred while updating data.');
                }
            });
        }

        // 첫번째 차트
        google.charts.load('current', {'packages': ['bar']});
        google.charts.setOnLoadCallback(drawStuff);

        function drawStuff() {
            const data = new google.visualization.arrayToDataTable(
                ${wChart}
                //[
                // ['NAME', 'WAR'],
                // ["김선빈", 2.68],
                // ["임찬규", 2.15],
                // ["양석환", 1.76],
                // ["함덕주", 1.53],
                // ['홍건희', 1.12],
                // ['김민성', 0.96],
                // ['임창민', 0.94],
                // ['김민식', 0.69],
                // ['이지영', 0.11],
                // ['김대우', 0.04],
                // ['오승환', -0.07],
                // ['주권', -0.14],
                // ['강한울', -0.77]
                // ]
            );

            const options = {
                width: 900,
                legend: {position: 'none'},
                axes: {
                    x: {
                        0: {side: 'top', label: '선수명'} // Top x-axis.
                    }
                },
                bar: {groupWidth: "60%"},
                colors: ['#7c1512']
            };

            const chart = new google.charts.Bar(document.getElementById('top_x_div'));
            chart.draw(data, google.charts.Bar.convertOptions(options));

            google.visualization.events.addListener(chart, 'select', selectHandler);

            function selectHandler() {
                const selection = chart.getSelection();
                alert('That\'s column no. ' + selection[0].row);
            }
        };

        // 두번째 차트
        google.charts.load('current', {'packages': ['bar']});//구글 지원하는 막대그래프 로딩
        google.charts.setOnLoadCallback(drawChart);//막대그래프 그리려면 데이터가 필요함 - 함수호출

        function drawChart(fWar) {
            var data = google.visualization.arrayToDataTable([
                ['선수', 'WAR'],
                [' ', null],
                ['우리구단 WAR', ${kWar}],
                ['FA선수포함', fWar],
                [' ', null]
            ]);
            var options = {
                chart: {
                    title: 'Company Performance',
                    subtitle: 'Sales, Expenses, and Profit: 2014-2017',
                },
                bar: {
                    groupWidth: '50%', // 막대의 그룹 너비 조정
                    gap: 0.1 // 막대 간의 간격 조정
                },
                colors: ['#7c1512']
            };
            var chart = new google.charts.Bar(document.getElementById('barchart_material'));
            chart.draw(data, google.charts.Bar.convertOptions(options));
        }

        // 파이차트
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart2);

        function drawChart2() {
            var data2 = google.visualization.arrayToDataTable(
                ${pChart}
            );
            var options2 = {
                chartArea: {
                    width: '90%', // 차트 영역의 너비
                    height: '90%',// 차트 영역의 높이
                    left: '22%'
                },
                "is3D": true,
                colors: ['#7c1512', '#d77e7b', '#e7c0bd', '#f1e2e1'],
                backgroundColor: 'transparent'
            };
            var chart2 = new google.visualization.PieChart(document.getElementById('piechart'));
            chart2.draw(data2, options2);
        }

    </script>
    <style>
        .chart {
            width: 100%;
            padding-bottom: 15px;
            border-radius: 6px;
            overflow: hidden;
            align-self: stretch;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>

    <%--  <script type="text/javascript">--%>

    <%--	const searchEnter = (event)=> {--%>
    <%--		console.log('searchEnter')--%>
    <%--		console.log(window.event.keyCode); // 13--%>
    <%--		if(window.event.keyCode==13){--%>
    <%--			boardSearch(); // 재사용성 ---%>
    <%--		}--%>
    <%--	}--%>
    <%--	const boardSearch = () => {--%>
    <%--		console.log('boardSearch');--%>
    <%--		const gubun = document.querySelector("#gubun").value;--%>
    <%--		const keyword = document.querySelector("#keyword").value;--%>
    <%--		console.log(`${gubun} , ${keyword}`);--%>
    <%--		location.href="/board/boardList?gubun="+gubun+"&keyword="+keyword;--%>
    <%--	}--%>
    <%--  	const boardList = () => {--%>
    <%--  		location.href="/board/boardList";--%>
    <%--  	}--%>
    <%--  	const boardInsert = () => {--%>
    <%--  		document.querySelector("#f_board").submit(); // form태그에 묶인 컴포넌트 값들이 전송됨--%>
    <%--  	}--%>
    <%--	const boardDetail = (b_no) => {--%>
    <%--		location.href = "/board/boardDetail?b_no="+b_no;--%>
    <%--	}--%>
    <%--  </script>--%>
</head>

<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
    <!-- header start -->
    <%@include file="/include/KGW_bar.jsp"%>
    <!-- header end    -->

    <!-- body start    -->
    <div class="content-wrapper">
        <!-- 페이지 path start    -->
        <div class="box-header p-4" >
            <div class="d-flex align-items-center">
                <div class="d-flex align-items-center me-2">
                    <a class="text-muted fs-6" href="#">전력분석</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">FA선수현황</div>
                </div>
            </div>
            <div class="d-flex align-items-center mt-2">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0" ></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">FA선수현황</div>
                    <div class="text-muted ms-3">사원 정보를 검색할 수 있는 페이지입니다.</div>
                </div>
            </div>
        </div>
        <!-- 페이지 path end -->

        <!-- Main content -->
        <section class="content">
            <!-- Info boxes -->
            <div class="row">
                <div class="col-md-8">
                    <div class="box">
                        <div class="container">
                            <div class="box-header">
                                <h4 style="font-weight: bold; margin-left: 1.5rem" >2024년도 FA 선수 현황</h4>
                            </div>
                            <div class="chart">
                                <div id="top_x_div" style="width: 900px; height: 400px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box">
                        <div class="container">
                            <div class="box-header">
                                <h4 style="font-weight: bold; margin-left: 1.5rem">2024년도 FA선수 포지션별 현황</h4>
                            </div>
                            <div class="chart-pie">
                                <div id="piechart" style="width: 100%; height: 415px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="container">
                                    <div class="box-header">
                                        <h4 style="font-weight: bold; margin-left: 1.5rem">2024년도 FA 선수 명단</h4>
                                        <hr />
                                    </div>

                                    <!-- 검색기 시작 !! div 안에 있는 태그 건들지마시오!! -->
                                    <div class="row">
                                        <div class="col-2">
                                            <select id="gubun2" class="form-select" aria-label="분류선택">
                                                <option value="none">분류선택</option>
                                                <option value="b_title">제목</option>
                                                <option value="b_writer">작성자</option>
                                                <option value="b_content">내용</option>
                                            </select>
                                        </div>
                                        <div class="col-3">
                                            <input type="text" id="keyword2" class="form-control" placeholder="검색어를 입력하세요"
                                                   aria-label="검색어를 입력하세요." aria-describedby="btn_search" onkeyup="searchEnter()"/>
                                        </div>
                                        <div class="col-1 ">
                                            <button id="btn_search2" class="btn btn-danger" onclick="boardSearch()">검색</button>
                                        </div>
                                        <div class="col-md-6 d-flex justify-content-end ">
                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm">초기화</button>
                                        </div>
                                        <%-- 버튼 두 개 일 때 --%>
                                        <%--			<div class="col-md-6 d-flex justify-content-end gap-2">--%>
                                        <%--				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#boardForm">모달버튼</button>--%>
                                        <%--				<button id="btn_search2" class="btn btn-danger" onclick="boardSearch()">onclick버튼</button>--%>
                                        <%--			</div>--%>
                                    </div>
                                    <!-- 검색기 끝 -->

                                    <!-- 회원목록 시작 -->
                                    <div class='board-list'>
                                        <table class="table text-center align-content-center">
                                            <thead>
                                            <tr>
                                                <th width="20%" >등록날짜</th>
                                                <th width="20%">선수상태</th>
                                                <th width="15%">팀</th>
                                                <th width="15%">선수명</th>
                                                <th width="15%">포지션</th>
                                                <th width="15%">상태</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                for (int i = 0; i < size; i++) {
                                                    Map<String, Object> rmap = fList.get(i);
                                            %>
                                            <tr>
                                                <td><%=rmap.get("FA_DATE") %>
                                                </td>
                                                <td><%=rmap.get("FA_AGENT") %>
                                                </td>
                                                <td><%=rmap.get("FA_TEAM") %>
                                                </td>
                                                <td><%=rmap.get("FA_NAME") %>
                                                </td>
                                                <td><%=rmap.get("FA_POS") %>
                                                </td>
                                                <td>
                                                    <%
                                                        if (rmap.get("FA_STATE").equals("TRUE")) {
                                                    %>
                                                    <button id="btn_<%=rmap.get("FA_NO")%>" class="btn btn-danger" type="submit" onclick="faUpdate('<%=rmap.get("FA_NO")%>')">방출</button>
                                                    <%
                                                    } else {
                                                    %>
                                                    <button id="btn_<%=rmap.get("FA_NO")%>" class="btn btn-danger" type="submit" onclick="faUpdate('<%=rmap.get("FA_NO")%>')">등록</button>
                                                    <%
                                                        }
                                                    %>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- 회원목록   끝  -->
                                </div>
                                <!-- /.chart-responsive -->
                            </div>
                            <!-- /.col -->
                            <div class="col-md-4 pl-5 pr-3">
                                <div class="box-header">
                                    <h4 style="font-weight: bold; margin-left: 1.5rem">WAR 비교</h4>
                                </div>
                                <div class="chart">
                                    <div id="barchart_material" style="width: 100%; height: 400px;"></div>
                                </div>
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                        <!-- ./box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
            <!-- /.col -->
        </section>
    </div>
    <!-- content-wrapper end-->
</div>
<!-- body end   -->
</body>
</html>
