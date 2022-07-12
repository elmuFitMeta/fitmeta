

var mrgelo = {
    img: {
        ext_img: ['jpg', 'png', 'jpeg', 'gif', 'bmp'],
    },
    component: {},
    data: {},
    core: {},
}


mrgelo.core.ajaxSend = function(type, params, isSync, callback){
    var res, req;
    $.ajaxSetup({
        url : "/fit-meta/AjaxFitMetaController.do",
        type : "POST",
        crossDomain : true,
        dataType : "json"
    });

    switch(type){

        case "loginCheck" :
            req = $.extend({}, userInfo, params);
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if(res.user_tp == 2){
                        document.location.href = "/fit-meta/index.do";
                    }
                    else if(res.user_tp == 3){
                        document.location.href = "/fit-meta/index.do";
                    }
                }
            });
            break;


        case "getPtInfo" :
            req = $.extend({}, ptInfo, params);
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    mrgelo.data.ptInfo = res;
                }
            });
            break;

        case "getPtPlanInfo" :
            req = $.extend({}, ptPlanInfo, params);
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    mrgelo.data.ptInfo = res;
                }
            });
            break;

        case "getPtContentsInfo" :
            req = $.extend({}, ptContentsInfo, params);
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    mrgelo.data.ptInfo = res;
                }
            });
            break;

        case "getPtClassInfo" :
            req = $.extend({}, ptClassInfo, params);
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    mrgelo.data.ptInfo = res;
                }
            });
            break;


        case "getPtServiceInfo" :
            req = $.extend({}, ptServiceInfo, params);
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    mrgelo.data.ptInfo = res;
                }
            });
            break;


        case "getPtNewsInfo" :
            req = $.extend({}, ptNewsInfo, params);
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    mrgelo.data.ptInfo = res;
                }
            });
            break;


        case "getPtNewsSingle" :
            req = $.extend({}, ptNewsSingle, params);
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    mrgelo.data.ptInfo = res;
                }
            });
            break;


        case "getMainPgInfo" :
            req = $.extend({}, mainPgInfo, params);
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    mrgelo.data.mainPgInfo = res;
                }
            });
            break;


        case "getPtAllInfo" :
            req = $.extend({}, ptAllInfo, params);
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    mrgelo.data.ptInfo = res;
                }
            });
            break;

        case "insertPtInfo" :
            req =  params;
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        alert("保存完了です。");
                        location.href = "/fit-meta/pt/index.do";
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;


        case "insertUserInfo" :
            req =  params;
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        alert("保存完了です。");
                        location.href = "/fit-meta/index.do";
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;


        case "getPtInfo" :
            req = $.extend({}, ptInfo, params);
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        mrgelo.data.ptInfo = res;
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;


        case "getClassListInfo" :
            req = $.extend({}, classListInfo, params);
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        mrgelo.data.classListInfo = res;
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;


        case "insertReviewInfo" :
            req =  params;
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        alert("保存完了です。");
                    } else {
                        alert(res.retmsg);
                    }
                    $('#review_modal').modal('hide');
                }
            });
            break;


        case "getReviewInfo" :
            req =  params;
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        mrgelo.data.review = res;
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;


        case "getClassInfo" :
            req =  params;
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        mrgelo.data = res;
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;


        case "getChatUserList" :
            req =  params;
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        mrgelo.data = res;
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;

        case "getChatUserInfo" :
            req =  params;
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        mrgelo.data = res;
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;


        case "insertMsgInfo" :
            req =  params;
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        mrgelo.data = res;
                        if(params.redirectPath != undefined && params.redirectPath) window.location.href ='/fit-meta/main/chatting.do?user_id='+params.incoming_user_id;
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;


        case "getNewApplyClassInfo" :
            req =  params;
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        mrgelo.data = res;
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;


        case "deleteNewApplyClassInfo" :
            req =  params;
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        mrgelo.data = res;
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;


        case "getNewApplyClassSingleInfo" :
            req =  params;
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        mrgelo.data = res;
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;


        case "classEventReg" :
            req =  params;
            $.ajax({
                async : false,
                data : { jsondata : JSON.stringify(req) },
                xhrFields: {
                    withCredentials: true
                },
                success : function( res ){
                    if (res.retcode == "000") {
                        mrgelo.data.updateEvents = res;
                    } else {
                        alert(res.retmsg);
                    }
                }
            });
            break;
    }
}




mrgelo.core.fileGenerateTagList = function($ajs , files, isSub) {
	
    if (mrgelo.data.files == null)
		mrgelo.data.files = new Array();
	else if (mrgelo.data.files.length >= 1) {
		alert('최대 1개 까지 업로드가 가능합니다.');
		return false;
	}

	let extendFile = new Array();
	let arrAllowExt = mrgelo.img.ext_img;


	let err;
	for (let i = 0; i < files.length && !err; i++) {

		let fileExt = files[i].name.substr(files[i].name.lastIndexOf('.') + 1).toLowerCase();

		if (arrAllowExt.indexOf(fileExt) < 0) {
			err = '[' + fileExt + '] 형식의 파일은 등록할 수 없습니다.';
		}

		extendFile[i] = {
			name: files[i].name,
			type: files[i].type,
			size: files[i].size / 1024 / 1024,
			ext: fileExt,
		};
	}

	if (err) {
		alert(err);
		return;
	}

	let resTag = '';
	let tmpFiles = [];
	let $domUL = ($ajs.prop('tagName').toLowerCase() == 'ul') ? $ajs : $ajs.find(isSub ? '#file_sub ul' : '#file_3d ul');

	for (let i = 0; i < extendFile.length; i++) {
		files[i].idx = mrgelo.data.fileIdx++;
		tmpFiles.push(files[i]);

		let reader = new FileReader();
		reader.onload = (function(theFile) {
			return function(e) {
				resTag  = '<li idx="' + files[i].idx + '">';
				resTag +=   '<div class="thumb">';
				resTag += (theFile.type.match('image.*')) ?
							  '<img src="' + e.target.result + '" class="fitsize" width="202" height="178">' :
							  '<img src="/asia3d/images/phto/no_img2.jpg" class="fitsize" width="202" height="178">';
				resTag +=   '</div>';
				resTag +=   '<button type="button" class="del"><i class="ico_comm">삭제</i></button>';


				resTag +=   '<span name="contents_file_name">' + theFile.name + '</span>';
				resTag += '</li>';

				$domUL.append(resTag);
			};
		})(files[i]); 

		reader.readAsDataURL(files[i]);
	}

	mrgelo.data.files = mrgelo.data.files.concat(tmpFiles);
}


mrgelo.core.fileEventMethod = function(e) {
    if (e.type != "click") {
        e.stopPropagation();
        e.preventDefault();
    }

    let realArea = $(this).find('.cont_upload').length ? $(this).find('.cont_upload') : $(this).find('.inner');
    let opt = {
        cont_upload: {background: '#efebe3'},
        inner: {opacity : 0.5},
    };
    switch (e.type) {
        case "click" :
            let idx = $(this).closest('li').attr('idx');
            let arrIdx = mrgelo.data.files.findIndex(function(el){return el.idx == idx})
            if (arrIdx > -1) mrgelo.data.files.splice(arrIdx, 1);

            $(this).closest("li").remove();
            break;
        case "dragenter" :
            realArea.css(opt[realArea.attr("class")]);
            break;
        case "dragleave" :
            realArea.removeAttr("style");				
            if(realArea.attr("class")=="inner"){
                realArea.find(".inner").removeAttr("style");
            }
            break;
        case "dragover" :
            realArea.css(opt[realArea.attr("class")]);		
            break;
        case "drop" :
            let files = e.originalEvent.dataTransfer.files;
            if (files && files.length) {
                mrgelo.core.fileGenerateTagList($(this).closest('.wrap_upload'), files, $(this).attr('id') == 'file_sub');
            }
            else {
                alert('관리자에게 문의하세요.');
                return;
            }

            realArea.removeAttr("style");
            if (realArea.attr("class") == "inner") {
                realArea.find(".inner").removeAttr("style");
            }
            break;
    }

}


mrgelo.core.fileChangeMethod = function(){

    if( mrgelo.data.files == null ){
        mrgelo.data.files = new Array();
    }

    var fileName = $(this).prop("value");
    fileName = fileName.split("\\")[2];

    try{
        if( fileName.search(/\.([png]|[jpg]|[JPG]|[gif]|[jpeg]).{0,3}/) == -1 ) {
            alert("png,jpg,jpeg,gif 拡張子以外はアップロードできません。");
            $(this).prop("value","");
        } else{
            var file = document.querySelector('#my_photo_file');
            var fileList = file.files ;
            mrgelo.data.files.push(fileList[0]);
            
            // open
            var reader = new FileReader();
            reader.readAsDataURL(fileList[0]);

            //after load
            reader.onload = function  () {
                //썸네일 이미지 생성
                var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
                tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
                tempImage.onload = function() {
                    //리사이즈를 위해 캔버스 객체 생성
                    var canvas = document.createElement('canvas');
                    var canvasContext = canvas.getContext("2d");
                    
                    //캔버스 크기 설정
                    canvas.width = 100; //가로 100px
                    canvas.height = 100; //세로 100px
                    
                    //이미지를 캔버스에 그리기
                    canvasContext.drawImage(this, 0, 0, 100, 100);
                    //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
                    var dataURI = canvas.toDataURL("image/jpeg");
                    
                    //썸네일 이미지 보여주기
                    document.querySelector('#my-photo').src = dataURI;
                };
            }; 
        }
    }catch(e){
        $(this).prop("value","");
    }
}


jQuery(document).ready(function($){

    $(this).on("click",".fileupload_area button.del", mrgelo.core.fileEventMethod);
    mrgelo.component.inputFile = $("#my_photo_file");
    mrgelo.component.inputFile.on("change", mrgelo.core.fileChangeMethod);
});
