
$(document).ready(function(){

    fStart();

});


function fStart() {

    if(ptId != null) {
        mrgelo.core.ajaxSend('getPtNewsInfo', { pt_id: ptId, user_tp: 'pu'});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        setPtNewsInfo();
    }
}


function setPtNewsInfo() {
    mrgelo.temp.newsList(false, 'pu');
    $('#news-list').append(htmlText);
}