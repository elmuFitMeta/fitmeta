
$(document).ready(function() {

    fStart();

    $('body').on("click", ".pop-view", function(){
        const contsLink = $(this).attr('link');
        $('.popup-image').css('display','block');
        $('#3dviewer').attr('src', contsLink);
    });

    $('.popup-image span').on("click", function(){
        $('.popup-image').css('display','none');
    });
});


function fStart() {

    if(ptId != null) {
        mrgelo.core.ajaxSend('getPtContentsInfo', { user_tp: 'pu', pt_id: ptId});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        setPtContentsInfo();
    }
}


function setPtContentsInfo() {

    mrgelo.temp.contentList(false);
    $('#contsList').append(htmlText);
}