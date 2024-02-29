<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.util.BSPageBar" %>

<%
    List<Map<String, Object>> kList = (List) request.getAttribute("kList");
    Map<String,Object> kmap = kList.get(0);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>우리구단 선수상세조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">

        const kiwoomList= ()=>{
            location.href= "/kiwoom/kiwoomList";
        }


    </script>
</head>
<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
    <!-- header start -->
    <%@include file="/include/KGW_bar.jsp"%>
    <!-- header end    -->

    <!-- body start    -->
    <div class="content-wrapper">
        <!-- 페이지 path start    -->
        <%-- <div class="card" >--%>
        <div class="box-header p-4">
            <div class="d-flex align-items-center">
                <div class="d-flex align-items-center me-2">
                    <a class="text-muted fs-6" href="#">우리구단</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">우리구단 선수조회</div>
                </div>
                    <div class="ms-2"> ></div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">우리구단 선수상세조회</div>
                </div>
            </div>
            <div class="d-flex align-items-center mt-3">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0"></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">우리구단 선수상세조회</div>
                    <div class="text-muted ms-3">우리구단 선수를 선수상세조회 할 수 있는 페이지입니다.</div>
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
                        <div class="container">

                            <div class="row mb-3">
                                <div class="col-md-12 mt-5">
                                        <div class="card mb-3 p-5" style="display:flex; justify-content:center; height: 300px; width: 100%;">
                                            <div class="row g-0">

                                                <div class="col-md-4">
                                                    <div class="card-body">
                                                        <p class="card-text fs-5" >  NO  : <%= kmap.get("K_NUM") %></p>
                                                        <p class="card-text fs-1">  <%= kmap.get("K_NAME") %></p>
                                                        <hr style="width: 600px;">
                                                        <p class="card-text fs-5"> 생년월일  : <%= kmap.get("K_BIRTH") %></p>
                                                        <p class="card-text fs-5"> 신장/체중 : <%= kmap.get("K_PHY") %></p>
                                                        <p class="card-text fs-5"> 연봉  : <%= kmap.get("K_SAL") %></p>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 d-flex align-items-end" >
                                                    <div class="card-body ">
                                                        <p class="card-text fs-5"> 포지션  : <%= kmap.get("K_POS") %></p>
                                                        <p class="card-text fs-5"> 데뷔년도  : <%= kmap.get("K_HIRE") %></p>
                                                        <p class="card-text fs-5"> 연자 : <%= kmap.get("K_YEAR") %></p>
                                                    </div>
                                                </div>

                                                <div class="col-md-4 d-flex align-items-end"  style="display:flex; justify-content:center;">
                                                    <img src="/images/profile.jpg" class="img-fluid rounded-start" alt="profile" style="height: 230px">
                                                </div>

                                            </div>
                                        </div>


                                </div>
                                    <div class="col-md-12 d-flex gap-2 justify-content-end mt-3 p-3" >
                                    <button id="btn_allDown" type="button" class="btn btn-danger"  onclick="kiwoomList()">목록</button>
                                    </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</div>
</div>
</body>
</html>