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

</style>
<body>
	<div id="app">
		<h1>학생 상세정보</h1>
		<div @click="fnGetInfo">
			<div>학번 : {{stuInfo.stuNo}}</div>
			<div>이름 : {{stuInfo.name}}</div>
			<div>소속학부 : {{stuInfo.dName1}}</div>
			<div>소속학과 : {{stuInfo.dName2}}</div>
			<div>담당교수 : {{stuInfo.prof}}</div>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
			stuInfo : {},
			stuNo : "${stuNo}"
           
			};
        },
        methods: {
			fnGetInfo(){
				var self = this;
				var nparmap = {
					stuNo : self.stuNo
				};
				$.ajax({
					url:"school-stuView.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.stuInfo = data.info;	
					}
				});
            },
        },
        mounted() {
			var self = this;
			self.fnGetInfo();
        }
    });
    app.mount('#app');
</script>