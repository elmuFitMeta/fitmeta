
$(document).ready(function() {
    fStart();
});


function fStart() {

    if(ptId != null) {
        mrgelo.core.ajaxSend('getPtServiceInfo', { pt_id: ptId, user_tp: 'pu'});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        setPtServiceInfo();
    }

}


function setPtServiceInfo() {
    $('#nm').text(ptNm);
    mrgelo.temp.serviceList(false);
    $('#serv-list').append(htmlText);
}