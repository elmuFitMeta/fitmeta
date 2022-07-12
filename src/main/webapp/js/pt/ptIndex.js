
var userId = window.SESSION_USER_INFO == undefined ? '-1' : window.SESSION_USER_INFO.user_id;



$(window).on('load', function() { 

    fStart();

    // class pop up
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


    // contents pop up
    $('body').on("click", ".pop-view", function(){
        const contsLink = $(this).attr('link');
        $('.popup-image').css('display','block');
        $('#3dviewer').attr('src', contsLink);
    });

    $('.popup-image span').on("click", function(){
        $('.popup-image').css('display','none');
    });


    // price pop up
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
    
    if(userId != null) {
        mrgelo.core.ajaxSend('getPtAllInfo', { user_id: userId, user_uid: userId, user_tp: 'pt'});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        setPtAllInfo();
    }
}


function setPtAllInfo() {

    let msgCnt = mrgelo.data.ptInfo.ptInfo.new_msg_cnt;
    if(msgCnt != 0) $('#_msg-cnt').text(msgCnt);

    mrgelo.temp.ptInfo();
    $('#pt-info').append(htmlText);

    mrgelo.temp.classList(false);
    $('#class-filter').append(htmlClassTp);
    $('#class-list').append(htmlText);

    mrgelo.temp.contentList(false);
    $('#conts-list').append(htmlText);

    mrgelo.temp.newsList(false);
    $('#news-list').append(htmlText);
}