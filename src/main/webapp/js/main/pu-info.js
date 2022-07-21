let puInfo;

$(document).ready(function(){
    fStart();
});

function fStart() {
    if(window.SESSION_USER_INFO == undefined) return;
    puInfo = window.SESSION_USER_INFO;
    mrgelo.core.ajaxSend('puInfoReg', {user_id: puInfo.user_id, service_tp: 'pu_info_reg', crud_tp: 'r'});
    if(mrgelo.data.puInfo == undefined) return;
    puInfo = mrgelo.data.puInfo;
    setPuInfo();
}

function setPuInfo() {
    $('#_info').addClass('act');
    $("#user-nm").html(puInfo.user_name);
    $("#_user-nm").val(puInfo.user_name);
    $("#_email").val(puInfo.user_mail);
    $("#_phone").val(puInfo.user_mobile);
}