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
		width:135px;
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
			<button @click="fnIdCheck">중복체크</button>
		</div>
		<div>
			<label>비밀번호<span>*</span></label>
		    <input type="password" v-model="pwd" id="pwd">
		</div>
		<div>
			<label>비밀번호 확인<span>*</span></label>
		    <input type="password" v-model="pwdCheck" id="pwdCheck">
			<button @click="fnPwdCheck">확인</button>
		</div>
		<div>
			<label>이름<span>*</span></label>
		    <input type="text" v-model="name">
		</div>
		<div>
			<label>이메일*</label>
		    <input type="text" v-model="email">
		</div>
		<div>
			<label>전화번호*</label>
		    <input type="text" v-model="phone">
		</div>
		<div>
			<label>성별*</label>
		    <span>남<input type="radio" name="gender" v-model="gender" value="M"></span>
		    <span>여<input type="radio" name="gender" v-model="gender" value="F"></span>
		</div>
		<div>
			<label>주소*</label>
			<input type="text" placeholder="주소" v-model="roadFullAddr">
			<button @click="fnAddress">검색</button>
		</div>
		<button @click="fnJoin" class="join">가입하기</button>
	</div>
</body>
</html>
<script>
	var idSame = false;		// 아이디 중복체크 여부
	var pwdSame = false;	// 비밀번호 일치여부
	
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
				list : [],
				userId : "",
				pwd : "",		// '비밀번호' 입력란의 input value값 저장공간
				pwdCheck : "",	// '비밀번호 확인' 입력란의 input value값 저장공간
				name : "",
				email : "",
				phone : "",
				gender : "",
				roadFullAddr : ""
            };
        },
        methods: {
			fnJoin(){
				var self = this;
				var regEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; 			// 이메일 정규표현식
				var regPhone =  /^(01[016789]|02|0[3-9]{1}[0-9]{1})\d{3,4}\d{4}$/; 			// 전화번호 정규표현식
				// 아이디-비밀번호
				if(idSame == false){
					alert("아이디 중복체크를 확인하세요");
					return;
				} else if(pwdSame == false){
					alert("비밀번호 일치여부를 확인해주세요");
					return;
				}

				// 이름
				if(self.name == ""){
					alert("성함을 입력해주세요");
					return;
				}

				// 이메일
				if(self.email == ""){
					alert("이메일을 입력해주세요");
					return;
				} else if(!regEmail.test(self.email)) {
					alert("이메일 형식에 맞게 입력해주세요(xxx@xxx.com)");
					return;
				}

				// 전화번호
				if(self.phone == ""){
					alert("전화번호를 입력해주세요");
					return;
				} else if(!regPhone.test(self.phone)) {
					alert("형식에 맞게 입력해주세요");
					return;
				}

				// 성별
				if(self.gender == ""){
					alert("성별을 선택해주세요");
					return;
				}

				// 주소
				if(self.roadFullAddr == ""){
					alert("주소를 입력해주세요");
					return;
				}
				var nparmap = {
					userId : self.userId,		// 입력 아이디
					pwd : self.pwd,				// 입력 비번
					name : self.name,			// 입력 이름
					email : self.email,			// 입력 이메일
					phone : self.phone,			// 입력 전화번호
					gender : self.gender,		// 입력 성별
					addr : self.roadFullAddr	// 입력 주소
				};
				$.ajax({
					url:"join.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {						
						alert("가입이 완료되었습니다!");
						// location.href="login.do";
					}
				});
	        },
			fnIdCheck(){
				var self = this;
				var regId =  /^[a-zA-Z0-9]*$/;	// 영문, 숫자 정규표현식
				var regNum =  /^[0-9]*$/;	// 숫자 정규표현식
				var nparmap = {
					userId : self.userId
				};
				$.ajax({
					url:"check.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data);
						// 중복체크
						if(self.userId.length <= 4 ){
							alert("최소 5글자 아이디를 입력하세요");
							return;
						} else if(!regId.test(self.userId) || regNum.test(self.userId)) {
							alert("영문, 숫자 조합만 가능합니다");
							return;
						} else if(data.info == undefined) {
							alert("사용 가능한 아이디");
							idSame = true;
						} else {
							alert("이미 사용중인 아이디");
							return;
						}
					}
				});
	        },
			fnPwdCheck(){
				if(self.pwd.value != self.pwdCheck.value){
					alert("비밀번호가 맞지 않습니다");
					return;
				} else {
					alert("일치여부 확인되었습니다.");
					pwdSame = true;
				}
			},
			fnAddress(){
				var self = this;
				var option = "width = 500, height = 500, top = 100, left = 200, location = no"
				window.open("addr.do", "addr", option);
			},
			fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
				var self = this;
				// 콜백을 함수로 생성
				self.roadFullAddr = roadFullAddr;
			}
        },
        mounted() {
            var self = this;
			// vue 객체 window에 저장
			window.vueAppInstance = this;
        }
    });
    app.mount('#app');
</script>