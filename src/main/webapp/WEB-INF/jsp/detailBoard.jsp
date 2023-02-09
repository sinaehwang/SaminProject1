<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
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

 a {
     color:inherit; 
     text-decoration:none;    
  }

</style>
</head>
<body>



<div class="header">
  <h1>SAMINHNT</h1>
  <p>
  	같이의 가치를 더하다.
  </p>
</div> 
<div class="topnav">
  <a href="${pageContext.request.contextPath}/main.do">삼인의 숲</a>
</div>
<div class="row">
  <div class="column side">
    <h2></h2>
    <p></p>
  </div>
  <div class="column middle">
  	<br>
    <img width="150px" src="<c:url value='./images/saminforest.png' />">
    <hr style="background:#96afcc; height:2px; border:0;">      	
  	<br>
	<div style="overflow: auto; padding-left:10px;" >
		<img style="float:left;" width="50px" height="50px" src="<c:url value='./images/anonymous01.png' />">
	    <span style="overflow: auto; padding-left:5px;"><b>${article.writer}</b></span><br>
	    <c:set var="TextValue" value="${article.regdate}"></c:set>
	    <span style="overflow: auto; padding-left:5px;">${fn:substring(TextValue,0,16)}</span><br>
	    <br> 
	</div>        
	<div style="padding-left:15px;">
		${article.content}
	</div>
	<br>
	<div style="padding-top:10px;text-align:right;padding-right:10px;">		
		<button type="submit" onclick="location.href='/Egov/modify.do?id=${article.board_id}&updateCheck=update'">수정</button> | <button><a  onclick="if ( !confirm('정말 삭제하시겠습니까?') ) return false;" href="/Egov/delete.do?id=${article.board_id}" class="plain-link">삭제</a></button>
	</div>			     	
  </div>
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