<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>게시판</title>
	<style>
	</style>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>
			<label>시/도</label>
			<select v-model="si" @change="fnArea">
				<option value="">:: 선택 ::</option>
				<option v-for="item in siList" :value="item.si">{{item.si}}</option>
			</select>
			<label>시/군/구</label>
			<select v-model="gu" @change="fnArea">
				<option value="">:: 선택 ::</option>
				<option v-for="item in guList" :value="item.gu">{{item.gu}}</option>
			</select>
			<label>동/읍/면/리</label>
			<select v-model="dong" @change="fnArea">
				<option value="">:: 선택 ::</option>
				<option v-for="item in dongList" :value="item.dong">{{item.dong}}</option>
			</select>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				siList : [],
				guList : [],
				dongList : [],
				si : "",
				gu : "",
				dong : ""
            };
        },
        methods: {
            fnArea(){
				var self = this;
				if(self.si == ""){
					self.guList = [];
				} else if(self.gu == ""){
					self.dongList = [];
				} 
				var nparmap = {
					si : self.si,
					gu : self.gu
				};
				$.ajax({
					url:"area.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(self.gu != ""){
							self.dongList = data.area;
						} else if(self.si != "") {
							self.guList = data.area;
						} else {
							self.siList = data.area;	
						}
						
					}
				});
			}
			
        },
		mounted() {
			this.fnArea();
		}
    });
    app.mount('#app');
</script>