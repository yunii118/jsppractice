<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 	.pointer:hover{
 		cursor : pointer;
 	}
 </style>
</head>
<body>

<%@ include file="../common/header.jsp" %>
<!-- 메인 컨텐츠 -->
<!-- Begin Page Content -->
<form name="detailForm" hidden="true">
	<input type="text" name = "pageNo" value="${pageDto.cri.pageNo }" hidden="true">
	<input type="text" name="no" value="${bookDto.no }" hidden="true">
</form>

<div class="container-fluid">
	 <!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
	    	<h6 class="m-0 font-weight-bold text-primary">인기 도서</h6>
	    </div>
	    <div class="card-body">
	    	<!-- 차트 영역 -->
			<div height="300vh" width="450vw">
				<canvas id="myBarChart"  height="300vh" width="450vw"></canvas>
			</div>
			<hr />
			<!-- 테이블 영역 -->
			<table class="table table-bordered" width="100%" cellspacing="0">
            		<thead>
                		<tr>
                    		<th>no</th>
                        	<th>제목</th>
                        	<th>작가</th>
                        	<th>대여여부</th>
                        	<th>조회수</th>
                     	</tr>
                 	</thead>
                 	<tfoot>
                 		<tr>
                    		<th>no</th>
                        	<th>제목</th>
                        	<th>작가</th>
                        	<th>대여여부</th>
                        	<th>조회수</th>
                    	</tr>
                  	</tfoot>
                  	<tbody>
                  		<c:if test="${empty list }">
							<tr>
								<td colspan="4" align="center">도서목록이 존재하지 않습니다.</td>
							</tr>
					
						</c:if>
						<c:if test="${not empty list }">
							<c:forEach	items="${list }" var="bookDto">
								<tr>
									<td>${bookDto.no }</td>
									<td class="pointer"><a onclick="goDetail(${bookDto.no})">${bookDto.title }</a></td>
									<td>${bookDto.author }</td>
									<td>${bookDto.rentYnStr }</td>
									<td>${bookDto.visitcount }</td>
								</tr>
							</c:forEach>
						</c:if>
            		</tbody>
           		</table>
	    </div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<c:if test="${not empty list }">
<script>
  const ctx = document.querySelector("#myBarChart");

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['${list[0].title}', '${list[1].title}', '${list[2].title}',
    	  '${list[3].title}', '${list[4].title}'],
      datasets: [{
        label: '# of Votes',
        
        data: [${list[0].visitcount}, ${list[1].visitcount}, ${list[2].visitcount},
        	${list[3].visitcount}, ${list[4].visitcount}],
        backgroundColor: [
            'rgba(255, 99, 132, 0.4)',
            'rgba(54, 162, 235, 0.4)',
            'rgba(255, 206, 86, 0.4)',
            'rgba(75, 192, 192, 0.4)',
            'rgba(153, 102, 255, 0.4)',
        ],
        borderWidth: 1
      }]
    },
    options: {
    	responsive:false,
    	indexAxis: 'y',
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
</c:if>
<!-- 메인 컨텐츠 영역 끝 -->
<%@ include file="../common/footer.jsp" %>
</body>
</html>