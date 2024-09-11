<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>view 기본 세팅 파일</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<button @click="fnApi">클릭</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				
            };
        },
        methods: {
			fnApi(){
				/* Javascript 샘플 코드 */
				var xhr = new XMLHttpRequest();
				var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
				var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'TFEt9uYjeDW6DP2FBi2DEfccghO7R5%2FJyiafQgoqwuDYzE2Jf8FRESQWBUGp%2B7YLbtsvbOyj43N23WwDBKymFA%3D%3D'; /*Service Key*/
				queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
				queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
				queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
				queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20240911'); /**/
				queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('1500'); /**/
				queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55'); /**/
				queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('127'); /**/
				xhr.open('GET', url + queryParams);
				xhr.onreadystatechange = function () {
					if (this.readyState == 4) {
						console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
					}
				};
				xhr.send('');
			}
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>