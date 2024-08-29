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
		li {
			display:inline-block;
			width:100px;
			text-align:center;
		}
	</style>
</head>
<style>
</style>
<body>
	<div id="app">
		<ul>
			<li>
				<a href="javascript::" @click="fnCategory('')">전체</a>
			</li>
			<li>
				<a href="javascript::" @click="fnCategory('1')">공지사항</a>
			</li>
			<li>
				<a href="javascript::" @click="fnCategory('2')">자유게시판</a>
			</li>
			<li>
				<a href="javascript::" @click="fnCategory('3')">질문게시판</a>
			</li>
		</ul>
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
					<a href="javascript::" @click="fnUser(item.userId)">
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
				searchOption : "all",
				category : ''
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
					search : self.search,
					searchOption : self.searchOption,
					category : self.category
				};
				console.log(nparmap);
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
				$.pageChange("user-info.do", {userId : info});
			},
			fnCategory(number){
				var self = this;
				self.category = number;
				self.fnGetList();	// 리스트 호출
			}
			
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>