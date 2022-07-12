

var trId;

$(document).ready(function(){

    fStart();
}); 

function fStart() {
    //trainer 상세 정보 조회
    mrgelo.core.ajaxSend('getTrainerInfo', { tr_id: '2'});

    trId = mrgelo.data.trainerInfo.trInfo.tr_id;
    setTrInfo();           
}

function setTrInfo() {
    const trInfo = mrgelo.data.trainerInfo.trInfo;

    $('#_name').text(trInfo.tr_name);
    $('#_prof-img').attr('src', '/fit-meta/downThumbImg.do?tr_id='+ trInfo.tr_id + '&file=' + trInfo.file_name);
    $('#_intro').text(trInfo.tr_intro);

    mrgelo.temp.planList(false);
    $('.pricing_table .pricing_card').append(htmlText);

}




/*
var mainMenu = document.querySelector('.links')
var openMenu = document.querySelector('.open')
var closeMenu = document.querySelector('.close')

openMenu.addEventListener('click', show)
closeMenu.addEventListener('click', close)

function show(){
    mainMenu.style.display = 'flex'
    mainMenu.style.right = '10'
}
function close(){
    mainMenu.style.right = '-60%'
}
*/
