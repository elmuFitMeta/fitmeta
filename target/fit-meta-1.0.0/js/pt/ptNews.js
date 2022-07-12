if (!mrgelo.data.files) mrgelo.data.files = [];		// 기존 파일과 새로운 파일을 모두 포함하는 배열
if (!mrgelo.data.fileIdx) mrgelo.data.fileIdx = 0;	// UI를 관리하기 위한 IDX


$(document).ready(function(){
    
    $(this).on("click","#saveNewsBtn", saveNewsInfo);

    fStart();

});


function fStart() {

    if(userId != null) {
        mrgelo.core.ajaxSend('getPtNewsInfo', { user_id: userId, user_tp: 'pt'});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        ptInfo = mrgelo.data.ptInfo.ptInfo;
        ptId = ptInfo.pt_id;
        setPtNewsInfo();
    }
}


function setPtNewsInfo() {
    mrgelo.temp.newsList(true);
    $('#news-list').append(htmlText);
}


function saveNewsInfo() {

    const newsTitle = $('#news-title').val().trim();
    const newsInfo = $('#news-info').val().trim();
    var fileName = '';

    if (newsTitle.length == 0) {
        alert("ニュース名を入力してください。");
        return;
    }

    if (newsInfo.length == 0) {
        alert("ニュース情報を入力してください。");
        return;
    }


    $('.list_file li').each(function() {
		fileName = $(this).find("[name='contents_file_name']").text();
	});

    if (fileName.length == 0) {
        alert("ファイルを入力してください。");
        return;
    }


    var jsonParam = new Object();
    jsonParam.service_tp = 'news_info_reg';
    jsonParam.crud_tp = 'c';
    jsonParam.pt_id = ptId;
    jsonParam.news_title = newsTitle;
    jsonParam.news_info = newsInfo;
    jsonParam.file_name = fileName;

    //console.log(jsonParam);
    doMultipart(jsonParam);

}


function deleteNews(newsId, fileName) {

    let answer = window.confirm("ニュースを削除しますか？");
    if (!answer) return;

    var jsonParam = new Object();
    jsonParam.service_tp = 'news_info_reg';
    jsonParam.crud_tp = 'd';
    jsonParam.pt_id = ptId;
    jsonParam.news_id = newsId;
    jsonParam.file_name = fileName;
  
    //console.log(newsId, fileName);
    doMultipart(jsonParam);

}













