<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>게시판</title>
	<style>
	    textarea {
			margin-top:20px;
		}
		button {
			margin-top:20px;
		}
		#editor {
			width:500px;
			height:300px;
		}
	</style>
	<!-- Quill CDN -->
	    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
	    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
</head>
<style>
</style>
<body>
	<div id="app">
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input id="title" v-model="title" style="width:500px;">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<<div id="editor"></div>
				</td>
			</tr>
		</table>
		<button id="btn" @click="fnSave">저장</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				title : "",
				contents : "",
				sessionId : "${sessionId}"
            };
        },
        methods: {
            // fnSave 생성 후 board-add.dox 호출해서 저장
			fnSave(){
				var self = this;
				var nparmap = {
					title : self.title, 
					contents : self.contents, 
					userId : self.sessionId
				};
				$.ajax({
					url:"board-add.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert(data.message);
						location.href = "board-list.do";
					}
				});
	        }
        },
		mounted() {
			var self = this;
	        // Quill 에디터 초기화
	        var quill = new Quill('#editor', {
	            theme: 'snow',
	            modules: {
	                toolbar: [
	                    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
	                    ['bold', 'italic', 'underline'],
	                    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
	                    ['link', 'image'],
	                    ['clean']
	                ]
	            }
	        });

	        // 에디터 내용이 변경될 때마다 Vue 데이터를 업데이트
	        quill.on('text-change', function() {
	            self.contents = quill.root.innerHTML;
	        });
		}
    });
    app.mount('#app');
</script>