<%--
  이름 : 이유리
  날짜 : 2024-02-18
  내용 : empChart
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>입/퇴사자 차트</title>
</head>
<body>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>게시판 예시</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['bar']}); //구글 지원하는 막대그래프 로딩
        google.charts.setOnLoadCallback(drawChart); //막대그래프 그리려면 데이터가 필요함 - 함수호출

        function drawChart() {//DataTable()
            var data = google.visualization.arrayToDataTable([
                ['Year', 'Sales', 'Expenses', 'Profit'],
                ['2014', 1000, 400, 200],
                ['2015', 1170, 460, 250],
                ['2016', 660, 1120, 300],
                ['2017', 1030, 540, 350]
            ]);

            var options = {
                chart: {
                    title: 'Company Performance',
                    subtitle: 'Sales, Expenses, and Profit: 2014-2017',
                },
            };

            var chart = new google.charts.Bar(document.getElementById('barchart_material'));
            var chart2 = new google.charts.Bar(document.getElementById('barchart_material2'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
            chart2.draw(data, google.charts.Bar.convertOptions(options));
        }
    </script>

    <style>
        .content-box {
            width: 100%;
            padding: 16px;
            border-radius: 6px;
            overflow: hidden;
            border: 1px solid #989898;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            gap: 4px;
        }
        .chart-box {
            width: 100%;
            padding: 16px;
            border-radius: 6px;
            overflow: hidden;
            border: 1px solid #989898;
            align-self: stretch;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .chart {
            width: 100%;
            height: 100%;
            position: relative;
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-start;
            display: flex;
        }

        .subtitle {
            color: rgba(0, 0, 0, 0.50);
            font-size: 14px;
            font-family: Roboto;
            font-weight: 400;
            line-height: 24px;
            word-wrap: break-word;
        }
        .count {
            width: 100px;
            height: 40px;
            color: black;
            font-size: 20px;
            font-family: Roboto;
            font-weight: 500;
            line-height: 36px;
            word-wrap: break-word;
        }
    </style>
</head>

<body>
<div class="wrapper" >
    <!-- header start -->
    <%@include file="/include/KGW_bar.jsp"%>
    <!-- header end    -->

    <!-- body start    -->
    <div class="content-wrapper">
        <!-- 페이지 path start    -->
        <div class="box-header p-4" >
            <div class="d-flex align-items-center">
                <div class="d-flex align-items-center me-2">
                    <a class="text-muted fs-6" href="#">관리자</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">입/퇴사자 현황</div>
                </div>
            </div>
            <div class="d-flex align-items-center mt-3">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0" ></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">입/퇴사자 현황</div>
                    <div class="text-muted ms-3">차트</div>
                </div>
            </div>
        </div>
        <!-- 페이지 path end -->

        <!-- Main content -->
        <section class="content">
            <!-- Info boxes -->
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="row">

                            <div class="col-md-6">
                                <div class="container">
                                    <div class="box-header">
                                        <h4 style="font-weight: bold; margin-left: 2rem">입사자</h4>
                                        <hr />
                                        <div class="content-box mt-3">
                                            <div class="subtitle">2024년 입사자</div>
                                            <div class="count">10 명</div>
                                        </div>
                                        <div class="chart-box mt-3">
                                            <div class="chart">
                                                <div id="barchart_material" style="width: 100%; height: 420px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="container">
                                    <div class="box-header">
                                        <h4 style="font-weight: bold; margin-left: 2rem">퇴사자</h4>
                                        <hr />
                                        <div class="content-box mt-3">
                                            <div class="subtitle">2024년 퇴사자</div>
                                            <div class="count">5 명</div>
                                        </div>
                                        <div class="chart-box mt-3">
                                            <div class="chart ">
                                                <div id="barchart_material2" style="width: 100%; height: 420px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- ./box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
    </div>
    <!-- content-wrapper end-->
</div>
<!-- body end   -->
</body>
</html>

