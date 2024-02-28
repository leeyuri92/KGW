<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.NoticeBoardVO" %>

<%
    /*상세조회 */
    int size=0;
    List<NoticeBoardVO> noticeList = (List)request.getAttribute("noticeList");
    NoticeBoardVO noticeVO = noticeList.get(0);

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>우리구단소식</title>
    <script>
        function noticeList(){
            location.href='/notice/noticeList';
        }

        const  noticeDelete =() => {
            let notice_no = <%=noticeVO.getNotice_no()%>;
            location.href = "/notice/noticeDelete?notice_no="+notice_no;
            console.log("delete"+notice_no);
        }

    </script>
</head>

<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
    <!-- header start -->
    <%@include file="/include/KGW_bar.jsp"%>
    <link rel="stylesheet" href="/css/mediaNotice.css">
    <!-- header end -->
    <!-- body start -->
    <div class="content-wrapper">
        <!-- 페이지 path start -->
        <div class="box-header p-4">
            <div class="d-flex align-items-center">
                <div class="d-flex align-items-center me-2">
                    <a class="text-muted fs-6" href="#">우리구단</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">우리구단 소식</div>
                </div>
            </div>
            <div class="d-flex align-items-center mt-3">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0"></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">우리구단 소식 상세보기</div>
                    <div class="text-muted ms-3">우리구단 소식을 상세하게 조회할 수 있는 페이지입니다.</div>
                </div>
            </div>
        </div>
        <!-- 페이지 path end -->
        <section class="content">
            <!-- Info boxes -->
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="container">
                            <div class="box-header">
                                <h4 style="font-weight: bold; margin-left: 2rem" >상세보기</h4>
                                <hr />
                                <div class="board_view">
                                    <div class="title">
                                        <dd><%=noticeVO.getNotice_title()%></dd>
                                    </div>
                                    <div class="info">
                                        <dl>
                                            <dt>번호</dt>
                                            <dd><%=noticeVO.getNotice_no()%>
                                        </dl>
                                        <dl>
                                            <dt>작성자</dt>
                                            <dd><%=noticeVO.getEmp_no()%></dd>
                                        </dl>
                                        <dl>
                                            <dt>작성일</dt>
                                            <dd><%=noticeVO.getReg_date()%></dd>
                                        </dl>
                                        <dl>
                                            <dt>수정일</dt>
                                            <dd><%=noticeVO.getMod_date()%></dd>
                                        </dl>
                                        <dl>
                                            <dt>조회</dt>
                                            <dd><%=noticeVO.getNotice_hit()%></dd>
                                        </dl>
                                    </div>
                                    <div class="cont">
                                        <%=noticeVO.getNotice_content()%>
                                    </div>
                                </div>

                                <div class="d-flex gap-2 justify-content-end mt-2">
                                    <button type="submit" class="btn btn-primary" onclick="noticeList()">목록</button>
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#noticeMod">수정</button>
                                    <button type="submit" class="btn btn-primary" onclick="noticeDelete()">삭제</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

수정 모달창
<div class="modal" id="noticeMod">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h4 style="font-weight: bold; margin-left: 2rem" >게시글 수정</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <hr />
            </div>
            <div class="modal-body p-5 pt-0">
                <%@include file="/common/summernote.jsp"%>
                <form id="Modify" method="post" action="/notice/noticeModify">
                    <div>
                        <input type="hidden" class="form-control mb-3" id="notice_no" name="notice_no" value="<%=noticeVO.getNotice_no()%>">
                        <input type="hidden" class="form-control mb-3" id="mod_date" name="mod_date" value="<%=noticeVO.getMod_date()%>">
                    </div>
                    <div>
                        <input type="text" class="form-control mb-3" id="notice_title" name="notice_title" placeholder="제목을 입력해주세요." value="<%=noticeVO.getNotice_title()%>">
                    </div>
                    <textarea id="summernote" name="notice_content"><%=noticeVO.getNotice_content()%></textarea>
                    <div class="d-flex justify-content-end mt-3">
                        <button type="button" class="btn btn-primary" onclick="noticeModify()">수정</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $('#summernote').summernote({
        placeholder: '글 내용을 입력해주세요.',
        tabsize: 2,
        height: 500,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ]
    });

    const noticeModify =()=> {
        console.log("수정버튼클릭")
        document.querySelector("#Modify").submit();
    }
</script>
</body>
</html>