<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
	table {
			margin-left:20px;
		}
	table,
	tr,
	td,
	th {
		border: 1px solid;
		text-align: center;
		border-collapse: collapse;
	}

	tr,
	td,
	th {
		height:40px;
		padding: 5px 10px;
	}
	label {
		margin-right:10px;
	}
</style>
<body>
	<div id="app">
		<div style="margin:20px;">
			<label v-for="item in codeList" >
				<input type="checkbox" v-model="selectItem" :value="item.code" @change="fnGetItemList">
				{{item.codeName}}
			</label>
		</div>
		<table>
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>가격</th>
				<th>종류</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.itemNo}}</td>
				<td>{{item.itemName}}</td>
				<td>{{item.price}}</td>
				<td>{{item.codeName}}</td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				codeList : [],
				selectItem : []
            };
        },
        methods: {
			fnCodeList(){	//  종류 선택 체크박스
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"code-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.codeList = data.codeList;
					}
				});
            },
            fnGetItemList(){	// 상품 리스트
				var self = this;
				var nparmap = {};
				if(self.selectItem.length > 0){
					var fList = JSON.stringify(self.selectItem);
					nparmap = {selectItem : fList};		// containKey = selectItem
				}
				$.ajax({
					url:"item.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
					}
				});
            },
        },
        mounted() {
            var self = this;
			self.fnCodeList();
			self.fnGetItemList();
        }
    });
    app.mount('#app');
</script>