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
		<div>
			<label>시/도</label>
			<select v-model="si" @change="fnGuArea">
				<option value="">:: 전체 ::</option>
				<option v-for="item in siList" :value="item.si">{{item.si}}</option>
			</select>
			<label>시/군/구</label>
			<select v-model="gu" @change="fnDongArea">
				<option value="">:: 전체 ::</option>
				<option v-for="item in guList" :value="item.gu">{{item.gu}}</option>
			</select>
			<label>동/읍/면/리</label>
			<select v-model="dong" @change="fnApi">
				<option value="">:: 전체 ::</option>
				<option v-for="item in dongList" :value="item.dong">{{item.dong}}</option>
			</select>
            <button @click="fnGetApi">클릭</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				siList : [],
                si : "",
				guList : [],
                gu : "",
                dongList : [],
                dong : "",
                apiPoint : []
            };
        },
        methods: {
			fnSiArea(){
				var self = this;
				var nparmap = {

				};
				$.ajax({
					url:"si-list.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
                        self.siList = data.siList;
					}
				});
			},
            fnGuArea(){
				var self = this;
				var nparmap = {
                    si : self.si
				};
				$.ajax({
					url:"gu-list.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
                        self.guList = data.guList;
					}
				});
			},
            fnDongArea(){
				var self = this;
				var nparmap = {
                    si : self.si,
                    gu : self.gu
				};
				$.ajax({
					url:"dong-list.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
                        self.dongList = data.dongList;
					}
				});
			},
            fnGetApi(){
                /* Javascript 샘플 코드 */
				var xhr = new XMLHttpRequest();
				var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
				var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'TFEt9uYjeDW6DP2FBi2DEfccghO7R5%2FJyiafQgoqwuDYzE2Jf8FRESQWBUGp%2B7YLbtsvbOyj43N23WwDBKymFA%3D%3D'; /*Service Key*/
				queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
				queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
				queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
				queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20240911'); /**/
				queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('1700'); /**/
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
			this.fnSiArea();
        }
    });
    app.mount('#app');
</script>