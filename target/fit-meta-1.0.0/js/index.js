


$(document).ready(function(){
    fStart();
});


function fStart() {
    mrgelo.core.ajaxSend('getMainPgInfo');
    if (mrgelo.data.mainPgInfo.retcode != "000") return;
    setMainPageInfo();
}


function setMainPageInfo() {

    mrgelo.temp.trainerList();
    $('#pt-list').append(htmlText);
}

