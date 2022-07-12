
var userId = window.SESSION_USER_INFO == undefined ? null : window.SESSION_USER_INFO.user_id;

$(document).ready(function(){

    fStart();

    $('body').on("click", ".pop-view-desc", function(){
        const classTitle = $(this).parent().parent().find('._class-title').text();
        const classDesc = $(this).parent().parent().find('._class-desc').text();
        $('.popup-desc').css('display','block');
        $('#class-title').text(classTitle);
        $('#class-desc').text(classDesc);
    });

    $('.popup-desc span').on("click", function(){
        $('.popup-desc').css('display','none');
    });


    $('body').on("click", ".pop-view", function(){
        const contsLink = $(this).attr('link');
        $('.popup-image').css('display','block');
        $('#3dviewer').attr('src', contsLink);
    });

    $('.popup-image span').on("click", function(){
        $('.popup-image').css('display','none');
    });


});


$(window).on('load', function() { 
    
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


    // Blogs carousel
    $(".blog-carousel").owlCarousel({
        autoplay: true,
        dots: false,
        loop: true,
        nav : true,
        navText : [
            '<i class="fa fa-angle-left" aria-hidden="true"></i>',
            '<i class="fa fa-angle-right" aria-hidden="true"></i>'
        ],
        responsive: {
            0:{
                items:1
            },
            576:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:3
            }
        }
    });

});


function fStart() {

    
    if(ptId != null) {
        mrgelo.core.ajaxSend('getPtAllInfo', { pt_id: ptId, user_tp: 'pu'});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        setPtAllInfo();
    }
}


function setPtAllInfo() {

	let nm = mrgelo.data.ptInfo.ptInfo.user_name;
	$('#nm').text(nm);

    mrgelo.temp.ptInfo('pu');
    $('#pt-info').append(htmlText);

    mrgelo.temp.classList(false);
    $('#class-filter').append(htmlClassTp);
    $('#class-list').append(htmlText);

    mrgelo.temp.contentList(false);
    $('#conts-list').append(htmlText);

    mrgelo.temp.planList(false);
    $('#plan-list').append(htmlText);

    mrgelo.temp.serviceList(false);
    $('#serv-list').append(htmlText);

    mrgelo.temp.newsList(false, 'pu-home');
    $('#news-list').append(htmlText);
}