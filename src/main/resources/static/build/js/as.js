// 원본소스 코드
// let canvas = document.getElementById('signature-pad');
// let signaturePad = new SignaturePad(canvas);

 // 차이는 ? Canvans 란 signaturePad 는 modal 창 나오기 전까지  존재하지않는다 , 이러므로  show modal function 작동되야  api 가 정상적으로 사용이 가능함
$('#boardForm').on('shown.bs.modal', function (e) {
    var canvas = document.getElementById('signature-pad');
    if (canvas) {
        var signaturePad = new SignaturePad(canvas, {
            minWidth: 1, //min
            maxWidth: 8, // max 
            penColor: "rgb(66, 133, 244)"  // 컬러 변경가능
        });

    }
});







// button save  입력한 이미지  submit 필요
// document.getElementById('save').addEventListener('click', function () {
//     var dataURL = signaturePad.toDataURL();      // 후속 처리 부분
// });



