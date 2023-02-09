<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>

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

<div class="container mx-auto mt-10 ">
  <div class="container1 mx-auto ">
    <div class="table_write">
      <table>
        <tbody>
          <tr>
            <th>제목</th>
            <td>
           	<span>${article.title}</span> 
            </td>
          </tr>
          <tr>
            <th>작성자</th>
            <td>
           	<span>${article.writer}</span> 
            </td>
          </tr>
          <tr>
            <th>내용</th>
            <td>
            <span>${article.content}</span> 
            </td>
          </tr>
          <tr>
            <th>작성일</th>
            <td>
            <span>${article.regdate}</span>
             </td>
          </tr>
          
          <tr>
			<th></th>
			<td>
			<a href="/Egov/modify.do?id=${article.board_id}">
            <span class="btn">게시물 수정</span>
            </a>
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