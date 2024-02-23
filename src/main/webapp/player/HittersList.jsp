<%--
  Created by IntelliJ IDEA.
  User: kjh
  Date: 2024/2/19
  Time: 14:03
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.*,com.util.BSPageBar" %>

<%@ page import="com.vo.HittersVO" %>

<%
    List<Map<String, Object>> list = (List) request.getAttribute("list");
    int size = 0;
    if (list != null) {
        size = list.size();
    }

    int numPerPage = 10;
    int nowPage = 0;
    if(request.getParameter("nowPage")!=null){
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<%--%>
<%--    List<Map<String, Object>> hitterList = (List<Map<String, Object>>)request.getAttribute("hitterList");--%>
<%--    if (hitterList!=null){--%>
<%--        out.print("hitterList 출력성공");--%>
<%--    }--%>
<%--    else {--%>
<%--      out.print("null 타자출력실패");--%>
<%--    }--%>
<%--%>--%>



<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>전략분석패이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        // when onclick action to search different table
        $(document).ready(function() {
            // 티폴트 는 타자 로 선택
            $('#hitterTable').show();
            $('#pitcherTable').hide();
            $('#gubunHitters').show();
            $('#gubunPitcher').hide()

        });
        function PlayersSearch() {
            var selectList = $('#gubun').val();

            if (selectList === 'hitterTable') {
                $('#hitterTable').show();
                $('#pitcherTable').hide();
                $('#gubunHitters').show();
                $('#gubunPitcher').hide()
            } else if (selectList === 'pitcherTable') {
                $('#pitcherTable').show();
                $('#hitterTable').hide();
                $('#gubunPitcher').show()
                $('#gubunHitters').hide();
            }
        }


    </script>

</head>

<body>
<%@include file="/include/KGW_bar.jsp"%>
<!-- body start    -->
<div class="content-wrapper">
    <!-- 페이지 path start    -->
    <%--		<div class="card" >--%>
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
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="container">
                    <div class="box-header">
                        <h4 style="font-weight: bold; margin-left: 1.5rem" >전략분석 차트</h4>
                        <hr />
                    </div>

                    <!-- 검색기 시작 !! div 안에 있는 태그 건들지마시오!! -->
                    <div class="row">
                        <div class="col-2">
                            <select id="gubun" class="form-select" aria-label="분류선택">
                                <option value="hitterTable">타자</option>
                                <option value="pitcherTable">투수</option>
                            </select>
                        </div>
                        <div class="col-2">
                            <select id="gubunPitcher" class="form-select" aria-label="분류선택">
                                <option value="pitcherTable">전체이닝</option>
                                <option value="pitcherTable">이닝수 50이상</option>
                            </select>
                        </div>
                        <div class="col-2">
                            <select id="gubunHitters" class="form-select" aria-label="분류선택">
                                <option value="hitterTable">전체타석</option>
                                <option value="hitterTable">100타석이상</option>
                            </select>
                        </div>
                        <div class="col-1 ">
                            <button id="btn_search" class="btn btn-danger" onclick="PlayersSearch()">검색</button>
                        </div>

                    </div>
                    <!-- 검색기 끝 -->


                    <div class='board-list'>
                        <!-- 타자 컬럼 -->
                        <table class="table table-hover text-center" id="hitterTable">
                            <thead>
                            <tr>
                                <th width="10%">#</th>
                                <th width="10%">선수명</th> <!-- 球员名 -->
                                <th width="10%">소속</th> <!-- 球队 -->
                                <th width="10%">타율</th> <!-- 打击率 -->
                                <th width="10%">타수</th> <!-- 打数 -->
                                <th width="10%">안타</th> <!-- 安打 -->
                                <th width="10%">홈런</th> <!-- 全垒打 -->
                                <th width="10%">득점</th> <!-- 得分 -->
                                <th width="10%">출루율</th> <!-- 上垒率 -->
                                <th width="10%">war</th>
                                <th width="10%">ops</th>
                            </tr>
                            </thead>
                            <tbody><%
                            for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
                            if(i == size) break;
                                HittersVO hittersVO  = (HittersVO) list.get(i);
                            %>
                            <tr>
                                <td>여기는 no index</td>
                                <td><%= hittersVO.getH_name()%></td>
                                <td><%= hittersVO.getH_team()%></td>
                                <td><%= hittersVO.getH_avg()%></td>
                                <td><%= hittersVO.getH_ab()%></td>
                                <td><%= hittersVO.getH_h()%></td>
                                <td><%= hittersVO.getH_hr()%></td>
                                <td><%= hittersVO.getH_r()%></td>
                                <td><%= hittersVO.getH_obp()%></td>
                                <td><%= hittersVO.getH_war()%></td>
                                <td><%= hittersVO.getH_ops()%></td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>

                    <%--                        table  ----pitcherList  컬럼--%>

                        <table class="table table-hover text-center " id="pitcherTable">
                            <thead>
                            <tr>
                                <th width="10%" >선수명</th>
                                <th width="10%">소속</th>
                                <th width="10%">승</th>
                                <th width="10%">페</th>
                                <th width="10%">세이브</th>
                                <th width="10%">피홈련</th>
                                <th width="10%">피안타</th>
                                <th width="10%">피출루</th>
                                <th width="10%">war</th>
                                <th width="10%">ops</th>
                            </tr>
                            </thead>
                            <tbody>
<%--                                pitchers--%>
                            </tbody>
                        </table>
                        <hr />
<%--paging errro--%>
                        <!-- [[ Bootstrap 페이징 처리  구간  ]] -->

                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                        <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
