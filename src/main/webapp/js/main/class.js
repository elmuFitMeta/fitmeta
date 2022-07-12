
$(document).ready(function(){
    fStart();
});


function fStart() {
    let classWord = getURLParameter("class_word") ? getURLParameter("class_word") : '';
    mrgelo.core.ajaxSend('getClassListInfo', {class_word: classWord});
    if (mrgelo.data.classListInfo.retcode != "000") return;
    setClassListInfo();
}


function setClassListInfo() {
    mrgelo.temp.mainClassList();
    $('#class-list').append(htmlText);
}


function searchClass() {
    let inp_text = $('#search-class').val();
    if(inp_text == null || inp_text == ''){
      alert("検索語を入力してください");
    } else {
      document.location.href = '/fit-meta/main/class-list.do?class_word=' + inp_text;		
    }
}