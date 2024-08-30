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
		<div @click="fnGetStuInfo">
			<div>학번 : {{stuInfo.stuNo}}</div>
			<div>이름 : <input type="text" value="{{stuInfo.name}}"></div>
			<div>생년월일 : <input type="text" value="{{stuInfo.birthday}}"></div>
			<div>학년 : <input type="text" value="{{stuInfo.grade}}"></div>
			<div>전화번호 : <input type="text" value="{{stuInfo.tel}}"></div>
		</div>
		<button @click="infoUpdate()">정보수정</button>
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
			infoUpdate(){
				var self = this;
				var nparmap = {
					stuNo : self.stuNo
				};
				$.ajax({
					url:"school-update.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.stuInfo = data.update;		// 2024.08.30 18:10 여기서 이어가기
					}
				});
            },
        },
        mounted() {
			var self = this;
			self.fnGetStuInfo();
        }
    });
    app.mount('#app');
</script>