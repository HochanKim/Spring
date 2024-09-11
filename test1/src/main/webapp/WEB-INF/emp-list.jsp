<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
	table {
			margin-left:20px;
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
	
</style>
<body>
	<div id="app">
		<div style="margin:10px;" v-model="searchGroup" @change="fnGroupSearch">
			<input type="checkbox" value="10"> ACCOUNTING
			<input type="checkbox" value="20"> RESEARCH
			<input type="checkbox" value="30"> SALES
			<input type="checkbox" value="40"> OPERATIONS
		</div>
		<table @click="fnGetList">
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>직급</th>
				<th>부서명</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.EMPNO}}</td>
				<td>{{item.EName}}</td>
				<td>{{item.JOB}}</td>
				<td>{{item.DEPTNO}}</td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				empno : "",
				ename : "",
				job : "",
				deptno : "",
				searchGroup : []
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
					
				};
				$.ajax({
					url:"empList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.emp;	// 컨트롤러에서 설정한 키값
					}
				});
            },
            fnGroupSearch(){
				var self = this;
				var fList = JSON.stringify(self.searchGroup);	// json형태의 문자열로 바꾸는 메소드
				var nparmap = {
					searchGroup : fList
				};
				$.ajax({
					url:"empGroupList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.dept;	// 서비스단에서 설정한 키값('dept')
					}
				});
            }
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>