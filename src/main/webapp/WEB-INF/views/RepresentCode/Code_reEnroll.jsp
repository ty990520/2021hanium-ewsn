<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" href="../../../resources/css/Code_Enroll.css">
<link rel="stylesheet" type="text/css"
   href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
   href="../../../resources/css/table.css" />
</head>

<div class="right-container">
   <h1>
      <b>공통코드관리 - 대표코드 등록창 </b>
   </h1>
   <hr>

   <form id="form" name=form action="register" method="post" onsubmit="return false;">
      <div class="inner">

         <div class="code_id">
            <h6>코드번호</h6>
            <input type="text" name="R_code" placeholder="코드번호 " id="R_code">
         </div>
         <div class="code_id">
            <h6>코드명</h6>
            <input type="text" name="R_codeName" placeholder="코드명 ">
         </div>
      </div>

      <div align="right">
         <button type="button" class="btn btn-danger btn-lg"
            onclick="checkExistReCode()">등록</button>
      </div>
      </form>
</div>


<script>
function checkExistReCode() {
   var code = $("#R_code").val();
   //alert(code);
   $.ajax({
      contentType : "application/json; charset=utf-8;",
      type : "GET",
      url : "/RepresentCode/checkExistRecode",
      data : {
         "R_code" : code

      },
      success : function(response) {
         if (response=="exists") {
           // alert(response);
            alert("이미 존재하는 대표코드입니다.");
            return false;
         }else if(response=="possible"){
            if (confirm("대표코드를 등록하시겠습니까?") == true) {
               alert("등록되었습니다");
               document.getElementById('form').submit();
               return true;
            } else {
               return false;
            }
         }
      },
      error : function(request, status, error) {
         alert("code:" + request.status + "\n" + "message:"
               + request.responseText + "\n" + "error:" + error);
      }
   })
}

</script>
<br><br><br><br>
<%@include file="../includes/footer.jsp"%>