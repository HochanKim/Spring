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
			<div>이름 : {{stuInfo.name}}</div>
			<div>생년월일 : {{stuInfo.birthday}}</div>
			<div>학년 : {{stuInfo.grade}}</div>
			<div>전화번호 : {{stuInfo.tel}}</div>
		</div>
		<button @click="infoUpdate(stuInfo.stuNo)">정보수정</button>
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
			fnGetStuInfo(){
				var self = this;
				var nparmap = {
					stuNo : self.stuNo
				};
				$.ajax({
					url:"school-stuInfo.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.stuInfo = data.info;	
					}
				});
            },
			infoUpdate(num){
				if(!confirm("정보 수정하시겠습니까?")){
					return;
				} else {
					$.pageChange("school-update.do", {stuNo : num});	
				}
			}
        },
        mounted() {
			var self = this;
			self.fnGetStuInfo();
        }
    });
    app.mount('#app');
</script>