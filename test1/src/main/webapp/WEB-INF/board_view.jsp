<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>게시글보기</title>
</head>
<style>
	
</style>
<body>
	<div id="app">
		<div @click="fnGetView">
			<div>제목 : {{map.title}}</div>
			내용 : <div v-html="map.contents"></div>
			<div>작성자 : {{map.username}}</div>
			아이디 : <span>{{map.userId}}({{map.email}})</span>
		</div>
		<br>
		<hr>
		<br>
		<div>답글란</div>
		<div>{{map.reply}}</div>
		<div v-if="sessionEmail == map.email || sessionStatus == 'A'">
			<button @click="fnRemove" class="remove">삭제</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				map : {},
				reply : {},
				boardNo : "${boardNo}",
				sessionId : "${sessionId}",
				sessionStatus : "${sessionStatus}",
				sessionEmail : "${sessionEmail}",
            };
        },
        methods: {
			fnGetView(){
				var self = this;
				var nparmap = {boardNo : self.boardNo};
				$.ajax({
					url:"board-view.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data.info);
						console.log(data.comment);
						self.map = data.info;			// 객체 'resultMap'에서 설정한 키값('info')
						self.reply = data.comment;
						
					}
				});
            },
			
        },
        mounted() {
			var self = this;
			self.fnGetView();
        }
    });
    app.mount('#app');
</script>