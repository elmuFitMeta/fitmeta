

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

    if(ptId != null) {
        mrgelo.core.ajaxSend('getPtClassInfo', { user_tp: 'pu', pt_id: ptId});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        setPtClassInfo();
    }
}


function setPtClassInfo() {
    $('#nm').text(ptNm);
    mrgelo.temp.classList(false);
    $('#class-filter').append(htmlClassTp);
    $('#class-list').append(htmlText);
    
}