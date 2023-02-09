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

/*-- POPUP common style S ======================================================================================================================== --*/

#mask {
    position: absolute;
    left: 0;
    top: 0;
    z-index: 999;
    background-color: #000000;
    display: none; }

.layerpop {
    display: none;
    z-index: 1000;
    border: 2px solid #ccc;
    background: #fff;
    cursor: move; }

.layerpop_area .title {
    padding: 10px 10px 10px 10px;
    border: 0px solid #aaaaaa;
    background: #f1f1f1;
    color: #000000;
    font-size: 1.3em;
    font-weight: bold;
    line-height: 24px; }

.layerpop_area .layerpop_close {
    width: 25px;
    height: 25px;
    display: block;
    position: absolute;
    top: 10px;
    right: 10px;
    background: transparent url('btn_exit_off.png') no-repeat; }

.layerpop_area .layerpop_close:hover {
    background: transparent url('btn_exit_on.png') no-repeat;
    cursor: pointer; }

.layerpop_area .content {
    width: 96%;    
    margin: 2%;
    color: #828282; }    
/*-- POPUP common style E --*/
</style>

<script type="text/javascript">
$(document).ready(function(){
	if($('#updateCheck').val() == "update"){
		popupOpen();
		wrapWindowByMask(); //화면 마스크 효과
		
	}
});


function wrapWindowByMask() {
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height(); 
    var maskWidth = $(window).width();

    //문서영역의 크기 
    console.log( "document 사이즈:"+ $(document).width() + "*" + $(document).height()); 
    //브라우저에서 문서가 보여지는 영역의 크기
    console.log( "window 사이즈:"+ $(window).width() + "*" + $(window).height());        

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({
        'width' : maskWidth,
        'height' : maskHeight
    });

    //애니메이션 효과
    //$('#mask').fadeIn(1000);      
    $('#mask').fadeTo("slow", 0.5);
}

function popupOpen() {
    $('.layerpop').css("position", "absolute");
    //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
    $('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
    $('.layerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
    //$('.layerpop').draggable();
    $('#layerbox').show();
}

function popupClose() {
    $('#layerbox').hide();
    $('#mask').hide();
}

function goDetail() {
    popupOpen(); //레이어 팝업창 오픈 
    wrapWindowByMask(); //화면 마스크 효과 
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
    

    <table align="center" width="100%" border="1" style="border-color:#333; border-spacing:0; border-collapse:collapse;" >
    	<tr>
    		<td width="50%" align="center" style="overflow: hidden; background-color: #333; color: #f2f2f2; padding : 5px;">제목</td>
    		<td width="50%" style="padding:5px;" align="center"><input value="${article.title}" name="title" type="text" size="90%" style="height:30px; font-size:15px;" placeholder=" 제목을 입력하세요."></td>
    	</tr>
    	<tr>
    		<td width="50%" align="center" style="overflow: hidden; background-color: #333; color: #f2f2f2; padding : 5px;">내용</td>
    		<td height="300px"style="padding:5px;" align="center"><input value="${article.content}" name="content" type="text" size="90%" style="height:300px; font-size:15px;" placeholder=" 내용을 입력하세요."></td>
    	</tr>
    	
    </table>
	<div style="padding-top:10px;text-align:right;">		
		<button type="submit" value="저장" />저장</button>
	</div>
	
	
	
		<!-- 팝업뜰때 배경 -->
<div id="mask"></div>

<!--Popup Start -->

<form method="POST" action="/Egov/docheckPw.do" >
<input type="hidden" name = "board_id" value="${article.board_id}">
<input type="hidden" id = "updateCheck" name = "updateCheck" value="${updateCheck}">
<div id="layerbox" class="layerpop" style="width: 700px; height: 350px;">
    <article class="layerpop_area">
	    <div class="title">게시물 수정</div>
	    <a href="javascript:popupClose();" class="layerpop_close" id="layerbox_close"></a><br>
	    <div class="content">
	    	 <center>비밀번호 :  <input name="pw" type="password" style="font-size:15px;" placeholder=" 비밀번호를 입력하세요."> 
	    	  <button type="submit" value="확인" />확인</button>
	    	 </center>
	    	
	    </div>
    </article>
</div>
</form>




<!--Popup End -->
				     
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



