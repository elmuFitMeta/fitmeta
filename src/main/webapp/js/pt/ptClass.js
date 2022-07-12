if (!mrgelo.data.files) mrgelo.data.files = [];		// 기존 파일과 새로운 파일을 모두 포함하는 배열
if (!mrgelo.data.fileIdx) mrgelo.data.fileIdx = 0;	// UI를 관리하기 위한 IDX

jQuery(document).ready(function($){
    $(this).on("click","#saveClassBtn", saveClassInfo);
});

$(window).on('load', function() { 

    fStart();

    $('body').on("click", ".pop-view-desc", function(){
        const classTitle = $(this).parent().parent().find('._class-title').text();
        const classDesc = $(this).parent().parent().find('._class-desc').text();
        
        $('.popup-desc').css('display','block');
        $('#class-title').text(classTitle);
        $('#class-desc').text(classDesc);
        
        const link = $(this).parent().parent().find('._class-desc').attr('vid-link');
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

    // Class filter
    var classIsotope = $('.class-container').isotope({
        itemSelector: '.class-item',
        layoutMode: 'fitRows'
    });
    
    
    $('#class-filter li').on('click', function () {
        $("#class-filter li").removeClass('filter-active');
        $(this).addClass('filter-active');
        classIsotope.isotope({filter: $(this).data('filter')});
    });

});



function fStart() {

    if(userId != null) {
        mrgelo.core.ajaxSend('getPtClassInfo', { user_id: userId, user_tp: 'pt'});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        ptInfo = mrgelo.data.ptInfo.ptInfo;
        ptId = ptInfo.pt_id;
        setPtClassInfo();
    }
}


function setPtClassInfo() {

    mrgelo.temp.classList(true);
    $('#class-filter').append(htmlClassTp);
    $('#class-list').append(htmlText);

    
}


function saveClassInfo() {

    alert('in');

    const classNm = $('#class-nm').val().trim();
	const classTp = $('#class-tp').val().trim();
    const videoLink = $('#video-link').val().trim();
    const classIntro = $('#class-intro').val().trim();
    var fileName = '';

    if (classNm.length == 0) {
        alert("クラス名を入力してください。");
        return;
    }

    if (classTp.length == 0) {
        alert("クラスのタイプを入力してください。");
        return;
    }

    $('.list_file li').each(function() {
		fileName = $(this).find("[name='contents_file_name']").text();
	});

    var jsonParam = new Object();
    jsonParam.service_tp = 'class_info_reg';
    jsonParam.crud_tp = 'c';
    jsonParam.pt_id = ptId;
    jsonParam.class_name = classNm;
    jsonParam.class_tp = classTp;
    classIntro.length == 0 ? jsonParam.class_intro = 'no' : jsonParam.class_intro = classIntro;
    fileName.length == 0 ? jsonParam.file_name = 'no' : jsonParam.file_name = fileName;
    videoLink.length == 0 ? jsonParam.video_link = 'no' : jsonParam.video_link = videoLink;

    doMultipart(jsonParam);

}


function deleteClass(classId, fileName) {
    let answer = window.confirm("クラスを削除しますか？");
    if (!answer) return; 
  
    var jsonParam = new Object();
    jsonParam.service_tp = 'class_info_reg';
    jsonParam.crud_tp = 'd';
    jsonParam.pt_id = ptId;
    jsonParam.class_id = classId;
    jsonParam.file_name = fileName;
  
    //console.log(fileName);
    doMultipart(jsonParam);
}