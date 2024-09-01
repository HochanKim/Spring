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
</style>
<body>
	<div id="app">
		<input type="text" placeholder="학번" v-model="stuNo">
		<button @click="fnSearch">검색</button>
		<br><br><hr><br><br>
		{{info}}
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동",
				info : [],
				stuNo : ""
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"ok.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						// console.log(data);
						self.list = data.list;
					}
				});
            },
			fnSearch(){
				var self = this;
				console.log(self.stuNo);
				var nparmap = {stuNo : self.stuNo};
				$.ajax({
					url:"search.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
						self.info = data.stu;
					}
				});
			},
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>