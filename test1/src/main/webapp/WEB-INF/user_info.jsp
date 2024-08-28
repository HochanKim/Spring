<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>게시판</title>
	<style>
	    textarea {
			margin-top:20px;
		}
		button {
			margin-top:20px;
		}
	</style>
</head>
<style>
</style>
<body>
	<div id="app">
		<div @click="fnInfo">
			<p>아이디 : {{info.userid}}</p>
			<p>이름 : {{info.username}}</p>
			<p>전화번호 : {{info.phone}}</p>
			<p>이메일 : {{info.email}}</p>
			<p>성별 : {{info.gender}}</p>
			<p>가입일 : {{info.cdatetime}}</p>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				info : {},
				userid : "${userid}"
            };
        },
        methods: {
			fnInfo(){
				var self = this;
				var nparmap = {userid : self.userid};
				$.ajax({
					url:"user-info.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data); 
						self.info = data.info;
					}
				});
	        }
        },
        mounted() {
            var self = this;
			self.fnInfo();
        }
    });
    app.mount('#app');
</script>