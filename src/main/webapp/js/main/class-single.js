let user = window.SESSION_USER_INFO, calendar;

$(document).ready(function(){
    fStart();
});


function fStart() {
    let classId = getURLParameter("class_id") ? getURLParameter("class_id") : 'no';
    if (classId == 'no') history.back();
    mrgelo.core.ajaxSend('getClassInfo', {class_id: classId, service_tp: 'class_info'});
    if (mrgelo.data.retcode != "000") return;
    setClassInfo();
    initCalendar();
    addEvent();
}


function setClassInfo() {
    if(mrgelo.data.classInfo == undefined) return;
    let realLink, classInfo, classImgLink, tempLink, videoLink, htmlText, imgLink;
    classInfo = mrgelo.data.classInfo;
    classImgLink = classInfo.file_name != 'no' ? '/fit-meta/downThumbImg.do?pt_id='+ classInfo.pt_id +'&class_id=' + classInfo.class_id + '&file='+ classInfo.file_name +'&dir=class' : '/fit-meta/images/img/class-img.png';
    classInfo.pt_fileNm == null ? imgLink = '/fit-meta/images/img/profile.png' : imgLink = '/fit-meta/downThumbImg.do?pt_id='+ classInfo.pt_id +'&file='+ classInfo.pt_fileNm +'&dir=pt';


    realLink = 'no';
    if(classInfo.video_link != 'no') {
        videoLink = classInfo.video_link.split('/');
        tempLink = videoLink[3].split('&')[0].split('=')[1];
        realLink = videoLink[0] + '//' + videoLink[2] + '/embed/' + tempLink;
        htmlText = '<iframe id="_iframe" width="100%" src="'+ realLink +'"></iframe>';
        $('#video-link').append(htmlText);
        $('#_iframe').css('height', ($(window).height()-331)+'px');
    } else {
    	$('#class-img').attr('src', classImgLink);
    }

    let textHtml = '';
    const cnt = classInfo.cnt_review > 0 ? classInfo.sum_review / classInfo.cnt_review : 0;
    for(var star = 1; star <= 5; star++) {
        var class_name = '';
        if(Math.ceil(cnt) >= star) {
            class_name = 'text-warning';
        }
        else {
            class_name = 'star-light';
        }

        textHtml += '<i class="fas fa-star '+ class_name +' mr-1"></i>';
    }       
    textHtml += '<p>('+ classInfo.cnt_review +')</p>';

    $('#review').append(textHtml);

    $('#class-nm').text(classInfo.class_name);
    $('#class-intro').text(classInfo.class_intro);
    $('#pt-img').attr('src', imgLink);
    $('#pt-nm').text(classInfo.pt_name);
    $('#pt-intro').text(classInfo.pt_intro);

    $('#nm').val(user.user_name);
    $('#email').val(user.user_mail);
}



function applyForClass() {
    const q1 = $('#q1').val().trim();
    const q2 = $('#q2').val().trim();

    if (q1.length == 0) {
        alert("答えを入力してください。");
        return;
    }

    let msg = user.user_name +'<br>'+ user.user_mail +'<br>'+ q1 +'<br>'+ q2;

    if(mrgelo.data.classInfo.pt_user_id == undefined) return;

    var jsonParam = new Object();
	jsonParam.service_tp = 'msg_info_reg';
	jsonParam.crud_tp = 'c';
	jsonParam.incoming_user_id = mrgelo.data.classInfo.pt_user_id;
	jsonParam.outgoing_user_id = window.SESSION_USER_INFO.user_id;
	jsonParam.msg = msg;
	jsonParam.class_id = mrgelo.data.classInfo.class_id;
	jsonParam.class_name = mrgelo.data.classInfo.class_name;
	jsonParam.pu_name = window.SESSION_USER_INFO.user_name;
	jsonParam.pu_mail = window.SESSION_USER_INFO.user_mail;
	jsonParam.redirectPath = true;


    mrgelo.core.ajaxSend('insertMsgInfo', jsonParam);

}

function initCalendar() {
    let calendarEl = $('#calendar')[0];

    calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      initialDate: new Date(),
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      events: [],
      eventBackgroundColor: '#a11e12',
      eventBorderColor: '#ed6a5e',
      eventTimeFormat: {
        hour: 'numeric',
        minute: '2-digit',
        omitZeroMinute: true,
        hour12: false
      },
      locale: 'ja',
    });
  
    calendar.render();
}

function addEvent() {
    if(mrgelo.data.classEvents == undefined) return;
    let classEventsArr = mrgelo.data.classEvents;

    classEventsArr.forEach(obj => {
        calendar.addEvent({
          id: obj.event_id,
          title: obj.class_name,
          start: obj.date+'T'+obj.start_time,
          end: obj.date+'T'+obj.end_time
        });
    });
}













