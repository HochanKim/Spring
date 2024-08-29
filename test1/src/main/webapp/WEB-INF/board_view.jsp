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
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				map : {},
				boardNo : "${boardNo}"
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
						console.log(data);
						self.map = data.info;	// 객체 'resultMap'에서 설정한 키값('info')
					}
				});
            }
        },
        mounted() {
			var self = this;
			self.fnGetView();
        }
    });
    app.mount('#app');
</script>