

$(document).ready(function(){

    fStart();

    $(this).on("click","#userInfoBtn", savePtInfo);


});


function fStart() {

    if(userId != null) {
        mrgelo.core.ajaxSend('getPtInfo', { user_tp: 'pt', user_id: userId});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        ptInfo = mrgelo.data.ptInfo.ptInfo;
        ptId = ptInfo.pt_id;
        setPtInfo();
    }
}


function setPtInfo() {
    if(ptInfo != undefined) {
        let imgLink = '';
        $('#nm').val(ptInfo.user_name);
        $('#mail').val(ptInfo.user_mail);
        $('#mobile').val(ptInfo.user_mobile);
        $('#address').val(ptInfo.address);
        $('#intro').text(ptInfo.pt_intro);
        ptInfo.file_name == null ? imgLink = '/fit-meta/images/img/profile.png' : imgLink = '/fit-meta/downThumbImg.do?pt_id='+ ptInfo.pt_id +'&file='+ ptInfo.file_name +'&dir=pt';
        $('#my-photo').attr('src', imgLink);
    }
}


function savePtInfo() {

    const mobile = $('#mobile').val().trim();
	const address = $('#address').val().trim();
    const intro = $('#intro').val().trim();

    var jsonParam = new Object();
    jsonParam.service_tp = 'pt_info_reg';
    jsonParam.crud_tp = 'u';
    jsonParam.user_id = ptInfo.user_id;
    jsonParam.pt_id = ptId;
    jsonParam.user_mobile = mobile;
    jsonParam.address = address;
    jsonParam.pt_intro = intro;
    jsonParam.oldFileNm = ptInfo.file_name;

    doMultipart(jsonParam);
}