<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- plugin 참조-->
<script type="text/javascript" src="js/plugins/validation/jquery.validate.min.js"></script>
 <!-- <script type="text/javascript">
                   
      $(document).ready(function () {          

        $('#valform').validate(); //유효성 검사를 적용
   
      }); //end ready()
 
    </script> -->




<script src="https://cdn.ckeditor.com/ckeditor5/12.1.0/classic/ckeditor.js"></script>
<script src="https://example.com/ckfinder/ckfinder.js"></script>
<!-- <script type='text/javascript'>
	window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}', '${file_path}', '파일 전송 완료.');
	</script> -->


<style>
.ck.ck-editor {
	/* max-width: 500px; */
	
}

.ck-editor__editable {
	min-height: 300px;
}
</style>






<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			공지사항 <small>새 게시물</small>
		</h1>
		<!-- <ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Forms</a></li>
			<li class="active">Editors</li>
		</ol> -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-info">
					<div class="box-header">
						<h3 class="box-title">공지사항 작성 <small>새로운 공지사항 내용을 작성하세요.<br /></small><br>
						</h3>
						
						<form action=noticeInsert method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="noticetitle">제목<br></label> <input type="text" class="form-control" id="exampleInputEmail1" name ="noticeSubject"  placeholder="공지 제목을 입력하세요." required="required">
							</div>
							<!-- 제목 폼그룹 -->


							<!-- tools box -->
					                                                                                                                                                                                                                                                                                                                                                                                                          		<!-- <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip"
                        title="Remove">
                  <i class="fa fa-plus"></i> 업로드</button>
              </div> -->
							<!-- /. tools -->




							<!-- /.box-header -->





							<div class="form-group">
								<label for="noticetitle">내용</label>

								<!-- 에디터 -->
								<textarea id="editor1" name="noticeContent" rows="10" cols="80"
									placeholder="공지할 내용을 입력하세요."></textarea>

							</div><!-- /. 에디터 폼그룹 -->

						<!-- 	<div class="form-group">
								<label for="exampleInputFile">File input</label> <input type="file" id="exampleInputFile"  name="uploadfile" placeholder="파일이 첨부되지 않았습니다.">

								<p class="help-block">파일을 첨부하세요.</p>
							</div> -->
							 
							<!-- 첨부 폼그룹 -->



							<div class="box-footer"><!-- 줄긋기 --></div>
							<button type="submit" class="btn btn-primary">등록</button>
							

						</form>
			<!-- 			<form action="fileupload" method="post" enctype="multipart/form-data">
						    <input type="file" name="uploadedfile" placeholder="파일 선택" /><br/>
						    <input type="submit" value="업로드">
						</form> -->

					</div>
					<!-- /.box -->
				</div>

			</div>
			<!-- /.col-->
		</div>
		<!-- ./row -->






	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->















































<script>
 // 3. CKEditor5를 생성할 textarea 지정
/*      ClassicEditor
        .create( document.querySelector( '#editor1' ) )
         .catch( error => {
            console.error( error )
            ;
        }); 
 */

     ClassicEditor
     .create( document.querySelector( '#editor1' ), {
    	 ckfinder: {
             // Upload the images to the server using the CKFinder QuickUpload command.
             uploadUrl: 'file_upload'
				/* filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileupload.do' */

             // Define the CKFinder configuration (if necessary).
             /* options: {
                 resourceType: 'Images'
             } */
             
         }
     
     } )
     /* .catch( error => {
            console.error( error )
            ; */
 
 
 
 
 
   /*  ClassicEditor
    .create( document.querySelector( '#editor1' ), {
        plugins: [ 'CKFinder' ],

        // Enable the CKFinder button in the toolbar.
        toolbar: [ 'ckfinder','imageUpload'],

        ckfinder: {
            // Upload the images to the server using the CKFinder QuickUpload command.
            uploadUrl: 'https://example.com/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images&responseType=json',

            // Define the CKFinder configuration (if necessary).
            options: {
                resourceType: 'Images',
                	openerMethod: 'popup'
            }
        }
    } ) *//* 
    .then( ... ) */
    /* .catch( error => {
            console.error( error )
            ; */
 
 
</script>


<!-- jQuery 3 -->
<script src="../../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- CK Editor -->
<script src="../../bower_components/ckeditor/ckeditor.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script
	src="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>



