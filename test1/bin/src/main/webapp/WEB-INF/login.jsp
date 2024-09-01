<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>로그인</title>
</head>
<style>
	button {
		margin:15px;
	}
</style>
<body>
	<div id="app">
		<div style="margin:10px;">
			아이디 <input type="text" v-model="userId">
		</div>
		<div>
			비밀번호 <input type="password" v-model="pwd">
		</div>
		<button @click="fnLogin">로그인</button>		
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                list : [],
				userId : "",
				pwd : ""
            };
        },
        methods: {
            fnLogin(){
				var self = this;
				var nparmap = {
					userId : self.userId,
					pwd : self.pwd
				};
				$.ajax({
					url:"login.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(data.code == 100 || data.code == 200){
							alert("아이디 확인");
						} else if(data.code == 100 || data.code == 300) {
							alert("비밀번호 확인");
						} else if(data.code == 500){
							alert(data.message);
						} else {
							alert("로그인 성공");
							$.pageChange("board-list.do", {});
						}
					}
				});
            }
        },
        mounted() {
            var self = this;
        }
    });
    app.mount('#app');
</script>