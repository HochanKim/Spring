<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<title>view 기본 세팅 파일</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<button @click="fnPayment()">결제</button>
	</div>
</body>
</html>
<script>
	const userCode = "imp37273127"; 
	IMP.init(userCode);
    const app = Vue.createApp({
        data() {
            return {
				
            };
        },
        methods: {
			fnPayment(){
				IMP.request_pay({
				    pg: "html5_inicis",
				    pay_method: "card",
				    merchant_uid: "teshyung",	// 한 번 사용하면 재사용 못함, 랜덤 생성 필수
				    name: "테스트 결제",
				    amount: 1,					// 가격 : 입력받은 값
				    buyer_tel: "010-0000-0000",
				  }	, function (rsp) { // callback
			   	      if (rsp.success) {
			   	        // 결제 성공 시
						alert("성공");			// 결제내역을 테이블에 저장 (id, 가격, 구매자, 구매물품)
						console.log(rsp);
			   	      } else {
			   	        // 결제 실패 시
						alert("실패");
						console.log(rsp);
			   	      }
		   	  	});
			}
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>