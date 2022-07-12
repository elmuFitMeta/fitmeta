
$(document).ready(function() {

    fStart();

    $(this).on("click","#savePlanBtn", savePlanInfo);


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

    if(userId != null) {
        mrgelo.core.ajaxSend('getPtPlanInfo', { user_id: userId, user_tp: 'pt'});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        ptInfo = mrgelo.data.ptInfo.ptInfo;
        ptId = ptInfo.pt_id;
        setPtPlanInfo();
    }
}

function setPtPlanInfo() {
    mrgelo.temp.classFormList();
    $('#success').append(htmlText);

    mrgelo.temp.planList(true);
    $('#plan-list').append(htmlText);
}


function savePlanInfo() {

    const planTp = $('#plan-tp').val().trim();
    const planPrice = $('#plan-pr').val().trim();

  
    if (planTp.length == 0) {
        alert("プランの種類を入力してください。");
        return;
    }

    if (planPrice.length == 0) {
        alert("プランの価格を入力してください。");
        return;
    }
  
    let arrClassInfo = new Array();
    $(':checkbox:checked').each(function(i){

        let objClassInfo = new Object();

        objClassInfo.pt_id = $(this).parent().attr('pt-id');
        objClassInfo.video_link = $(this).parent().attr('c-vdLink');
        objClassInfo.class_intro = $(this).parent().attr('c-intro');
        objClassInfo.class_name = $(this).parent().attr('c-nm');
        objClassInfo.class_id = $(this).parent().attr('c-id');

        arrClassInfo.push(objClassInfo);
    });


    if (arrClassInfo.length == 0) {
        alert("クラスを選択してください。");
        return;
    }
  
    var jsonParam = new Object();
    jsonParam.service_tp = 'plan_info_reg';
    jsonParam.crud_tp = 'c';
    jsonParam.pt_id = ptId;
    jsonParam.plan_tp = planTp;
    jsonParam.plan_price = planPrice;
    jsonParam.arrClassInfo = arrClassInfo;
  
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


