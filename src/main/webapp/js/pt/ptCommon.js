var ptInfo, ptId;
var userId = window.SESSION_USER_INFO == undefined ? null : window.SESSION_USER_INFO.user_id;
var ptUser = window.SESSION_USER_INFO;


$(document).ready(function(){

  	// upload file 
	$('#ex_file').change(function() {
		readFileAll(this.files, false);
	});
  
});


//파일 멀티등록을 위한 FileReader 생성 함수
function readFileAll(files, isSub) {
	mrgelo.core.fileGenerateTagList($('.wrap_upload'), files, isSub);
}


function doMultipart(tmpJson) {
  
  var formData = new FormData();

  if(mrgelo.data.files != undefined) {
    for (let i = 0; i < mrgelo.data.files.length; i++) {
      let file = mrgelo.data.files[i];
      if (file) {
        formData.append("file[]", file);
      }
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
        if(tmpJson.service_tp == 'conts_info_reg') {
          location.href = "/fit-meta/pt/contents.do";
        }
        else if(tmpJson.service_tp == 'plan_info_reg') {
          location.href = "/fit-meta/pt/price.do";
        }
        else if(tmpJson.service_tp == 'class_info_reg') {
          location.href = "/fit-meta/pt/class.do";
        }
        else if(tmpJson.service_tp == 'service_info_reg') {
          location.href = "/fit-meta/pt/service.do";
        }
        else if(tmpJson.service_tp == 'news_info_reg') {
          location.href = "/fit-meta/pt/news.do";
        }
        else if(tmpJson.service_tp == 'pt_info_reg') {
          location.href = "/fit-meta/pt/about.do";
        }
      } else {
        alert(result.retmsg);
      }
    }
  });
}