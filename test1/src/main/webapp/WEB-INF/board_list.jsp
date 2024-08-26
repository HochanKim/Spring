<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>게시판</title>
	<style>
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
	</style>
</head>
<style>
</style>
<body>
	<div id="app">
		<label>
			검색 : <input type="text" placeholder="검색어" v-model="search">
		</label>
		<button @click="fnGetList">검색</button>
		<table>
			<tr>
				<th>번호</th>
				<th class="title">제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th class="cdate">작성일</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.boardno}}</td>
				<td class="title">{{item.title}}</td>
				<td>{{item.userid}}</td>
				<td>{{item.hit}}</td>
				<td class="cdate">{{item.cdatetime}}</td>
				<td>
					<button @click="fnRemove(item.boardno)">삭제</button>
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
				list : [],
				search : ""
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {search : self.search};
				$.ajax({
					url:"board-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;	// 컨트롤러에서 설정한 키값('list')
					}
				});
            },
            fnRemove(num){
				var self = this;
				var nparmap = {boardNo : num};
				$.ajax({
					url:"board-remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						confirm(data.msg);
						if(data.msg == true){
							alert(data.message);
							self.fnGetList();	// 게시글 삭제한 뒤에 재조회
						}
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