<%--
  Created by IntelliJ IDEA.
  User: 13210
  Date: 2024/2/26
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,com.util.BSPageBar" %>
<%@page import="com.vo.PitchersVO" %>
<%@ page import="org.apache.ibatis.javassist.expr.NewArray" %>


<%    List<PitchersVO> list2= (List) request.getAttribute("list2");
    int size = 0;
    if (list2 != null) {
        size = list2.size();
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
        // window.onload = function() {
        //     // 행 태이블 선택
        //     let rows = document.querySelectorAll("table tr");
        //
        //     for(let  i = 1; i < rows.length; i++) {
        //         let firstCell = rows[i].cells[0];
        //         // 첫 번째 셀에 인덱스(행 번호)를 삽입합니다.
        //         firstCell.textContent = i;
        //     }
        // };
        function PlayersSearch() {
            var gubunValue = document.getElementById('gubun').value;
            var gubunPitcherValue = document.getElementById('gubunPitcher').value;

            if (gubunValue === 'pitcherTable') {
                if (gubunPitcherValue === 'pitcherTable') {
                    window.location.href = '/player/PitchersList';
                } else {
                    // 이닝수 랑 타석 처리 부분
                }
            } else if (gubunValue === 'hitterTable') {
                if (gubunPitcherValue === 'pitcherTable') {
                    window.location.href = '/player/HittersList';
                } else {
                    // 이닝수 랑 타석 처리 부분
                }
            }
        }


        let  PitcherDetail= (p_no) => {
            location.href= "/player/PitcherDetail?p_no="+p_no;
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
                <div class="text-dark fs-6">전체 선수현황</div>
            </div>
        </div>
        <div class="d-flex align-items-center mt-2">
            <div class="position-relative">
                <div class="position-absolute top-0 start-0" ></div>
            </div>
            <div class="d-flex align-items-center ms-2">
                <div class="fw-bold fs-5">전체선수현황</div>
                <div class="text-muted ms-3">선수 정보를 검색할 수 있는 페이지입니다.</div>
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
                                <option value="pitcherTable">투수</option>
                                <option value="hitterTable">타자</option>
                            </select>
                        </div>
                        <div class="col-2">
                            <select id="gubunPitcher" class="form-select" aria-label="분류선택">
                                <option value="pitcherTable">전체이닝</option>
                                <option value="pitcherTable">이닝수 50이상</option>
                            </select>
                        </div>
                        <div class="col-1 ">
                            <button id="btn_search" class="btn btn-danger" onclick="PlayersSearch()">검색</button>
                        </div>

                    </div>
                    <!-- 검색기 끝 -->


                    <div class='board-list'>
                        <%--                        table  ----pitcherList  컬럼--%>

                        <table class="table table-hover text-center " id="pitcherTable">
                            <thead>
                            <tr>
                                <th width="10%" >#</th>
                                <th width="10%" >선수명</th>
                                <th width="10%">소속</th>
                                <th width="10%">승</th>
                                <th width="10%">페</th>
                                <th width="10%">세이브</th>
                                <th width="10%">피안타율</th>
                                <th width="10%">피출루율</th>
                                <th width="10%" id="war" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WAR는 Wins Above Replacement의 약어인데요,
                특정 선수가 평범한 선수(대체선수) 대비해서 얼마나 팀의 승리에 기여하는지를 나타냅니다. ">war</th>
                                <th width="10%" id="whip" data-bs-toggle="tooltip" data-bs-placement="bottom" title="WHIP(Walks Plus Hits Divided by Innings Pitched,
                이닝당 안타 및 볼넷 허용률)는 야구에서 투수의 성적 평가 항목 중 하나로서 피안타 수와 볼넷 수의 합을 투구 이닝으로 나눈 수치이다.">whip</th>
                            </tr>
                            </thead>
                            <tbody id="tableBody">
                            <%
                                for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
                                    if(i== size) break;
                                    PitchersVO pitchersVO=list2.get(i);
                            %>
                            <tr>
                                <td><%= pitchersVO.getP_no()%></td>
                                <td>
                                    <a href="javascript:PitcherDetail('<%=pitchersVO.getP_no()%>')">
                                        <%= pitchersVO.getP_name()%>
                                    </a>
                                </td>
                                <td><%= pitchersVO.getP_team()%></td>
                                <td><%= pitchersVO.getP_win()%></td>
                                <td><%= pitchersVO.getP_lose()%></td>
                                <td><%= pitchersVO.getP_save()%></td>
                                <td><%= pitchersVO.getP_h()%></td>
                                <td><%= pitchersVO.getP_ob()%></td>
                                <td><%= pitchersVO.getP_war()%></td>
                                <td><%= pitchersVO.getP_whip()%></td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                        <hr />

                        <!-- [[ Bootstrap 페이징 처리  구간  ]] -->

                        <ul class="pagination">
                            <%
                                String pagePath="PitchersList";
                                BSPageBar bsbp=new BSPageBar(numPerPage,size,nowPage,pagePath);
                                out.print(bsbp.getPageBar());
                            %>
                        </ul>
                        <!-- [[ Bootstrap 페이징 처리  구간  end ]] -->
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


