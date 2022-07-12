
$(document).ready(function() {
    
    fStart();

    $(this).on("click","#saveServiceBtn", saveServiceInfo);
});



function fStart() {

    if(userId != null) {
        mrgelo.core.ajaxSend('getPtServiceInfo', { user_id: userId, user_tp: 'pt'});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        ptInfo = mrgelo.data.ptInfo.ptInfo;
        ptId = ptInfo.pt_id;
        setPtServiceInfo();
    }

}


function setPtServiceInfo() {

    mrgelo.temp.serviceList(true);
    $('#serv-list').append(htmlText);
}


function saveServiceInfo() {
    var servName = $('#serv-name').val().trim();
    var servIntro = $('#serv-intro').val().trim();
  
    if (servName.length == 0) {
      alert("サービスの名前を入力してください。");
      return;
    }
  
    if (servIntro.length == 0) {
      alert("サービスの紹介を入力してください。");
      return;
    }
  
    var jsonParam = new Object();
    jsonParam.service_tp = 'service_info_reg';
    jsonParam.crud_tp = 'c';
    jsonParam.pt_id = ptId;
    jsonParam.serv_name = servName;
    jsonParam.serv_intro = servIntro;
  
    //console.log(jsonParam);
    doMultipart(jsonParam);
}



function deleteService(servId) {

    let answer = window.confirm("サービスを削除しますか？");
    if (!answer) return; 

    var jsonParam = new Object();
    jsonParam.service_tp = 'service_info_reg';
    jsonParam.crud_tp = 'd';
    jsonParam.pt_id = ptId;
    jsonParam.serv_id = servId;
  
    doMultipart(jsonParam);

}






