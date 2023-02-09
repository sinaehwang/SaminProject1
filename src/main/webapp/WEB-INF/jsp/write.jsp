<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성페이지</title>

<!-- 제이쿼리 -->
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
></script>

<!-- 테일윈드 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css">
<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.31.0/dist/full.css" rel="stylesheet" type="text/css" />


<style type="text/css">
.container{
	
	width: 40rem;
	height: 40rem;
	display: flex;
}
.container1{
  position:relative;
	width: 38rem;
	height: 38rem;
	background-color: rgb(240,240,240);
  border: 1px solid #444444;
}
/*
.table_write{
  position:relative;
	width: 90%;
	height: 90%;
  border:solid red;1px;
}
*/
.table_write>table{
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%,-50%);
  width:98%;
  height:90%;
  border: 1px solid #444444;
  text-align: center;
  border: 1px solid #444444;
   border-collapse: collapse;
   background-color: white;
}
.table_write>tbody>tr,th{
  width:20%;
}
.table_write>tbody>tr,th,td {
  border: 1px solid #444444; 
}
.table_write>tbody>tr>th{
  background-color:;
  width:
  
}
</style>


</head>


<body>



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
	      if(document.getElementById('pw').value==document.getElementById('pw2').value){
	          document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
	          document.getElementById('check').style.color='blue';
	      }
	      else{
	          document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
	          document.getElementById('check').style.color='red';
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

<div class="container mx-auto mt-10 ">
  <div class="container1 mx-auto ">
    <div class="table_write">
    <form onsubmit="submitWriteForm(this); return false;" method="POST" action="../Egov/doAdd.do" >
      <table>
        <tbody>
          <tr>
            <th>제목</th>
            <td><input class="w-full input input-bordered  max-w-xs" type="text" name="title" placeholder="제목을 입력해주세요" /></td>
          </tr>
          <tr>
            <th>내용</th>
            <td><textarea class="textarea textarea-bordered w-full" type="text" name="content" placeholder="내용을 입력해주세요" /></textarea></td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td>
            <input class="w-full input input-bordered  max-w-xs" type="text" name="password" id="pw" onchange="check_pw()" placeholder="비밀번호를 입력해주세요" />
            
             </td>
          </tr>
           <tr>
            <th>비밀번호 확인</th>
            <td>
            <input class="w-full input input-bordered  max-w-xs" type="text" name="pwConfirm" id="pw2" onchange="check_pw()"  placeholder="비밀번호확인을 입력해주세요" />
            <div></div>
            <span id="check"></span>
            </td>
          </tr>
          
          <tr>
			<th></th>
			<td>
			<button class="btn btn-primary" type="submit" value="작성" />작성</button>
			</td>
			</tr>
        </tbody>
      </table>
      </form>
    </div>    
  </div>

</div>
</body>
</html>