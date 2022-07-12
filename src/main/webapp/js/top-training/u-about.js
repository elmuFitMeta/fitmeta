var ptInfo;

$(document).ready(function() { 
	fStart()
});


function fStart() {

    if(ptId != null) {
        mrgelo.core.ajaxSend('getPtInfo', { user_tp: 'pu', pt_id: ptId});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        ptInfo = mrgelo.data.ptInfo.ptInfo;
        setPtInfo();
    }
}


function setPtInfo() {
    if(ptInfo != undefined) {
        $('#nm').text(ptInfo.user_name);
        ptInfo.file_name == null ? imgLink = '/fit-meta/images/img/profile.png' : imgLink = '/fit-meta/downThumbImg.do?pt_id='+ ptInfo.pt_id +'&file='+ ptInfo.file_name +'&dir=pt';
        $('#my-photo').attr('src', imgLink);
        $('.fw-light').text(ptInfo.user_name);
        $('.text-muted').text(ptInfo.pt_intro);
        $('._address').text(ptInfo.address);
    }
}