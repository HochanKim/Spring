<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>학생 리스트</title>
</head>
<style>
	table {
		margin:30px;
	}
    table,
    tr,
    td,
    th {
        border: 1px solid;
        text-align: center;
        border-collapse: collapse;
    }

    tr,
    td,
    th {
		height:40px;
        padding: 5px 10px;
    }
	.title {
		width:300px;
	}
	.cdate {
		width:200px;
	}
	a {
		color:#000;
		font-weight:bold;
	}

	/* 페이징 CSS */
	.pagination {
		justify-content: center;
		align-items: center;
		margin: 20px;
	}

	.pagination button {
		background-color: #f8f9fa;
		border: 1px solid #dee2e6;
		color: #007bff;
		padding: 8px 12px;
		margin: 0 2px;
		cursor: pointer;
		transition: background-color 0.3s, color 0.3s;
		border-radius: 4px;
	}

	.pagination button:hover {
		background-color: #007bff;
		color: white;
	}

	.pagination button.active {
		background-color: #007bff;
		color: white;
		cursor: default;
	}

	.pagination button:disabled {
		background-color: #e9ecef;
		color: #6c757d;
		cursor: not-allowed;
		border: 1px solid #dee2e6;
	}

	.pagination button:not(.active):not(:disabled):hover {
		background-color: #0056b3;
		color: white;
	}
</style>
<body>
	<div id="app">
		<div style="margin : 30px;">
			<select v-model="selectSize" @change="fnGetStu(1)">
				<option value="5">5개씩</option>
				<option value="10">10개씩</option>
				<option value="20">20개씩</option>
			</select>
		</div>
		<table>
			<tr>
				<th>학번</th>			
				<th>이름</th>			
				<th>아이디</th>			
				<th>학년</th>			
				<th>주민번호</th>
				<th>퇴학여부</th>					
			</tr>
			<tr v-for="item in stuLists">
				<td>
					<a href="javascript::" @click="move_info(item.stuNo)">
						{{item.stuNo}}
					</a>
				</td>	
				<td>
					<a href="javascript::" @click="move_view(item.stuNo)">
						{{item.name}}		
					</a>
				</td>	
				<td>{{item.id}}</td>	
				<td>{{item.grade}}</td>	
				<td>{{item.jumin}}</td>	
				<td>
					<button @click="exit(item.stuNo)">퇴학</button>
				</td>	
			</tr>
		</table>
		<div class="pagination">
		    <button v-if="currentPage > 1">이전</button>
		    <button v-for="page in totalPages" :class="{active: page == currentPage}" @click="fnGetStu(page)">
		        {{ page }}
		    </button>
		    <button v-if="currentPage < totalPages">다음</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
			stuLists : [],
			currentPage : 1,
			pageSize : 10,
			selectSize : 10,
			totalPages : ""
            };
        },
        methods: {
			fnGetStu(page){
				var self = this;
				self.pageSize = self.selectSize;
				self.currentPage = page;
				var nparmap = {
					startIndex : (page - 1) * self.pageSize,
					pageSize : self.pageSize
				};
				$.ajax({
					url:"school-stu.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.stuLists = data.list;
						self.totalPages = Math.ceil(data.page / self.pageSize);
					}
				});
            },
			move_info(num){	// 파라미터(매개변수) 'num'으로 받은 학번(stuNo)
				var self = this;
				$.pageChange("school-stuInfo.do", {stuNo : num});
			},
			move_view(num){	// 파라미터(매개변수) 'num'으로 받은 학번(stuNo)
				var self = this;
				$.pageChange("school-stuView.do", {stuNo : num});
			},
			exit(delnum){
				var self = this;
				var nparmap = {
					stuNo : delnum
				};
				if(!confirm("퇴학 처리 하시겠습니까?")){
					return;
				}
				$.ajax({
					url:"school-delete.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.stuLists = data.del;	
							alert("학생의 퇴학 처리가 완료됐습니다.");
							self.fnGetStu(self.currentPage);
					}
				});
			}
        },
        mounted() {
			var self = this;
			self.fnGetStu(self.currentPage);
        }
    });
    app.mount('#app');
</script>