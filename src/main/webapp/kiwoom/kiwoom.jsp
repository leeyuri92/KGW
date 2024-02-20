<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>우리구단소식</title>
</head>
<script>
    function kiwoomNoticeList(){
        location.href="/kiwoom/kiwoomNotice";
    }
</script>
<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
    <!-- header start -->
    <%@include file="/include/KGW_bar.jsp"%>
    <!-- header end    -->
    <!-- body start    -->
    <div class="content-wrapper">
        <!-- 페이지 path start    -->
        <%--		<div class="card" >--%>
        <div class="box-header p-4" >
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
                    <div class="position-absolute top-0 start-0" ></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">게시글 작성</div>
                    <div class="text-muted ms-3">우리구단 소식을 작성할 수 있는 페이지입니다.</div>
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
                                <h4 style="font-weight: bold; margin-left: 2rem" >게시글 작성</h4>
                                <hr />
                                <div class="container">
                                    <%@include file="/common/summernote.jsp"%>
                                    <div>
                                        <input type="text" name="subject" class="form-control mb-3"  placeholder="제목을 입력해주세요." id="subject">
                                    </div>
                                    <div id="summernote"></div>
                                    <div class="d-flex gap-2 justify-content-end mt-3">
                                        <button type="submit" class="btn btn-primary" id="submit">작성</button>
                                        <button type="submit" class="btn btn-primary" onclick="kiwoomNoticeList()">이전</button>
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

                                    const btn_submit = document.querySelector('#submit');
                                    btn_submit.addEventListener("click", () => {
                                        const id_subject = document.querySelector('#subject');
                                        if (id_subject.value == '') {
                                            alert('제목을 입력하세요.');
                                            id_subject.focus();
                                            return false;
                                        }

                                        const markupStr = $('#summernote').summernote('code');
                                        if (markupStr === '<p><br></p>') {
                                            alert('내용을 입력하세요.');
                                            //summernote 에디터에 포커스 추가
                                            $('#summernote').summernote('focus');
                                            return false
                                        }
                                        //  const insert =new FormData()
                                        //
                                        // insert.append('subject',id_subject.value)
                                        // insert.append('content',markupStr)
                                        //
                                        // const xhr =new XMLHttpRequest()
                                        // xhr.open("POST",)
                                    });
                                </script>
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
