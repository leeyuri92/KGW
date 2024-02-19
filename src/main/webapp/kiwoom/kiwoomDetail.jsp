<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>우리구단소식</title>
</head>
<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
    <!-- header start -->
    <%@include file="/include/KGW_bar.jsp"%>
    <link rel="stylesheet" href="/css/kiwoomNotice.css">
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
                                <div class="board_view_wrap">
                                    <div class="board_view">
                                        <div class="title">
                                            제목
                                        </div>
                                        <div class="info">
                                            <dl>
                                                <dt>번호</dt>
                                                <dd>1</dd>
                                            </dl>
                                            <dl>
                                                <dt>작성자</dt>
                                                <dd>작성자이름</dd>
                                            </dl>
                                            <dl>
                                                <dt>작성일</dt>
                                                <dd>2024-02-18</dd>
                                            </dl>
                                            <dl>
                                                <dt>수정일</dt>
                                                <dd>2024-02-18</dd>
                                            </dl>
                                            <dl>
                                                <dt>조회</dt>
                                                <dd>1</dd>
                                            </dl>
                                        </div>
                                        <div class="cont">
                                            글내용이 들어갑니다<br>
                                            글내용이 들어갑니다<br>
                                            글내용이 들어갑니다<br>
                                            글내용이 들어갑니다<br>
                                            글내용이 들어갑니다<br>
                                            글내용이 들어갑니다<br>
                                            글내용이 들어갑니다
                                        </div>
                                    </div>
                                    <div class="d-flex gap-2 justify-content-end mt-2">
                                        <button type="submit" class="btn btn-primary">목록</button>
                                        <button type="submit" class="btn btn-primary">수정</button>
                                        <button type="submit" class="btn btn-primary">삭제</button>
                                    </div>

                                    <div class="comment-section mt-4">
                                        <div id="commentList" class="mt-3">
                                            댓글내용
                                        </div>

                                        <form id="commentForm">
                                            <div class="mb-3">
                                                <label for="commentContent" class="form-label">댓글</label>
                                                <textarea class="form-control" id="commentContent" rows="3" required></textarea>
                                            </div>
                                            <div class="d-flex justify-content-end">
                                                <button type="submit" class="btn btn-primary">댓글 작성</button>
                                            </div>
                                        </form>
                                    </div>
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