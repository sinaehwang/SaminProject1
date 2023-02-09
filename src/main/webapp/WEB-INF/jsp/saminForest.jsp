<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="searchbg vertical-align-content">
	    <div>구분</div>  
		<div style="padding-left:10px;">
			<select style="width:100px;height:22px;" name="search">
		    	<option value="">선택</option>
		    	<option value="title" selected="selected">제목</option>
		    	<option value="content ">내용</option>
			</select>			
		</div>
		<div style="padding-left:10px;">
			<input name="searchWrd" type="text" size="70" >
		</div>			
		<div style="padding-left:10px;">		
			 <input type="button" value="조회" />
		</div>			 
    </div>	      
	<br>
    <table align="center" width="100%" border="1" style="border-color:#333; border-spacing:0; border-collapse:collapse;">
    	<tr style="overflow: hidden; background-color: #333; color: #f2f2f2; padding : 10px;">
    		<th width="8%" align="center" style="padding : 5px;">번호</th>
    		<th width="70%">제목</th>
    		<th width="14%">등록일</th>
    		<th width="8%" align="center">조회수</th>
    	</tr>
    	<tr>
    		<td align="center" style="padding:8px;">3</td>
    		<td style="padding-left : 10px;">제목3</td>
    		<td align="center">2023.01.25</td>
    		<td align="center">10</td>
    	</tr>
    	<tr>
    		<td align="center" style="padding:8px;">2</td>
    		<td style="padding-left : 10px;">제목2</td>
    		<td align="center">2023.01.25</td>
    		<td align="center">20</td>
    	</tr>
    	<tr>
    		<td align="center" style="padding:8px;">1</td>
    		<td style="padding-left : 10px;">제목1</td>
    		<td align="center">2023.01.25</td>
    		<td align="center">30</td>
    	</tr>    	
    </table>
    <div style="padding-top:3px;">총<b>3</b>건</div>
    <br>
    <center>
    		1 2 3 5 6 7 8 9 10
    </center>
    <br>
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