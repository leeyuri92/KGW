<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>기안 문서</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/signature_pad/1.5.3/signature_pad.min.js"></script>
    <link  rel="stylesheet " href="../css/approval.css">
</head>
<body>
<div class="wrapper">
    <%@include file="/include/KGW_bar.jsp"%>
    <div class="content-wrapper">
        <div class="box-header p-4" >
            <div class="d-flex align-items-center">
                <div class="d-flex align-items-center me-2">
                    <a class="text-muted fs-6" href="#">전자결재</a>
                    <div class="ms-2">></div>
                </div>
                <div class="d-flex align-items-center">
                    <div class="text-dark fs-6">결재함</div>
                </div>

            </div>
            <div class="d-flex align-items-center mt-2">
                <div class="position-relative">
                    <div class="position-absolute top-0 start-0" ></div>
                </div>
                <div class="d-flex align-items-center ms-2">
                    <div class="fw-bold fs-5">결재문서 </div>
                    <div class="text-muted ms-3">문서 을 결재할수 있는 페이지입니다.</div>
                </div>
            </div>
        </div>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="container">
                            <div class="box-header">
                                <h4 style="font-weight: bold; margin-left: 1.5rem">결재문서</h4>
                                <hr />
                            </div>
                            <!-- Document Sections -->
                                <div class="frame" id="frame_tool">
                                    <div class="document-section">
                                        <div class="item">
                                            <span class="title">부서:</span>
                                            <span class="value">자동불러옴</span>
                                        </div>
                                        <div class="item">
                                            <span class="title">담당자:</span>
                                            <span class="value">자동불러옴</span>
                                        </div>
                                        <div class="item">
                                            <span class="title">신청자:</span>
                                            <span class="value">자동불러옴</span>
                                        </div>
                                        <div class="item">
                                            <span class="title">휴가 사유:</span>
                                            <span class="value">[동적 사유 표시]</span> <!-- 동적 데이터 표시 예 -->
                                        </div>
                                        <div class="item">
                                            <span class="title">휴가시작일:</span>
                                            <span class="value">2024-01-12</span> <!-- 예시 날짜, 실제 데이터로 대체 가능 -->
                                        </div>
                                        <div class="item">
                                            <span class="title">휴가만료일:</span>
                                            <span class="value">2024-01-15</span> <!-- 예시 날짜, 실제 데이터로 대체 가능 -->
                                        </div>
                                        <div class="item">
                                            <span class="title">잔여휴가:</span>
                                            <span class="value">[여기에 동적으로 잔여휴가 표시]</span>
                                        </div>
                                        <div class="text-wrapper-2">상기와 같이 휴가 희망함</div>
                                    </div>
                                    <div class="signature-section">
                                        <img src="your_image_path_here" alt="Sign Image 기안자 자동생성" >
                                        <div class="sign blank" id="blank_sign_1">Sign Here 관리자</div>
                                        <div class="sign blank" id="blank_sign_2">Sign Here 구단주 </div>
                                    </div>
                                </div>
                            </div>


                            <div>
                                <div id="documentButton" class="col-md-6 d-flex justify-content-end gap-2">
                                    <button type="button" class="btn btn-danger">승인</button>
                                    <button class="btn btn-danger">반려</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
            </div>

</div>



	<div class="modal" id="boardForm">
  		<div class="modal-dialog modal-dialog-centered">
	<div class="modal-content">

	  <!-- Modal Header -->
	  <div class="modal-header">
		<h4 class="modal-title">게시판</h4>
		<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	  </div>
	  <!-- Modal body -->
	  <div class="modal-body">
		<!-- <form id="f_board" method="get" action="./boardInsert"> -->
		<form id="f_board" method="post" enctype="multipart/form-data" action="./boardInsert">
		  <input type="hidden" name="method" value="boardInsert">
		  <div class="form-floating mb-3 mt-3">
			<input type="text"  class="form-control" id="b_title" name="b_title" placeholder="Enter 제목" />
			<label for="b_title">제목</label>
		  </div>
		  <div class="form-floating mb-3 mt-3">
			<input type="text"  class="form-control" id="b_writer" name="b_writer" placeholder="Enter 작성자" />
			<label for="b_writer">작성자</label>
		  </div>
		  <div class="form-floating mb-3 mt-3">
			<textarea rows="5" class="form-control h-25" aria-label="With textarea" id="b_content" name="b_content"></textarea>
		  </div>
		  <div class="input-group mb-3">
			  <input type="file" class="form-control" id="b_file" name="b_file">
			  <label class="input-group-text" for="b_file">Upload</label>
		  </div>
		</form>
	  </div>
	  <div class="modal-footer">
		<input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="boardInsert()"  value="저장">
		<input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="닫기">
	  </div>
        </div>
        </div>
    </div>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                let blankSigns = document.querySelectorAll('.sign.blank');

                blankSigns.forEach(function(blankSign) {
                    blankSign.addEventListener('click', function() {
                        console.log(' signClicked:', this.id);
                    });
                });
            });


            // blank_sign_1 EventListener
            document.getElementById("blank_sign_1").addEventListener("click", function() {

                document.querySelector("#boardForm .modal-title").textContent = "중간결재자 사인";
                document.querySelector("#boardForm .modal-body").innerHTML = "<canvas id='signature-pad' width='400' height='200'></canvas>";

                // modal 보여주기
                let myModal = new bootstrap.Modal(document.getElementById('boardForm'), {
                    keyboard: false
                });
                myModal.show();
            });

            // blank_sign_2 EventListener
            document.getElementById("blank_sign_2").addEventListener("click", function() {
                document.querySelector("#boardForm .modal-title").textContent = "구단주 사인";
                document.querySelector("#boardForm .modal-body").innerHTML = "<canvas id='signature-pad' width='400' height='200'></canvas>";

                // modal 보여주기
                let myModal = new bootstrap.Modal(document.getElementById('boardForm'), {
                    keyboard: false
                });
                myModal.show();
            });

        </script>
<script src="../build/js/as.js"></script>

</body>
</html>
