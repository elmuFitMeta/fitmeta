
$(document).ready(function() {

    fStart();

    $(this).on("click","#savePlanBtn", savePlanInfo);
});

function fStart() {

    if(userId != null) {
        mrgelo.core.ajaxSend('getPtPlanInfo', { user_id: userId, user_tp: 'pt'});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        ptInfo = mrgelo.data.ptInfo.ptInfo;
        ptId = ptInfo.pt_id;
        setPtPlanInfo();
    }
}

function setPtPlanInfo() {
    mrgelo.temp.planList(true);
    $('#plan-list').append(htmlText);
}


function savePlanInfo() {
    var planTp = $('#plan-tp').val().trim();
    var planPrice = $('#plan-pr').val().trim();
    var trServs = $('#tr-servs').val().trim();
  
    if (planTp.length == 0) {
        alert("プランの種類を入力してください。");
        return;
    }

    if (planPrice.length == 0) {
        alert("プランの価格を入力してください。");
        return;
    }
  
    if (trServs.length == 0) {
        alert("トレーナーのサービスを入力してください。");
        return;
    }
  
  
    let servs = '';
    $('.tr-servs').each(function(){
        let tmpSer = $(this).val().trim();
        if (tmpSer != '') {
          servs += tmpSer;
          servs += '#';
        }
    });
  
    var jsonParam = new Object();
    jsonParam.service_tp = 'plan_info_reg';
    jsonParam.crud_tp = 'c';
    jsonParam.pt_id = ptId;
    jsonParam.plan_tp = planTp;
    jsonParam.plan_price = planPrice;
    jsonParam.plan_service = servs;
  
    doMultipart(jsonParam);
}


function deletePlan(planId) {
    let answer = window.confirm("プランを削除しますか？");
    if (!answer) return; 
  
    var jsonParam = new Object();
    jsonParam.service_tp = 'plan_info_reg';
    jsonParam.crud_tp = 'd';
    jsonParam.pt_id = ptId;
    jsonParam.plan_id = planId;
  
    doMultipart(jsonParam);
}


