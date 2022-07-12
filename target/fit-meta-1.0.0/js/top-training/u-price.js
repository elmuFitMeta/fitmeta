
$(document).ready(function() {
    fStart();
});


function fStart() {

    if(ptId != null) {
        mrgelo.core.ajaxSend('getPtPlanInfo', { pt_id: ptId, user_tp: 'pu'});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        setPtPlanInfo();
    }

}

function setPtPlanInfo() {
    mrgelo.temp.planList(false);
    $('#plan-list').append(htmlText);
}