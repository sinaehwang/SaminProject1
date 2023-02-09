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


<script type="text/javascript">

const submitWriteFormDone = false;

let validPw="";

<!-- 비밀번호 일치 체크 -->
function check_pw(){
	  
	  var pw = document.getElementById('pw').value;
	  var SC = ["!","@","#","$","%"];
	  var check_SC = 0;
	  if(pw.length < 4 || pw.length>8){
	      window.alert('비밀번호는 4글자 이상, 8글자 이하만 이용 가능합니다.');
	      document.getElementById('pw').value='';
	  }
	  for(var i=0;i<SC.length;i++){
	      if(pw.indexOf(SC[i]) != -1){
	          check_SC = 1;
	      }
	  }
	  
	  if(check_SC == 0){
	      window.alert('!,@,#,$,% 의 특수문자를 반드시 포함해야합니다.')
	      document.getElementById('pw').value='';
	      
	  }
	  if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
	      if(document.getElementById('pw').value!=document.getElementById('pw2').value){
	         window.alert('비밀번호가 일치하지 않습니다.');
	         return false;
	        
	         
	      }
	  }
	}

<!-- 비밀번호 일치 체크 -->


function submitWriteForm(form) {
	
	if(submitWriteFormDone){
		
		alert('처리중입니다.');
		return;
	}
	
	form.title.value = form.title.value.trim();
	
	if(form.title.value ==0) {
		alert('제목을 입력해주세요');
		return;
	}
	
	form.content.value= form.content.value.trim();
	
	if(form.content.value ==0) {
		alert('내용을 입력해주세요');
		return;
	}
	
	form.password.value= form.password.value.trim();
	
	if(form.password.value ==0) {
		alert('비밀번호을 입력해주세요');
		return;
	}
	
	form.pwConfirm.value= form.pwConfirm.value.trim();
	
	if(form.pwConfirm.value ==0) {
		alert('비밀번호확인을 입력해주세요');
		return;
	}
	
	if(form.password.value != form.pwConfirm.value) {
		alert('비밀번호를 다시 확인해주세요');
		form.password.value='';
		form.pwConfirm.value='';
		return;
	}
	
	submitWriteFormDone=true;
	
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
  <a href="${pageContext.request.contextPath}/main.do">삼인의 숲</a>
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
    
    <form onsubmit="submitWriteForm(this); return false;" method="POST" action="../Egov/doAdd.do" >
    <table align="center" width="100%" border="1" style="border-color:#333; border-spacing:0; border-collapse:collapse;" >
    	<tr>
    		<td width="50%" align="center" style="overflow: hidden; background-color: #333; color: #f2f2f2; padding : 5px;">제목</td>
    		<td width="50%" style="padding:5px;" align="center">
    		<input name="title" type="text" size="90%" style="height:30px; font-size:15px;" placeholder=" 제목을 입력하세요.">
    		</td>
    	</tr>
    	<tr>
    		<td width="50%" align="center" style="overflow: hidden; background-color: #333; color: #f2f2f2; padding : 5px;" >내용</td>
    		<td height="300px" style="padding:5px;" align="center">
    		<textarea name="content" rows="20" cols="92" style="font-size:15px;" placeholder=" 내용을 입력하세요." ></textarea>
    		</td>
    	</tr>
    	<tr>
    		<td width="50%" align="center" style="overflow: hidden; background-color: #333; color: #f2f2f2; padding : 5px;">비밀번호</td>
    		<td width="50%" style="padding:5px;" align="center"><input name="password" id="pw" onchange="check_pw()" type="password" size="90%" style="height:30px; font-size:15px;" placeholder=" 숫자 4자리 이상"></td>
    	</tr>
    	<tr>
    		<td width="50%" align="center" style="overflow: hidden; background-color: #333; color: #f2f2f2; padding : 5px;">비밀번호 확인</td>
    		<td width="50%" style="padding:5px;" align="center"><input name="pwConfirm" id="pw2" onchange="check_pw()" type="password" size="90%" style="height:30px; font-size:15px;">
    		<div></div>
    		<span id="check"></span>
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