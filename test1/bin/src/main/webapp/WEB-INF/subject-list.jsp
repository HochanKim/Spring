<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>서브젝트 리스트</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<p @click="fnGetList">{{subList}}</p>
		<p @click="fnGetList">{{stuList}}</p>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				subList : [],
				stuList : []
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"sub-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.subList = data.subList;	// 컨트롤러에서 설정한 키값('sub-list')
						self.stuList = data.stuList;	// 컨트롤러에서 설정한 키값('stu-list')
					}
				});
            }
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>