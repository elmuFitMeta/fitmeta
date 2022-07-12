

$(document).ready(function() {
    
    fStart();
});


function fStart() {
    
    if(userId != null) {
        mrgelo.core.ajaxSend('getNewApplyClassInfo', { user_id: userId, service_tp: 'new_apply_class_info'});
        if (mrgelo.data.retcode != "000") return;
        setNewApplyClassListInfo();
    }
}


function setNewApplyClassListInfo() {
    mrgelo.temp.newApplyClassList();
    $('#customers').append(htmlText);
}


function deleteNewApplyClass(id) {
    mrgelo.core.ajaxSend('deleteNewApplyClassInfo', { id: id, user_id: mrgelo.data.newApplyClassList[0].pt_id, service_tp: 'delete_new_apply_class_info'});
    if (mrgelo.data.retcode != "000") return;
    $('#customers').empty();
    setNewApplyClassListInfo();
}

function registerNewApplyClass(id) {
    document.location.href = '/fit-meta/pt/register-single.do?id=' + id;
}