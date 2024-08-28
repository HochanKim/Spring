<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>회원가입</title>
</head>
<style>
	label {
		display:inline-block;
		width:100px;
	}
	span {
		margin-right:15px;
	}
	button {
		margin-left:10px;
	}
	.join {
		margin-top:20px;
	}
</style>
<body>
	<div id="app">
		<div>
			<label>아이디<span>*</span></label>
		    <input type="text" placeholder="아이디" v-model="userId">
			<button @click="fnCheck">중복체크</button>
		</div>
		<div>
			<label>비밀번호<span>*</span></label>
		    <input type="password" v-model="pwd" id="pwd">
		</div>
		<div>
			<label>이름<span>*</span></label>
		    <input type="text" v-model="name">
		</div>
		<div>
			<label>이메일</label>
		    <input type="text" name="email">
		</div>
		<div>
			<label>전화번호</label>
		    <input type="text" name="phone">
		</div>
		<div>
			<label>성별</label>
		    <span>남<input type="radio" name="gender" v-model="gender" value="M"></span>
		    <span>여<input type="radio" name="gender" v-model="gender" value="F"></span>
		</div>
		<button @click="fnJoin" class="join">가입하기</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				map : {},
				userId : "",
            };
        },
        methods: {
			fnJoin(){
				var self = this;
				var nparmap = {userid : self.userid};
				$.ajax({
					url:"user-info.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data); 
						self.map = data.user;
					}
				});
	        },
			fnCheck(){
				var self = this;
				var nparmap = {userid : self.userId};
				$.ajax({
					url:"check.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data);
						if(data.info == undefined){
							alert("사용 가능한 아이디");
						} else if(self.retuern.userId.length <= 4) {
							alert*("최소 5글자 아이디를 입력하세요")
						} else {
							alert("이미 사용중인 아이디");
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