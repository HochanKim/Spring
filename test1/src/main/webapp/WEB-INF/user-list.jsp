<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>user 리스트 출력</title>
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
		<button @click="fnBoardList" style="margin:10px;">게시글목록(userController에서 작성)</button>
		<div>
			<select style="margin : 0 10px;" v-model="searchKind">
				<option value="all">:: 전체 ::</option>	
				<option value="userid">아이디</option>	
				<option value="useremail">이메일</option>	
			</select>
			<input placeholder="검색" v-model="keyword">
			<button @click="fnUserList" style="margin : 0 10px;">검색</button>
		</div>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in user">
				<td>
					<a href="javascript::" @click="fnInfo(item.userid)">
					{{item.userid}}
					</a>
				</td>
				<td>
					<a href="javascript::" @click="fnInfo(item.userid)">
					{{item.username}}
					</a>
				</td>
				<td>{{item.email}}</td>
				<td>
					<button @click="fnRemove(item.userid)">삭제</button>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<th>게시글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.boardno}}</td>
				<td>{{item.title}}</td>
				<td>{{item.userid}}</td>
				<td>{{item.hit}}</td>
				<td>{{item.cdatetime}}</td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				user : [],
				list : [],
				keyword : "",
				searchKind : "all"
            };
        },
        methods: {
			fnUserList(){
				var self = this;
				var nparmap = {
					keyword : self.keyword,
					searchKind : self.searchKind
				};
				$.ajax({
					url:"user-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data)
						self.user = data.list;	// 객체 키값명 'list'
					}
				});
	        },
			
			fnBoardList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"board-lists.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
					}
				});
	        },
			
			fnRemove(userId){
				var self = this;
				var nparmap = {userid : userId};
				if(!confirm("삭제하시겠습니까?")){
					return;
				};
				$.ajax({
					url:"user-remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						alert(data.msg);
						self.fnUserList();	
					}
				});
	        },
			
			fnInfo(userId){
				$.pageChange("user-info.do", {});
	        }
        },
        mounted() {
			var self = this;
			self.fnUserList();
        }
    });
    app.mount('#app');
</script>