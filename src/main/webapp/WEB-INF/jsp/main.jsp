<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script>    	
    	$(document).ready(function(){
        	$("#btnSearch").click(function () {
        		window.location = '${pageContext.request.contextPath}/main.do';
        	}); 
    	});    	
  	</script>
  	<style>
  	/*CSS 시작*/
  	* {
  	    box-sizing: border-box;
  	}
  	body {
  	  margin: 0;
  	  padding : 0;
  	  box-sizing : border-box;
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

  	td, th{
  	text-align: center;
  	}

  	a{
  	text-decoration: none;
  	color:orange;
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
  	/*CSS 끝*/
  	</style>

<script type="text/javascript">
	//이전 버튼 이벤트
	//5개의 인자값을 가지고 이동 main.do
	//무조건 이전페이지 범위의 가장 앞 페이지로 이동
	function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {
        
	    var page = ((range - 2) * rangeSize) + 1;
	    var range = range - 1;
	        
	    var url = "/Egov/main.do";
	    url += "?page=" + page;
	    url += "&range=" + range;
	    url += "&listSize=" + listSize;
	    url += "&searchType=" + searchType;
	    url += "&keyword=" + keyword;
	    location.href = url;
    }
    
	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, listSize, searchType, keyword) {

	    var url = "/Egov/main.do";
	        url += "?page=" + page;
	        url += "&range=" + range;
	        url += "&listSize=" + listSize;
	        url += "&searchType=" + searchType;
	        url += "&keyword=" + keyword; 
	
	        location.href = url;    
    }
	
	//다음 버튼 이벤트
    //다음 페이지 범위의 가장 앞 페이지로 이동
    function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;            
        var url = "/Egov/main.do";
            url += "?page=" + page;
            url += "&range=" + range;
            url += "&listSize=" + listSize;
            url += "&searchType=" + searchType;
            url += "&keyword=" + keyword;
            location.href = url;
    }
	
	// 검색
	$(document).on('click', '#btnSearch', function(e){
		var keyword = $('#keyword').val();
		
		//공백체크
		if(keyword == ""){
			alert("검색어를 입력하세요");
			$('#keyword').focus();
			return false;
		}
		
		e.preventDefault();
		var url = "/Egov/main.do";
        url += "?searchType=" + $('#searchType').val();
        url += "&keyword=" + $('#keyword').val();
        location.href = url;
        console.log(url); 
	});  

//스크립트 끝
</script>
  	
</head>
<body>
<!-- HTML 시작 -->
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
  	<form id="boardList" name="boardList">
    <center><img width="150px" src='./images/saminforest.png'/></center>
	    <br>
	    <div class="searchbg vertical-align-content">
		    <div>구분</div>  
			<div style="padding-left:10px;">
				<select style="width:100px;height:22px;" name="searchType" id="searchType">
			    	<option value="">선택</option>
			    	<option value="title" selected="selected">제목</option>
			    	<option value="content ">내용</option>
				</select>			
			</div>
			<div style="padding-left:10px;">
				<input id="keyword" name="keyword" type="text" size="70" >
			</div>			
			<div style="padding-left:10px;">		
				 <input type="button" onClick="${pageContext.request.contextPath}/main.do" name="btnSearch" id="btnSearch" value="조회" />
			</div>
						 
	    </div>	      
		<br>

	    <table align="center" width="100%" border="1" style="border-color:#333; border-spacing:0; border-collapse:collapse;">
	    	<tr style="overflow: hidden; background-color: #333; color: #f2f2f2; padding : 10px;">
	    		<th id="board_id" value="board_id" width="8%" align="center" style="padding : 5px;">번호</th>
	    		<th id="title" value="title" width="70%">제목</th>
	    		<th id="regdate" value="regdate" width="14%">등록일</th>
	    		<th id="views" value="views" width="8%" align="center">조회수</th>
	    	</tr>
	    	
	    	<tbody id="userList">
	    		<c:forEach items="${list}" var="result">
	                <tr>
	                    <td style="padding : 8px;">${result.board_id}</td>
	                    <td><a href="/Egov/detail.do?id=${result.board_id}"><div style="color:black;">${result.title}</div></a></td>
	                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${result.regdate}"/></td>
	                    <td>${result.views}</td>
	                </tr>
	            </c:forEach>
	            
		    </tbody>	 	
	    </table>
	</form>
		
		   
    <div style="padding-top:3px; width:100px; margin: 0px;">총<b>${pagination.listCnt}</b>건</div>
    <button type="button"  onclick='location.href="/Egov/main.do"'>목록</button>
    <button type="button"  onclick='location.href="/Egov/write.do"'>등록</button>
    <br>
    
    <!-- pagination start -->
    
        <div id="paginationBox" class="pagination1">
            <ul class="pagination" style="justify-content: center;">
 
                <c:if test="${pagination.prev}">
                    <li class="page-item"><a class="page-link" href="#"
                        onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
                    ,'${search.searchType}', '${search.keyword}')">이전</a></li>
                </c:if>
 
                <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
                    <li class="page-item <c:out value="${pagination.page == idx? 'active' : ''}"/> ">
                    <a class="page-link" href="#"
                        onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
                     ,'${search.searchType}', '${search.keyword}')">
                            ${idx} </a></li>
                </c:forEach>
 
                <c:if test="${pagination.next}">
                    <li class="page-item"><a class="page-link" href="#"
                        onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
                    ,'${search.searchType}', '${search.keyword}')">다음</a></li>
                </c:if> 
            </ul>
        </div>
     <!-- pagination end -->
        <hr />
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
<!-- HTML 끝 -->		
</body>
</html>