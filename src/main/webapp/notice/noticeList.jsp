<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.util.BSPageBar" %>
<%@ page import="com.vo.NoticeBoardVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    int size=0;
    List<NoticeBoardVO> noticeList = (List)request.getAttribute("noticeList");
    if(noticeList!=null){
        size=noticeList.size();
    }
    out.print(noticeList);

    //페이지처리
    int numPerPage = 5;
    int nowPage = 0;
    if(request.getParameter("nowPage")!=null){
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
    Date date = new Date();
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
    String atrDate =simpleDate.format(date);

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
        function empSearch(){
            console.log('empSearch');
            const gubun = document.querySelector("#gubun").value;
            const keyword = document.querySelector("#keyword").value;
            console.log(`${gubun} , ${keyword}`);
            location.href="/notice/noticeList?gubun="+gubun+"&keyword="+keyword;
        }
        const noticeDetail= (notice_no) => {
            location.href= "/notice/noticeDetail?notice_no="+notice_no;
        }
        function NoticeForm () {
            location.href = '/notice/noticeForm.jsp';
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
                    <a class="text-muted fs-6" href="#">관리자페이지</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">공지사항</div>
                </div>
            </div>
            <div class="d-flex align-items-center mt-3">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0"></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">공지사항</div>
                    <div class="text-muted ms-3">공지사항 목록을 조회할 수 있는 페이지입니다.</div>
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
                                <h4 style="font-weight: bold; margin-left: 2rem">공지사항</h4>
                                <hr/>
                            </div>

                            <!-- 검색기 시작 !! div 안에 있는 태그 건들지마시오!! -->
                            <div class="row">
                                <div class="col-2">
                                    <select id="gubun" class="form-select" aria-label="분류선택">
                                        <option value="none">분류선택</option>
                                        <option value="name">제목</option>
                                        <option value="emp_no">작성자</option>
                                    </select>
                                </div>
                                <div class="col-3">
                                    <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                                           aria-label="검색어를 입력하세요." aria-describedby="btn_search" onkeyup="searchEnter()"/>
                                </div>
                                <div class="col-1">
                                    <button id="btn_search" class="btn btn-danger" onclick="empSearch()">검색</button>
                                </div>
                                <div class="col-md-6 d-flex justify-content-end gap-2">
                                    <button type="button" class="btn btn-danger" onclick="NoticeForm()">작성</button>
                                </div>
                            </div>
                            <!-- 회원목록 시작 -->
                            <div class='board-list'>
                                <table class="table table-hover text-center ">
                                    <thead>
                                    <tr>
                                        <th style="width: 10%;">#</th>
                                        <th style="width: 32%;">제목</th>
                                        <th style="width: 17%;">작성자</th>
                                        <th style="width: 17%;">작성일</th>
                                        <th style="width: 17%;">조회수</th>
                                    </tr>
                                    </thead>


                                <hr />
                                <tbody>
                                <% for (int i = nowPage * numPerPage; i < (nowPage * numPerPage) + numPerPage; i++) {
                                    if (i == size) break;
                                    NoticeBoardVO noticeVO = noticeList.get(i);
                                %>
                                <tr>
                                    <td><%=noticeVO.getNotice_no()%></td>
                                    <td><a href="javascript:noticeDetail('<%=noticeVO.getNotice_no()%>')">
                                        <%=noticeVO.getNotice_title()%></a>
                                    </td>
                                    <td><%=noticeVO.getEmp_no()%></td>
                                    <td><%=noticeVO.getReg_date()%></td>
                                    <td><%=noticeVO.getNotice_hit()%></td>
                                    <td></td>
                                </tr>
                                <%
                                }
                                %>
                                </tbody>
                                </table>
                                <hr />

                                <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                                <div style="display:flex; justify-content:center;">
                                    <ul class="pagination">
                                        <%
                                            String pagePath = "empList";
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
</div>
</body>
</html>
