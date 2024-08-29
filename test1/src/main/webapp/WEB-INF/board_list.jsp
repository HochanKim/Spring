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
		a {
			color:#000;
			font-weight:bold;
		}
	</style>
</head>
<style>
</style>
<body>
	<div id="app">
		<div style="margin : 20px;">
			<select style="margin-right : 5px;" v-model="searchOption">
				<option value="all">:: 전체 ::</option>	
				<option value="title">제목</option>	
				<option value="name">작성자</option>	
			</select>
			<label>
				검색 : <input type="text" placeholder="검색어" v-model="search">
			</label>
			<button @click="fnGetList">검색</button>
		</div>
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
				<td class="title">
					<a href="javascript::" @click="fnView(item.boardno)">
						{{item.title}}
					</a>
				</td>
				<td>
					<a href="javascript::" @click="fnUser(item.userid)">
						{{item.username}}
					</a>
				</td>
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
				search : "",
				searchOption : "all"
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
					search : self.search,
					searchOption : self.searchOption
				};
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
            },
			fnView(key){
				// key : boardNo, value : 게시글의 번호
				$.pageChange("board-view.do", {boardNo : key});
			},
			fnUser(info){
				// key : userid, value : 유저의 아이디
				$.pageChange("user-info.do", {userid : info});
			}
			
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>