let userId = window.SESSION_USER_INFO == undefined ? '-1' : window.SESSION_USER_INFO.user_id;


$(document).ready(function(){
    fStart();
});


function fStart() {
    mrgelo.core.ajaxSend('getMainPgInfo', {user_id: userId});
    if (mrgelo.data.mainPgInfo.retcode != "000") return;
    setMainPageInfo();
}


function setMainPageInfo() {
	let msgCnt = mrgelo.data.mainPgInfo.msgCnt;
    if(msgCnt != 0) $('#_msg-cnt').text(mrgelo.data.mainPgInfo.msgCnt);

    mrgelo.temp.trainerList();
    $('#pt-list').append(htmlText);

    mrgelo.temp.mainPageClassList();
    $('#class-list').append(htmlText);
}

