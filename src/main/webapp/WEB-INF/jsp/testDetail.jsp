<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- daisyui 불러오기 -->
<link rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/daisyui@0.14.4/dist/full.css"
>


</head>

<body>
<style>
.container{

 width: 35rem;

}

  table {
    width: 100%;
    border: 1px solid #444444;
  }
  
  
  th, td {
    border: 1px solid #444444;
    padding: 5px;
  }
  

</style>

	<div class= "detail">
		<div class="container  mt-4 text-center">

			<div class = "card border-gray-900 ">
					<div class="card-body">
						<div class="card-title">
							<h1>프로필 정보</h1>
						</div>
						<div class="flex justify-center">
						 <img class="card-img-top" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP-KXN9CLv8gDPKvbERYX3iVRDJn6JXDnHMHz8PVfLPdPIwbujAl9MCadFg4HicTlYGjw&usqp=CAU"
						 style="width:50%">
						</div> 
						
						<div class="card-title">
							<h4>${vo.name}</h4>
						</div>
						<div class=" flex justify-center card-text" >
						<table class="w-auto">
						      <thead>

						        <tr>
						          <th>사번</th>
						          <th>부서</th>
						          <th>직급</th>
						          <th>연락처</th>
						          <th>이메일</th>
						        </tr>
						      </thead>
						      <tbody>
						        <tr>
						          <td>${vo.num}</td>
						          <td>${vo.dept}</td>
						          <td>${vo.rank}</td>
						          <td>${vo.phone}</td>
						          <td>${vo.email}</td>
						        </tr>
						        
						      </tbody>
    					</table>
                       </div>
						 		
						
					</div>
				</div>
				
			</div>
		</div>
 	</div>
 	
 	
 	
 	

		 	
		 	 
</body>


</html>