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
				<th>첨부파일</th>
				<td>
					<input type="file" @change="fnFileChange"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<div id="editor"></div>
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
				sessionId : "${sessionId}",
				file : null		// 업로드한 파일
            };
        },
        methods: {
            // 파일 업로드 메소드
			fnFileChange(event) {
                this.file = event.target.files[0];
            },
            fnSave(){
                var self = this;
                var nparam = {
                    title : self.title, 
                    contents : self.contents,
                    userId : self.sessionId
                    
                };
                $.ajax({
                    url:"board-add.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparam,
                    success : function(data) { 
                        var idx = data.idx;
                        console.log(idx);
						// 파일 등록
                        if (self.file) {
							const formData = new FormData();
							formData.append('file1', self.file);
							formData.append('idx', idx);

							$.ajax({
								url: '/fileUpload.dox',
								type: 'POST',
								data: formData,
								processData: false,  
								contentType: false,  
								success: function() {
									console.log('업로드 성공!');
									alert(data.message);
									location.href = "board-list.do";
								},
								error: function(jqXHR, textStatus, errorThrown) {
									console.error('업로드 실패!', textStatus, errorThrown);
								}
							});
                        }
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