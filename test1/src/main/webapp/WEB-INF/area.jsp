<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>게시판</title>
	<style>
		button {
			margin-left: 10px;
		}
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
		<div>
			<input type="text" placeholder="주소" v-model="roadFullAddr" readonly>
			<button @click="fnAddress">검색</button>
			<div>{{roadFullAddr}}</div>
		</div>
	</div>
</body>
</html>
<script>
	// js 영역에 콜백함수 만들고 fnResult 호출
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		if (window.vueAppInstance) {
			window.vueAppInstance.fnResult(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo);
		} else {
			console.error("Vue app instance is not available.");
		}
	}
    const app = Vue.createApp({
        data() {
            return {
				// 시/도 + 시/군/구 + 읍/면/리/동
				siList : [],
				guList : [],
				dongList : [],
				si : "",
				gu : "",
				dong : "",

				// 주소 api
				roadFullAddr : ""
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
			},
			fnAddress(){
				var self = this;
				// var option = "width = 500, height = 500, top = 100, left = 200, location = no"
				// window.open("addr.do", "addr", option);
				window.open("addr.do", "PopupWin", "width=700, height=800, top=100, left=250");
			},
			fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
				var self = this;
				// 콜백을 함수로 생성
				self.roadFullAddr = roadFullAddr;
				// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
				console.log(roadFullAddr);
				console.log(roadAddrPart1);
				console.log(addrDetail);
				console.log(engAddr);
			}
        },
		mounted() {
			this.fnArea();
			// vue 객체 window에 저장
			window.vueAppInstance = this;
		}
    });
    app.mount('#app');
</script>