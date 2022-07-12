
mrgelo.temp = {};
var htmlText;
var htmlClassTp;
var htmlNewsList;


mrgelo.temp.planList = function(chk) {
    htmlText = '';
    let plan, planServc;
    
    if(mrgelo.data.ptInfo.planList == undefined) return;

    for (let i = 0; i < mrgelo.data.ptInfo.planList.length; i++) {
        plan = mrgelo.data.ptInfo.planList[i];
        planServc = plan.plan_service.split('#');
        
        htmlText +=    '<div class="col-md-4 wow fadeInUp" data-wow-delay="0.'+i+'s">';
        htmlText +=    '<div class="price-item featured-item">';
        htmlText +=    '<div class="price-header">';
        htmlText +=    '<div class="price-status">';
        htmlText +=    '<span>Popular</span>';
        htmlText +=    '</div>';
        htmlText +=    '<div class="price-title">';
        htmlText +=    '<h2>'+ plan.plan_tp +'</h2>';
        htmlText +=    '</div>';
        htmlText +=    '<div class="price-prices">';
        htmlText +=    '<h2><small>￥</small>'+ plan.plan_price +'<span>/一ヶ月</span></h2>';
        htmlText +=    '</div>';
        htmlText +=    '</div>';
        htmlText +=    '<div class="price-body">';
        htmlText +=    '<div class="price-description">';
        htmlText +=    '<ul>';
        for (let j = 0; j < 4; j++) {
            if (j < planServc.length && planServc[j] != '') {
                htmlText +=    '<li>'+planServc[j]+'</li>';
            } else {
                htmlText +=    '<li style="height: 39px;"></li>';
            }
        }
        htmlText +=    '</ul>';
        htmlText +=    '</div>';
        htmlText +=    '</div>';
        htmlText +=    '<div class="price-footer">';
        htmlText +=    '<div class="price-action">';
        if (chk) {
            htmlText +=    '<a class="btn" href="javascript:;" onclick="deletePlan('+ plan.plan_id +')">プランを削除</a>';
        } else {
            htmlText +=    '<a class="btn" href="javascript:;">申し込む</a>';
        }
        htmlText +=    '</div>';
        htmlText +=    '</div>';
        htmlText +=    '</div>';
        htmlText +=    '</div>';

    }
}



mrgelo.temp.contentList = function(chk) {
    htmlText = '';
    let conts, arrLink, tempLink, realLink;

    if(mrgelo.data.ptInfo.contentList == undefined) return;

    for (let i = 0; i < mrgelo.data.ptInfo.contentList.length; i++) {
        conts = mrgelo.data.ptInfo.contentList[i];
        arrLink = conts.conts_link.split('/');
        tempLink = arrLink[3].split('&')[0].split('=')[1];
        realLink = arrLink[0] + '//' + arrLink[2] + '/embed/' + tempLink; 
        
        htmlText += '<div class="col-lg-4 wow fadeInUp" data-wow-delay="0.'+i+'s">';
        htmlText += '<div class="price-item featured-item">';
        htmlText += '<a href="'+realLink+'" data-lightbox="portfolio">';
        htmlText += '<iframe width="100%" height="100%" src="'+realLink+'"></iframe>';
        htmlText += '</a>';
        htmlText += '<div class="price-footer">';
        htmlText += '<div class="price-action">';
        htmlText += '<a class="btn pop-view" link="'+realLink+'" href="javascript:;">Play</a>';
        if(chk) htmlText += '<a class="btn" href="javascript:;" onclick="deleteContent('+ conts.conts_id +')">コンテンツを削除</a>';
        htmlText += '</div>';
        htmlText += '</div>';
        htmlText += '</div>';
        htmlText += '</div>';

    }
    
}



mrgelo.temp.classList = function(chk) {
    htmlText = '';
    htmlClassTp = '';

    let classInfo;
    let classInfo1;
    let classInfo2;
    
    if(mrgelo.data.ptInfo.classList == undefined) return;

    htmlClassTp = '<li data-filter="*" class="filter-active">All Classes</li>';
    
    classInfo = mrgelo.data.ptInfo.classList[0];

    if(mrgelo.data.ptInfo.classList.length == 1) {
        htmlClassTp += '<li data-filter=".filter-1">'+ classInfo.class_tp +'</li>';
        classInfo.dataFilter = 'filter-1';
    }

    for (let i = 0; i < mrgelo.data.ptInfo.classList.length; i++) {
        classInfo1 = mrgelo.data.ptInfo.classList[i];
        
        if(classInfo1.dataFilter == undefined) {
            htmlClassTp += '<li data-filter=".filter-'+ (i+1) +'">'+ classInfo1.class_tp +'</li>';
            classInfo1.dataFilter = 'filter-' + (i+1);
        }

        for (let k = i+1; k < mrgelo.data.ptInfo.classList.length; k++) {
            classInfo2 = mrgelo.data.ptInfo.classList[k];
            if(classInfo1.class_tp == classInfo2.class_tp && classInfo2.dataFilter == undefined) { 
                classInfo2.dataFilter = 'filter-' + (i+1);
            }
        } 
    }

    
    for (let i = 0; i < mrgelo.data.ptInfo.classList.length; i++) {
        classInfo = mrgelo.data.ptInfo.classList[i];
        
        htmlText += '<div class="col-lg-4 col-md-6 col-sm-12 class-item '+classInfo.dataFilter+' wow fadeInUp" data-wow-delay="0.'+i+'s">';
        htmlText += '<div class="class-wrap">';
        htmlText += '<div class="class-img">';
        htmlText += '<img src="/fit-meta/downThumbImg.do?pt_id='+ classInfo.pt_id +'&class_id=' + classInfo.class_id + '&file='+ classInfo.file_name +'&dir=class" alt="Image">';
        htmlText += '</div>';
        htmlText += '<div class="class-text">';
        htmlText += '<div class="class-teacher">';
        htmlText += '<img src="/fit-meta/downThumbImg.do?pt_id='+ classInfo.pt_id +'&class_id=' + classInfo.class_id + '&file='+ classInfo.file_name +'&dir=class" alt="Image">';
        htmlText += '<h3>View More</h3>';
        htmlText += '<a class="pop-view-desc" href="javascript:;">+</a>';
        htmlText += '</div>';
        htmlText += '<h2 class="_class-title">'+ classInfo.class_name +'</h2>';
        htmlText += '<div class="class-meta">';
        htmlText += '<p><i class="far fa-calendar-alt"></i>Sun, Tue, Thu</p>';
        htmlText += '<p><i class="far fa-clock"></i>9:00 - 10:00</p>';
        htmlText += '<p style="display:none;" class="_class-desc">'+ classInfo.class_intro +'</p>';
        htmlText += '</div>';
        htmlText += '</div>';
        htmlText += '</div>';
        if(chk) htmlText += '<button class="bt" onclick="deleteClass(\''+ classInfo.class_id +'\', \''+ classInfo.file_name +'\')">クラスを削除</button>';
        htmlText += '</div>';

    }

}



mrgelo.temp.serviceList = function(chk) {
    htmlText = '';
    let servInfo;

    if(mrgelo.data.ptInfo.serviceList == undefined) return;

    for (let i = 0; i < mrgelo.data.ptInfo.serviceList.length; i++) {
        servInfo = mrgelo.data.ptInfo.serviceList[i];
        
        htmlText += '<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.'+i+'s">';
        htmlText += '<div class="service-item active tt_custom_sm">';
        htmlText += '<div class="service-icon"><i class="flaticon-workout-1"></i></div>';
        htmlText += '<h3>'+ servInfo.serv_name +'</h3>';
        htmlText += '<p>'+ servInfo.serv_intro +'</p>';
        if(chk) htmlText += '<br><button class="bt" onclick="deleteService('+ servInfo.serv_id +')">サービスを削除</button>';
        htmlText += '</div>';
        htmlText += '</div>';

    }
    
}



mrgelo.temp.newsList = function(chk, user) {
    htmlText = '';
    htmlClassTp = '';
    let newsInfo, info, root;
    
    if(mrgelo.data.ptInfo.newsList == undefined) return;
    
    root = (user != undefined && (user == 'pu' || user == 'pu-home')) ? 'topTraining' : 'pt';
    
    for (let i = 0; i < mrgelo.data.ptInfo.newsList.length; i++) {
        newsInfo = mrgelo.data.ptInfo.newsList[i];
        info = newsInfo.news_info.slice(0, 150);

        if(chk || (user != undefined && user == 'pu')) htmlText += '<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.'+i+'s">';
        htmlText += '<div  style="height:500px;" class="blog-item tt_custom_sm">';
        htmlText += '<div class="blog-img">';
        htmlText += '<a href="/fit-meta/'+ root +'/single.do?pt_id='+ newsInfo.pt_id +'&news_id=' + newsInfo.news_id + '">';
        htmlText += '<img src="/fit-meta/downThumbImg.do?pt_id='+ newsInfo.pt_id +'&news_id=' + newsInfo.news_id + '&file='+ newsInfo.file_name +'&dir=news" alt="Blog">';
        htmlText += '</a>';
        htmlText += '</div>';
        htmlText += '<div class="blog-text">';
        htmlText += '<h2>'+ newsInfo.news_title +'</h2>';
        htmlText += '<div class="blog-meta">';
        htmlText += '<p><i class="far fa-list-alt"></i>Body Fitness</p>';
        htmlText += '<p><i class="far fa-calendar-alt"></i>01-Jan-2045</p>';
        htmlText += '<p><i class="far fa-comments"></i>5</p>';
        htmlText += '</div>';
        htmlText += '<p>'+ info +'</p>';
        htmlText += '<a class="btn" href="/fit-meta/'+ root +'/single.do?pt_id='+ newsInfo.pt_id +'&news_id=' + newsInfo.news_id + '">Read More <i class="fa fa-angle-right"></i></a>';
        htmlText += '</div>';
        htmlText += '</div>';
        if(chk) htmlText += '<button style="margin-left: 30%;" class="bt" onclick="deleteNews(\''+ newsInfo.news_id +'\', \''+ newsInfo.file_name +'\')">ニュースを削除</button>';
        if(chk || (user != undefined && user == 'pu')) htmlText += '</div>';

    }

}


mrgelo.temp.singleNewsList = function(user) {
    htmlText = '';
    htmlNewsList = '';
    let newsInfo, info, root;
    
    if(mrgelo.data.ptInfo.singleNews == undefined) return;
    newsInfo = mrgelo.data.ptInfo.singleNews;

    htmlText += '<img src="/fit-meta/downThumbImg.do?pt_id='+ newsInfo.pt_id +'&news_id=' + newsInfo.news_id + '&file='+ newsInfo.file_name +'&dir=news" />';
    htmlText += '<h2>'+ newsInfo.news_title +'</h2>';
    htmlText += '<p>'+ newsInfo.news_info +'</p>';

    if(mrgelo.data.ptInfo.newsList == undefined) return;
    
    root = (user != undefined && user == 'pu') ? 'topTraining' : 'pt';

    for (let i = 0; i < mrgelo.data.ptInfo.newsList.length; i++) {
        newsInfo = mrgelo.data.ptInfo.newsList[i];
        info = newsInfo.news_title.slice(0, 30);

        htmlNewsList += '<div class="post-item">';
        htmlNewsList += '<div class="post-img">';
        htmlNewsList += '<img src="/fit-meta/downThumbImg.do?pt_id='+ newsInfo.pt_id +'&news_id=' + newsInfo.news_id + '&file='+ newsInfo.file_name +'&dir=news" />';
        htmlNewsList += '</div>';
        htmlNewsList += '<div class="post-text">';
        htmlNewsList += '<a href="/fit-meta/'+root+'/single.do?pt_id='+ newsInfo.pt_id +'&news_id=' + newsInfo.news_id + '">'+ info +'</a>';
        htmlNewsList += '<div class="post-meta">';
        htmlNewsList += '<p>By<a href="javascript:;">Admin</a></p>';
        htmlNewsList += '<p>In<a href="javascript:;">Design</a></p>';
        htmlNewsList += '</div>';
        htmlNewsList += '</div>';
        htmlNewsList += '</div>';

    }

}


mrgelo.temp.trainerList = function() {
    htmlText = '';
    let ptInfo;
    
    if(mrgelo.data.mainPgInfo.ptList == undefined) return;
    
    for (let i = 0; i < mrgelo.data.mainPgInfo.ptList.length; i++) {
        ptInfo = mrgelo.data.mainPgInfo.ptList[i];

        htmlText += '<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.'+i+'s">';
        htmlText += '<div class="team-item">';
        htmlText += '<div class="team-img">';
        htmlText += '<a href="/fit-meta/topTraining/index.do?pt_id='+ ptInfo.pt_id + '">'
        htmlText += '<img src="/fit-meta/downThumbImg.do?pt_id='+ ptInfo.pt_id +'&file='+ ptInfo.file_name +'&dir=pt" alt="Image">';
        htmlText += '</a>';
        htmlText += '</div>';
        htmlText += '<div class="team-text">';
        htmlText += '<h2>'+ ptInfo.user_name +'</h2>';
        htmlText += '<p>ヘルスケアトレーナー</p>';
        htmlText += '</div>';
        htmlText += '</div>';
        htmlText += '</div>';
    }

}


mrgelo.temp.ptInfo = function(user) {
    htmlText = '';
    let ptInfo, root;

    if(mrgelo.data.ptInfo.ptInfo == undefined) return;

    ptInfo = mrgelo.data.ptInfo.ptInfo;

	root = (user != undefined && user == 'pu') ? 'topTraining' : 'pt';

    htmlText += '<div class="col-lg-5 col-md-6">';
    htmlText += '<div class="about-img">';
    htmlText += '<img src="/fit-meta/downThumbImg.do?pt_id='+ ptInfo.pt_id +'&file='+ ptInfo.file_name +'&dir=pt" alt="Image">';
    htmlText += '</div>';
    htmlText += '</div>';
    htmlText += '<div class="col-lg-7 col-md-6">';
    htmlText += '<div class="section-header text-left">';
    htmlText += '<p>パーソナルトレーニングへようこそ</p>';
    htmlText += '<h2>'+ ptInfo.user_name +'</h2>';
    htmlText += '</div>';
    htmlText += '<div class="about-text">';
    htmlText += '<p>'+ ptInfo.pt_intro +'</p>';
    htmlText += '<a class="btn" href="/fit-meta/'+root+'/about.do">Learn More</a>';
    htmlText += '</div>';
    htmlText += '</div>';

}
