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
			<div>이름 : <input type="text" name="name" v-model="stuInfo.name"></div>
			<div>생년월일 : <input type="text" name="birthday" v-model="stuInfo.birthday"></div>
			<div>학년 : <input type="text" name="grade" v-model="stuInfo.grade"></div>
			<div>전화번호 : <input type="text" name="tel" v-model="stuInfo.tel"></div>
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
				stuNo : "${stuNo}",
				name : "${name}",
				birthday : "${birthday}",
				grade : "${grade}",
				tel : "${tel}"
			
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
						self.stuInfo = data.info;	// 셀렉트 쿼리
					}
				});
            },
			infoUpdate(num){
				var self = this;
				var nparmap = {
					stuNo : num,
					name : self.name,
					birthday : self.birthday,
					grade : self.grade,
					tel : self.tel
				};
				$.ajax({
					url:"school-update.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.stuInfo = data.update;		//  업데이트 쿼리
						alert("정보를 수정하였습니다");
						//$.pageChange("school-stuInfo.do", {stuNo : self.stuNo});
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