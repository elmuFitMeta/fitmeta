<%@
	page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="projectPath" value="${pageContext.request.contextPath}" />


<jsp:include page="../common/head.jsp">
	<jsp:param value="cont" name="prefixCssName"/>
</jsp:include>



<style>
	tbody {
		display: table-row-group;
		vertical-align: middle;
		border-color: inherit;
	}
	
</style>

<script type="text/javascript">

	if (!mrgelo.data.files) mrgelo.data.files = [];		// 기존 파일과 새로운 파일을 모두 포함하는 배열
	if (!mrgelo.data.fileIdx) mrgelo.data.fileIdx = 0;	// UI를 관리하기 위한 IDX

	var arrPlanList = new Array();

	$(document).ready(function() {  
		
		// upload gym file 
		$('#ex_file').change(function() {
			readFileAll(this.files, false);
		});

	});


	// gym파일 멀티등록을 위한 FileReader 생성 함수
	function readFileAll(files, isSub) {
		mrgelo.core.fileGenerateTagList($('.wrap_upload'), files, isSub);
	}

	function clickBtnSave() {
		var name = $('#name').val().trim();
		var mail = $('#mail').val().trim();
		var mobile = $('#mobile').val().trim();
		var address = $('#address').val().trim();
		var intro = $('#intro').val().trim();
		var fileName = '';

		if (name.length == 0) {
		  alert("名前を入力してください。");
		  return;
	  	}

		if (mail.length == 0) {
		  alert("メールアドレスを入力してください。");
		  return;
	  	}

		if (mobile.length == 0) {
		  alert("移動電話を入力してください。");
		  return;
	  	}

		if (address.length == 0) {
		  alert("ジムの住所を入力してください。");
		  return;
	  	}

		if (intro.length == 0) {
		  alert("トレーナー紹介を入力してください。");
		  return;
	  	}

		$('.list_file li').each(function() {
			fileName = $(this).find("[name='contents_file_name']").text();
		});
		
		if (fileName.length == 0) {
			  alert("ファイルを入力してください。");
			  return;
		}

		var jsonParam = new Object();
		jsonParam.service_tp = 'trainer_info_reg';
		jsonParam.crud_tp = 'c';
		jsonParam.name = name;
		jsonParam.mail = mail;
		jsonParam.mobile = mobile;
		jsonParam.address = address;
		jsonParam.intro = intro;
		jsonParam.file_name = fileName;


		//console.log(jsonParam);
		doMultipart(jsonParam);
	}

	function doMultipart(tmpJson) {

		var formData = new FormData();

		for (let i = 0; i < mrgelo.data.files.length; i++) {
			let file = mrgelo.data.files[i];
			if (file) {
				formData.append("file[]", file);
			}
		}

		formData.append("jsondata", JSON.stringify(tmpJson));

		$.ajax({
			type: 'POST',
			url: "/fit-meta/AjaxFitMetaMultipartController.do",
			processData: false,
			contentType: false,
			data: formData,
			success: function(result) {
				if (result.retcode == "000") {
					alert("저장완료 되었습니다.");
					//location.href = "";
				} else {
					alert(result.retmsg);
				}
			}
			/*beforeSend:function() {
				$('#progress').show();
			},
			complete:function(){
				$('#progress').hide();
			},
			xhr: function() {
				myXhr = $.ajaxSettings.xhr();
				if(myXhr.upload){
					myXhr.upload.addEventListener('progress', showPercent, false);
				} else {
					console.log("Uploadress is not supported.");
				}
				return myXhr;
			}*/
		});

	}

	function clickBtnDelete() {

	}

</script>


<body>
    <div id="wrap">
      <div id="container">
        <%@ include file="../common/menu.jsp" %>
        <div id="contents">
          <div class="wfix">
            <div class="tit_comm">
              <h3 class="tit">パーソナルトレーナーの登録</h3>
            </div>
            <div class="wrap_upload">
              <form action="" method="post" enctype="multipart/form-data">
              	<fieldset>
					<div id="file_3d" class="fileupload_area item item1">
						<div class="cont_upload">
							<div class="area_drag">
								<div class="filebox1">
									<label for="ex_file">写真を追加</label>
									<input id="ex_file" type="file" enctype="multipart/form-data" multiple="">
								</div>
								<p>
									アップロードするファイルを選択するか、直接ドラッグしてください。<br />
									ファイルフォーマットは png, jpg, jpeg, gif, bmpが可能です。<br />
								</p>
							</div>
							<ul class="list_file"></ul>
						</div>
					</div>

					<div class="item item2">
						<div class="hd_upload">
							<strong class="tit">パーソナルトレーナーの情報</strong>
						</div>
						<div class="cont_upload" id="tbody_contents">
							<dl>
                                <dt>名前</dt>
                                <dd><input type="text" class="inp" placeholder="名前"  id="name"></dd>
                            </dl>
                            <dl>
                                <dt>メールアド レス</dt>
                                <dd><input type="text" class="inp" placeholder="メールアドレス"  id="mail"></dd>
                            </dl>
						</div>	
						<div class="cont_upload" id="tbody_contents">
							<dl>
                                <dt>移動電話</dt>
                                <dd><input type="text" class="inp" placeholder="移動電話 " id="mobile"></dd>
                            </dl>
                            <dl>
                                <dt>ジムの住所</dt>
                                <dd><input type="text" class="inp" placeholder="ジムの住所"  id="address"></dd>
                            </dl>
						</div>					
					</div>
					<br>
					<div class="item item2" id="gym-plan">
						
					</div>

					<br>

					<div class="item item3">
						<div class="cont_upload">
							<dl>
							<dt>トレーナー紹介</dt>
							<dd><textarea class="inp" placeholder="トレーナー紹介" id="intro" name="textarea"></textarea></dd>
							</dl>
						</div>
					</div>

				</fieldset>				
				
				<div class="tac">
					<button id="btn_pub"  type="button" class="btn_bold" onclick="clickBtnSave()">アップロード (公開)</button>
					<button id="btn_delete"  type="button" class="btn_bold" onclick="clickBtnDelete()">削除</button>
				</div>
				</form>
        </div>
    	</div>
		</div>
        <%@ include file="../common/footer.jsp" %>
      </div>

    </div>


	<div id="progress" style="position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; line-height: 100vh; text-align:center; background-color: rgba(255,255,255,0.5); z-index: 99; display: none;">
		<img src="<c:url value='/images/img/progress.gif'/>" style="width: 100px; vertical-align: middle">
	</div>
  </body>
</html>