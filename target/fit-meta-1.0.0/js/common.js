

function popLayer(layer){
  var _this = $(layer).data('layer');
  $('body').addClass('dimm').append('<div class="wrap_layer wrap_'+_this+'"></div>');
  
  /*$('#wrap').on('scroll touchmove mousewheel', function(event) {
    event.preventDefault();
    event.stopPropagation();
    return false;
  });*/
  

  $('.wrap_'+_this+'').load(contextPath+'/layer/'+_this+'.do', function(){
    var thisLayer = $('.wrap_'+_this+' .layer');
    if($(window).width()<780){
      maxHeight = $(window).height()-180;
    }else {
      maxHeight = $(window).height()-300;
    }
    thisLayer.find('.cont_layer').css('max-height',maxHeight);
    var layerWidht = thisLayer.width();
    var layerHeight = thisLayer.height()+10;
    thisLayer.css({'margin-left':-layerWidht*0.5});
    if(thisLayer.height()<$(window).height()){
      thisLayer.css({'margin-top':-layerHeight*0.5});
    }else{
      thisLayer.css({'top':'0', 'margin-top':20, 'margin-bottom':20});
    };
    $('.wrap_layer').not('.wrap_'+_this+'').remove();    
  });

}


function closeLayer(){
    $('.wrap_layer').remove();
    $('body').removeClass('dimm');
    $('#wrap').off('scroll touchmove mousewheel');
};


function goTargetPage(targetPage) {
  // check target page and send
  if(targetPage == '1'){
    popUpUserSignUp();
  } else if(targetPage == '2') {
    popUpPtSignUp();
  }

}


function popUpUserSignUp() {

}


function popUpPtSignUp() {
  //document.body.style.overflow = 'hidden';
  $('.wrap_layer').remove();
  $('body').addClass('dimm').append('<div class="wrap_layer wrap_login"></div>');

  /*$('#wrap').on('scroll touchmove mousewheel', function(event) {
    event.preventDefault();
    event.stopPropagation();
    return false;
  });*/
  
  $('.wrap_login').load(contextPath+'/layer/pTreg.do', function(){

    if($(window).width()<780){
      maxHeight = $(window).height()-180;
    } else {
      maxHeight = $(window).height()-300;
    }

    $('.wrap_login').css('max-height',maxHeight);
    
  });
}










/*$(document).ready(function(){

  $(".tab_comm li").click(function (e) {
    var thistab = $(this).parents('.tab_comm');
    var thisitem = $(this).parents('.tab_comm').next($('.cont_tab')).children($('.item'));
    var eq = thistab.children('li').index(this);
    thisitem.removeClass('on')
    thisitem.eq(eq).addClass('on')
    thistab.children('li').each(function () {
      if ($(this).hasClass("on")) {
        $(this).removeClass("on");
      }
    });
    $(this).addClass("on");
  });
});

function fixhd() {
  $(window).scroll(function(){
    var visualHeight = $('#visual').height();
    if($(window).scrollTop()>visualHeight){
      $('body').addClass('fixhd');
      $('#container').removeClass('trans')
    }else {
      $('body').removeClass('fixhd')
      $('#container').addClass('trans')
    }
  })
}


function popLayer(layer){
  var _this = $(layer).data('layer');
  $('body').addClass('dimm').append('<div class="wrap_layer wrap_'+_this+'"></div>');
  
  $('#wrap').on('scroll touchmove mousewheel', function(event) {
    event.preventDefault();
    event.stopPropagation();
    return false;
  });
  

  $('.wrap_'+_this+'').load(contextPath+'/layer/'+_this+'.do', function(){
    var thisLayer = $('.wrap_'+_this+' .layer');
    if($(window).width()<780){
      maxHeight = $(window).height()-180;
    }else {
      maxHeight = $(window).height()-300;
    }
    thisLayer.find('.cont_layer').css('max-height',maxHeight);
    var layerWidht = thisLayer.width();
    var layerHeight = thisLayer.height()+10;
    thisLayer.css({'margin-left':-layerWidht*0.5});
    if(thisLayer.height()<$(window).height()){
      thisLayer.css({'margin-top':-layerHeight*0.5});
    }else{
      thisLayer.css({'top':'0', 'margin-top':20, 'margin-bottom':20});
    };
    $('.wrap_layer').not('.wrap_'+_this+'').remove();    
  });

}



function closeLayer(){
    $('.wrap_layer').remove();
    $('body').removeClass('dimm');
    $('#wrap').off('scroll touchmove mousewheel');
};


function goTargetPage(targetPage) {
  
  // check target page and send
  if(targetPage == '1'){
    popUpUserSignUp();
  } else if(targetPage == '2') {
    popUpPtSignUp();
  }

}


function popUpUserSignUp() {

}


function popUpPtSignUp() {
  //document.body.style.overflow = 'hidden';
  $('.wrap_layer').remove();
  $('body').addClass('dimm').append('<div class="wrap_layer wrap_login"></div>');

  $('#wrap').on('scroll touchmove mousewheel', function(event) {
    event.preventDefault();
    event.stopPropagation();
    return false;
  });
  
  $('.wrap_login').load(contextPath+'/layer/pTreg.do', function(){

    if($(window).width()<780){
      maxHeight = $(window).height()-180;
    } else {
      maxHeight = $(window).height()-300;
    }

    $('.wrap_login').css('max-height',maxHeight);
    
  });
} */





