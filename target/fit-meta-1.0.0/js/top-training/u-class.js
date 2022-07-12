

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

});


function fStart() {

    if(ptId != null) {
        mrgelo.core.ajaxSend('getPtClassInfo', { user_tp: 'pu', pt_id: ptId});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        setPtClassInfo();
    }
}


function setPtClassInfo() {
    mrgelo.temp.classList(false);
    $('#class-filter').append(htmlClassTp);
    $('#class-list').append(htmlText);
    
}