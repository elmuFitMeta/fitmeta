
$(document).ready(function(){
    
    fStart();

});



function fStart() {

    if(ptId != null && newsId != null) {
        mrgelo.core.ajaxSend('getPtNewsSingle', { pt_id: ptId, news_id: newsId});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        setSingleNewsInfo();
    }

}


function setSingleNewsInfo() {
    $('#nm').text(ptNm);
    mrgelo.temp.singleNewsList('pu');
    $('#single-news').append(htmlText);
    $('#news-list').append(htmlNewsList);
}