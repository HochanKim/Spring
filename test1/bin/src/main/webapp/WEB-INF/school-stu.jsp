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
</style>
<body>
	<div id="app">
		<table @click="fnGetStu">
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
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
			stuLists : [],
            };
        },
        methods: {
			fnGetStu(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"school-stu.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.stuLists = data.list;	
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
							self.fnGetStu();
					}
				});
			}
        },
        mounted() {
			var self = this;
			self.fnGetStu();
        }
    });
    app.mount('#app');
</script>