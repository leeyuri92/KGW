<%--
  Created by IntelliJ IDEA.
  User: kjh
  Date: 2024/2/19
  Time: 14:03
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,com.util.BSPageBar" %>

<%@ page import="com.vo.HittersVO" %>

<%
    List<HittersVO> list = (List) request.getAttribute("list");
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


<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>전략분석패이지</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

    <script type="text/javascript">



        window.onload = function() {
            // 행 태이블 선택
            let rows = document.querySelectorAll("table tr");

            for(let  i = 1; i < rows.length; i++) {
                let firstCell = rows[i].cells[0];
                // 첫 번째 셀에 인덱스(행 번호)를 삽입합니다.
                firstCell.textContent = i;
            }
        };






        function PlayersSearch() {
            var gubunValue = document.getElementById('gubun').value;// select1 value option
            var gubunHittersValue = document.getElementById('gubunHitters').value; // select2 value option

            if (gubunValue === 'hitterTable') {
                if (gubunHittersValue === 'hitterTable') {
                    window.location.href = '/player/HittersList';
                } else {
                }
            } else if (gubunValue === 'pitcherTable') {
                if (gubunHittersValue === 'hitterTable') {
                    window.location.href = '/player/PitchersList';
                } else {
                    // 이닝수 랑 타석 처리 부분
                }
            }
        }



        let  HitterDetail= (h_no) => {
            location.href= "/player/HitterDetail?h_no="+h_no;
        }

    </script>

</head>

<body class="hold-transition sidebar-mini sidebar-collapse">
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
                                <th width="10%">선수명</th>
                                <th width="10%">소속</th>
                                <th width="10%">타율</th>
                                <th width="10%">타수</th>
                                <th width="10%">안타</th>
                                <th width="10%">홈런</th>
                                <th width="10%">득점</th>
                                <th width="10%">출루율</th>
                                <th width="10%" id="war" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WAR는 Wins Above Replacement의 약어인데요,
                특정 선수가 평범한 선수(대체선수) 대비해서 얼마나 팀의 승리에 기여하는지를 나타냅니다. ">war</th>
                                <th width="10%" id="ops" data-bs-toggle="tooltip" data-bs-placement="top" title="OPS(오피에스)는 On base Plus Slugging의 약자이며 말 그대로 출루율과 장타율의 합이다.">ops</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for(int i = nowPage*numPerPage; i < (nowPage*numPerPage)+numPerPage; i++) {
                                    if (i == size) break;
                                HittersVO hittersVO  = (HittersVO) list.get(i);
                            %>
                            <tr>
                                <td><%= hittersVO.getH_no()%></td>
                                <td>
                                    <a href="javascript:HitterDetail('<%=hittersVO.getH_no()%>')">
                                        <%= hittersVO.getH_name()%>
                                    </a>
                                </td>
                                <td><%= hittersVO.getH_team()%></td>
                                <td><%= hittersVO.getH_avg()%></td>
                                <td ><%= hittersVO.getH_ab()%></td>
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


                        <hr />
                        <!-- [[ Bootstrap 페이징 처리  구간  ]] -->

                        <ul class="pagination">
                           <%
                            String pagePath="HittersList";
                            BSPageBar bsbp=new BSPageBar(numPerPage,size,nowPage,pagePath);
                            out.print(bsbp.getPageBar());
                           %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>  <%-- toolTips function 사용--%>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    tooltipTriggerList.forEach(function (tooltipTriggerEl) {
        new bootstrap.Tooltip(tooltipTriggerEl);
    });
    </script>
</body>
</html>