<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/bootstrap_common.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/adminlte.css">
<link rel="stylesheet" href="/css/common.css">
<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/" class="nav-link">Home</a>
            </li>
        </ul>
        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <div class="user-panel d-flex" >

                    <div class="info">
                        <a href="/mypage?emp_no=<%=1004%>"><img src="/images/<%="go.png"%>" class="img-circle" alt="User Image">  이유리</a>
                    </div>
                </div>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="/" class="brand-link">
            <img src="/images/K1.png" alt=" Logo" class="brand-image mt-2 ml-2" style="opacity: .8">
            <span class="brand-text font-weight-light font-weight-bold" style="font-size: 30px">KIWOOM</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon bi bi-bell-fill"></i>
                            <p>
                                공지사항
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="../board/boardList2.jsp" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>게시판 예시</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../board/boardList2.jsp" class="nav-link">
                                    <i class="bi bi-record-fill nav-icon"></i>
                                    <p>Dashboard v1</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../../index2.html" class="nav-link">
                                    <i class="bi bi-stop-fill nav-icon"></i>
                                    <p>Dashboard v2</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../../index3.html" class="nav-link">
                                    <i class="bi bi-stop nav-icon"></i>
                                    <p>Dashboard v3</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/empInfo" class="nav-link">
                            <i class="nav-icon bi bi-person-heart"></i>
                            <p>
                                인사정보
                                <span class="right badge badge-danger">New</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
<%--                            <i class="nav-icon fas fa-copy"></i>--%>
                            <i class="nav-icon bi bi-emoji-smile-fill"></i>
                            <p>
                                우리구단
                                <i class="fas fa-angle-left right"></i>
                                <span class="badge badge-info right">6</span>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/kiwoom/kiwoomNotice" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>우리구단소식</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/kiwoom/kiwoomSearch.jsp" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>우리구단선수조회</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/kiwoom/kiwoomChart.jsp" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>선수현황차트</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="../calendar/calendarList" class="nav-link">
                            <i class="nav-icon bi bi-calendar-heart"></i>
                            <p>
                                일정
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                    <li class="nav-item">
                        <a href="../reservation/reservationList" class="nav-link">
                            <i class="nav-icon bi bi-list-stars"></i>
                            <p>
                                예약
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon bi bi-pencil-square"></i>
                            <p>
                                전자결제
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="../forms/general.html" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>General Elements</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../forms/advanced.html" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>Advanced Elements</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../forms/editors.html" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>Editors</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../forms/validation.html" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>Validation</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon bi bi-clipboard-data"></i>
                            <p>
                                전력분석
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="../tables/simple.html" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>Simple Tables</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../tables/data.html" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>DataTables</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/kList" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>FA선수현황</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-header">EXAMPLES</li>
                    <li class="nav-item">
                        <a href="../calendar.html" class="nav-link">
                            <i class="nav-icon bi bi-heart-fill"></i>
                            <p>
                                관리자메뉴
                                <span class="badge badge-info right">2</span>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/empList" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>사원관리</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/regist.jsp" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>사원추가</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/strategy/empChart.jsp" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>입/퇴사자 현황</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/adminAttendance.jsp" class="nav-link">
                                    <i class="bi bi-record nav-icon"></i>
                                    <p>근태관리</p>
                                </a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>
