
var userInfo;

$(document).ready(function() { 
	userInfo = mrgelo.data.socialUserInfo;
	fStart();	
});


function fStart() {
	$('#name').val(userInfo.name);
	$('#mail').val(userInfo.email);
}


function clickBtnSave() {
	var name = $('#name').val().trim();
	var mail = $('#mail').val().trim();
	var mobile = $('#mobile').val().trim();
	var address = $('#address').val().trim();
	var intro = $('#intro').val().trim();


	var jsonParam = new Object();
	jsonParam.service_tp = 'pt_info_reg';
	jsonParam.crud_tp = 'c';
	jsonParam.gUser_id = mrgelo.data.socialUserInfo.id;
	jsonParam.user_tp = 2;
	jsonParam.yn = 0;
	jsonParam.user_name = name;
	jsonParam.user_mail = mail;
	jsonParam.user_mobile = mobile;
	jsonParam.address = address;
	jsonParam.pt_intro = intro;

	mrgelo.core.ajaxSend('insertPtInfo', jsonParam);
}


function clickUserBtnSave() {
	var name = $('#name').val().trim();
	var mail = $('#mail').val().trim();
	var mobile = $('#mobile').val().trim();


	var jsonParam = new Object();
	jsonParam.service_tp = 'user_info_reg';
	jsonParam.crud_tp = 'c';
	jsonParam.gUser_id = mrgelo.data.socialUserInfo.id;
	jsonParam.user_tp = 3;
	jsonParam.user_name = name;
	jsonParam.user_mail = mail;
	jsonParam.user_mobile = mobile;

	mrgelo.core.ajaxSend('insertUserInfo', jsonParam);
}



function clickBtnDelete() {
	document.location.href = "/fit-meta/index.do";
}