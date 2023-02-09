<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- sweet alert플러그인 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- sweet alert플러그인 추가 -->

<meta charset="UTF-8">
<title>삼인의 숲</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}
body {
  margin: 0;
}
/* Style the header */
.header {
    background-color: #f1f1f1;
    padding: 20px;
    text-align: center;
}
/* Style the top navigation bar */
.topnav {
    overflow: hidden;
    background-color: #333;
}
/* Style the topnav links */
.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
/* Change color on hover */
.topnav a:hover {
    background-color: #ddd;
    color: black;
}
/* Create three unequal columns that floats next to each other */
.column {
    float: left;
    padding: 10px;
}
/* Left and right column */
.column.side {
    width: 25%;
}
/* Middle column */
.column.middle {
    width: 50%;
}
.searchbg {
	background-position: center;
	background-repeat: no-repeat;
    width:1000px;
    height:50px;
    /*align:center;*/
    background-image:url('./images/search_bg.png');
}
/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}
/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
    .column.side, .column.middle {
        width: 100%;
    }
}
/* Style the footer */
.footer {
    background-color: #f1f1f1;
    padding: 15px;
    text-align: center;
}
/*
.footer .inner {
  padding: 40px 0 60px 0;
}
*/
.footer .info {
  text-align: center;
}
.footer .info span {
  color: #999;
  font-size: 12px;
}
.footer .copyright {
  color: #999;
  font-size: 12px;
  text-align: center;
  margin-top: 12px;
}
.content{
    position: relative;
}
.content span{
	font-size: 100px;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
}
.vertical-align-content {
  display:flex;
  align-items:center;
  text-align:center;
  margin: auto;
  justify-content : center;
  /* Uncomment next line to get horizontal align also */
  /* justify-content:center; */
}
.content {
	height: 5000px;
}
.popup {
	position: fixed; /*팝업 전체를 콘텐츠보다 위로 띄움*/
    /*dimmed 영역이 콘텐츠가 길어질때 같이 길어지게 하기 위해 relative대신 fixed 사용. fixed는 뷰포트, 즉 현재 보이는 브라우저 화면 사이즈를 기준으로 하기 때문에 스크롤을 내려도 딤드 레이어가 노출됨*/
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
}
.popup_layer {
	position: absolute; /*위치 옮기기 위해 relative에서 변경*/
    /*전체 뷰포트의 중앙으로 오도록*/
    top: 50%;
    left: 50%;
	width: 400px;
	height: 150px;
	padding-bottom: 50px;
    margin: -100px 0 0 -150px; /*음수 margin으로 정중앙으로 당겨줌*/
	background: #fff;
	z-index: 10;
}
.text_area {
	padding: 50px 30px 30px;
	text-align: center
}
.btn_area {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	height: 50px;
	overflow: hidden; /*float 해제*/
}
.btn {
	float: left;
	width: 50%;
	height: 100%;
	font-size: 15px;
	font-weight: bold;
	border: 0;
	background: pink;
    /*button태그의 기본 속성 : box-sizing:border-box;
    따라서 기본적으로 width값 안에 border영역까지 포함됨*/
}
.btn.no {
	background: lightblue;
}
.popup_dimmed {
	position: absolute; /*띄워줌*/
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: #000;
	opacity: 0.3;
}
</style>

<script type="text/javascript">
let ArticleModifySubmitDone = false;
function ArticleModify__checkAndSubmit(form) {
	
	if(ArticleModifySubmitDone){
		
		alert('처리중입니다.');
		return;
	}
	
	form.title.value = form.title.value.trim();
	
	if(form.title.value.length ==0) {
		
		alert('제목을 입력해주세요');
		
		form.title.focus();
		
		return false;
	}
	
	form.content.value=form.content.value.trim();
	
	if(form.content.value.length ==0) {
		
		alert('내용을 입력해주세요');
		
		form.content.focus();
		
		return false;
		
	}
 
	ArticleModifySubmitDone = true;
	
	form.submit();
	
}
</script>


</head>
<body>


<div class="header">
  <h1>SAMINHNT</h1>
  <p>
  	같이의 가치를 더하다.
  </p>
</div> 
<div class="topnav">
  <a href="${pageContext.request.contextPath}/saminForest.do">삼인의 숲</a>
</div>
<div class="row">
  <div class="column side">
    <h2></h2>
    <p></p>
  </div>
  <div class="column middle">
  	<br>
    <center><img width="150px" src="<c:url value='./images/saminforest.png' />" ></center>
    <br>
    
    <form onsubmit="ArticleModify__checkAndSubmit(this); return false;" method="POST" action="../Egov/doModify.do" >
    <input type="hidden" name = "board_id" value="${article.board_id}">
    <input type="hidden" name = "password" value="${article.password}"> 
    <table align="center" width="100%" border="1" style="border-color:#333; border-spacing:0; border-collapse:collapse;" >
    	<tr>
    		<td width="50%" align="center" style="overflow: hidden; background-color: #333; color: #f2f2f2; padding : 5px;">제목</td>
    		<td width="50%" style="padding:5px;" align="center"><input value="${article.title}" name="title" type="text" size="90%" style="height:30px; font-size:15px;" placeholder=" 제목을 입력하세요."></td>
    	</tr>
    	<tr>
    		<td width="50%" align="center" style="overflow: hidden; background-color: #333; color: #f2f2f2; padding : 5px;">내용</td>
    		<td height="300px"style="padding:5px;" align="center">
    		<textarea name="content" rows="20" cols="92" placeholder=" 내용을 입력하세요." style="font-size:15px;">${article.content}</textarea>
    		</td>
    	</tr>
    	
    </table>
	<div style="padding-top:10px;text-align:right;">		
		<button type="submit" value="저장" />저장</button>
	</div>
	</form>

	
				     
  </div>
  <br>
  <div class="column side">
	    <h2></h2>
	    <p></p>
  </div>
</div>
<div class="footer">
  <div class="inner">
      <div class="info">
        <span>주식회사 삼인에이치엔티</span>
        <span>대표자 (성명) : 김승한</span>
        <span>이메일 :  sales@saminhnt.com</span>
        <span>대표번호 : 042-719-7780</span>
        <span>팩스 번호 : 042-719-7790</span>        
        <span>사업자 등록 번호 : [ 646 - 87 - 00199 ]</span>        
      </div>
      <p class="copyright">
      	Copyright © by SAMINHNT All Right Reserved.
      </p>
    </div>    
</div>
</body>
</html>