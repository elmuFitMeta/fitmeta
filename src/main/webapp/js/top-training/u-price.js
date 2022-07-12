
$(document).ready(function() {
    fStart();

    $('body').on("click", ".pop-class-info", function(){
        const classTitle = $(this).attr('class-title');
        const classDesc = $(this).attr('class-desc');
        const link = $(this).attr('video-link');
        
        $('.popup-desc').css('display','block');
        $('#class-title').text(classTitle);
        $('#class-desc').text(classDesc);
        
        if(link == 'no') {
            $('#_link').css('display','none');
        } else {
            $('#_link').attr('src', link);
            $('#_link').css('display','block');
        }
    });

    $('.popup-desc span').on("click", function(){
        $('.popup-desc').css('display','none');
        $('#_link').css('display','none');
    });
});


function fStart() {

    if(ptId != null) {
        mrgelo.core.ajaxSend('getPtPlanInfo', { pt_id: ptId, user_tp: 'pu'});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        setPtPlanInfo();
    }

}

function setPtPlanInfo() {
    $('#nm').text(ptNm);
    mrgelo.temp.planList(false);
    $('#plan-list').append(htmlText);
}