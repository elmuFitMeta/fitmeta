
mrgelo.temp = {};
var htmlText;
var htmlClassTp;
var htmlNewsList;


mrgelo.temp.planList = function(chk) {
    htmlText = '';
    let plan, classList;
    
    if(mrgelo.data.ptInfo.planList == undefined) return;

    for (let i = 0; i < mrgelo.data.ptInfo.planList.length; i++) {
        plan = mrgelo.data.ptInfo.planList[i];
        classList = plan.planClassList;
        
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
        htmlText +=    '<div style="height:250px;" class="price-body tt_custom_sm">';
        htmlText +=    '<div class="price-description">';
        htmlText +=    '<ul>';
        for (let j = 0; j <  classList.length; j++) {
            let classInfo = classList[j];
            let realLink = 'no', videoLink, tempLink;
            if(classInfo.video_link != 'no') {
                videoLink = classInfo.video_link.split('/');
                tempLink = videoLink[3].split('&')[0].split('=')[1];
                realLink = videoLink[0] + '//' + videoLink[2] + '/embed/' + tempLink;
            }
            htmlText +=    '<li><a class="pop-class-info" video-link="'+ realLink +'" class-desc="'+ classInfo.class_intro +'" class-title="'+ classInfo.class_name +'" href="javascript:;">'+ classInfo.class_name +'</a></li>';
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

    let classInfo, classInfo1, classInfo2, imgLink, videoLink, tempLink, realLink;
    
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
        realLink = 'no';
        if(classInfo.video_link != 'no') {
            videoLink = classInfo.video_link.split('/');
            tempLink = videoLink[3].split('&')[0].split('=')[1];
            realLink = videoLink[0] + '//' + videoLink[2] + '/embed/' + tempLink;
        }

        imgLink = classInfo.file_name != 'no' ? '/fit-meta/downThumbImg.do?pt_id='+ classInfo.pt_id +'&class_id=' + classInfo.class_id + '&file='+ classInfo.file_name +'&dir=class' : '/fit-meta/images/img/class-img.png';

        htmlText += '<div class="col-lg-4 col-md-6 col-sm-12 class-item '+classInfo.dataFilter+' wow fadeInUp" data-wow-delay="0.'+i+'s">';
        htmlText += '<div class="class-wrap">';
        htmlText += '<div class="class-img">';
        htmlText += '<img style="height:218px;" src="'+imgLink+'" alt="Image">';
        htmlText += '</div>';
        htmlText += '<div class="class-text">';
        htmlText += '<div class="class-teacher">';
        htmlText += '<img src="'+imgLink+'" alt="Image">';
        htmlText += '<h3>View More</h3>';
        htmlText += '<a class="pop-view-desc" href="javascript:;">+</a>';
        htmlText += '</div>';
        htmlText += '<h2 class="_class-title">'+ classInfo.class_name +'</h2>';
        htmlText += '<div class="class-meta">';
        var cnt = classInfo.cnt_review > 0 ? classInfo.sum_review / classInfo.cnt_review : 0;
        for(var star = 1; star <= 5; star++) {
            var class_name = '';
            if(Math.ceil(cnt) >= star) {
                class_name = 'text-warning';
            }
            else {
                class_name = 'star-light';
            }

            htmlText += '<i class="fas fa-star '+ class_name +' mr-1"></i>';
        }
        htmlText += '<p>('+ classInfo.cnt_review +')</p>';
        htmlText += '<a style="margin-left: 25%; color: white;" class="btn btn-primary" href="/fit-meta/topTraining/rating.do?class_id=' + classInfo.class_id + '">Review</a>';
        htmlText += '<p style="display:none;" vid-link="'+realLink+'" class="_class-desc">'+ classInfo.class_intro +'</p>';
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
    let ptInfo, imgLink;
    
    if(mrgelo.data.mainPgInfo.ptList == undefined) return;
    
    for (let i = 0; i < mrgelo.data.mainPgInfo.ptList.length; i++) {
        ptInfo = mrgelo.data.mainPgInfo.ptList[i];
        ptInfo.file_name == null ? imgLink = '/fit-meta/images/img/profile.png' : imgLink = '/fit-meta/downThumbImg.do?pt_id='+ ptInfo.pt_id +'&file='+ ptInfo.file_name +'&dir=pt';

        htmlText += '<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.'+i+'s">';
        htmlText += '<div class="team-item">';
        htmlText += '<div class="team-img">';
        htmlText += '<a href="/fit-meta/topTraining/index.do?pt_id='+ ptInfo.pt_id + '">'
        htmlText += '<img style="height:300px;" src="'+ imgLink +'" alt="Image">';
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
    let ptInfo, root, imgLink;

    if(mrgelo.data.ptInfo.ptInfo == undefined) return;

    ptInfo = mrgelo.data.ptInfo.ptInfo;
    ptInfo.file_name == null ? imgLink = '/fit-meta/images/img/profile.png' : imgLink = '/fit-meta/downThumbImg.do?pt_id='+ ptInfo.pt_id +'&file='+ ptInfo.file_name +'&dir=pt';

	root = (user != undefined && user == 'pu') ? 'topTraining' : 'pt';

    htmlText += '<div class="col-lg-5 col-md-6">';
    htmlText += '<div class="about-img">';
    htmlText += '<img src="'+ imgLink +'" alt="Image">';
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


mrgelo.temp.classFormList = function() {
    htmlText = '';
    let classInfo;

    if(mrgelo.data.ptInfo.classList == undefined) return;

    htmlText += '<div class="control-group">';
    htmlText += '<input type="text" class="form-control" id="plan-tp" placeholder="プランの種類" />';
    htmlText += '<p class="help-block text-danger"></p>';
    htmlText += '</div>';
    htmlText += '<div class="control-group">';
    htmlText += '<input type="text" class="form-control" id="plan-pr" placeholder="価格" />';
    htmlText += '<p class="help-block text-danger"></p>';
    htmlText += '</div>';
    htmlText += '<p>クラスを選択:</p>';

    for (let i = 0; i < mrgelo.data.ptInfo.classList.length; i++) {
        classInfo = mrgelo.data.ptInfo.classList[i];

        htmlText += '<div class="control-group" pt-id="'+classInfo.pt_id+'" c-vdLink="'+classInfo.video_link+'" c-intro="'+classInfo.class_intro+'" c-nm="'+classInfo.class_name+'" c-id="'+classInfo.class_id+'">';
        htmlText += '<input type="checkbox" id="class-'+(i+1)+'" name="checkbox02">';
        htmlText += '<label for="class-'+(i+1)+'" class="checkbox02">'+ classInfo.class_name +'</label>';
        htmlText += '</div>';
    }

    htmlText += '<div>';
    htmlText += '<button class="btn" type="button" id="savePlanBtn">プランを保存</button>';
    htmlText += '</div>';
    
}



mrgelo.temp.mainClassList = function() {
    htmlText = '';
    let classInfo, imgLink, intro;

    if(mrgelo.data.classListInfo.classList == undefined) return;
    
    for (let i = 0; i < mrgelo.data.classListInfo.classList.length; i++) {
        classInfo = mrgelo.data.classListInfo.classList[i];
        
        imgLink = classInfo.file_name != 'no' ? '/fit-meta/downThumbImg.do?pt_id='+ classInfo.pt_id +'&class_id=' + classInfo.class_id + '&file='+ classInfo.file_name +'&dir=class' : '/fit-meta/images/img/class-img.png';
        intro = classInfo.class_intro.slice(0, 80);

        htmlText += '<div class="post-item">';
        htmlText += '<div class="post-img">';
        htmlText += '<img style="width:117px; height:110px;" src="'+ imgLink +'"/>';
        htmlText += '</div>';
        htmlText += '<div class="post-text" style="margin-left:6%">';
        htmlText += '<a href="/fit-meta/main/class-single.do?class_id='+ classInfo.class_id +'"><span style="font-weight: bold;">'+ classInfo.class_name +'。</span>'+ intro +'</a>';
        htmlText += '<div class="post-meta">';
        var cnt = classInfo.cnt_review > 0 ? classInfo.sum_review / classInfo.cnt_review : 0;
        for(var star = 1; star <= 5; star++) {
            var class_name = '';
            if(Math.ceil(cnt) >= star) {
                class_name = 'text-warning';
            }
            else {
                class_name = 'star-light';
            }

            htmlText += '<i class="fas fa-star '+ class_name +' mr-1"></i>';
        }       
        htmlText += '<p>('+ classInfo.cnt_review +')</p>';
        htmlText += '</div>';
        htmlText += '<p>By <a href="javascript:;">'+ classInfo.pt_name +'</a></p>';
        htmlText += '</div>';
        htmlText += '</div>';
    
    }
    
}


mrgelo.temp.mainPageClassList = function() {
    htmlText = '';
    let classInfo, imgLink, intro;

    if(mrgelo.data.mainPgInfo.classList == undefined) return;
    
    for (let i = 0; i < mrgelo.data.mainPgInfo.classList.length; i++) {
        classInfo = mrgelo.data.mainPgInfo.classList[i];
        
        imgLink = classInfo.file_name != 'no' ? '/fit-meta/downThumbImg.do?pt_id='+ classInfo.pt_id +'&class_id=' + classInfo.class_id + '&file='+ classInfo.file_name +'&dir=class' : '/fit-meta/images/img/class-img.png';


        htmlText += '<div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp" data-wow-delay="0.0s">';
        htmlText += '<div class="class-wrap">';
        htmlText += '<div class="class-img">';
        htmlText += '<img style="height:218px;" src="'+ imgLink +'" alt="Image">';
        htmlText += '</div>';
        htmlText += '<div class="class-text">';
        htmlText += '<div class="class-teacher" style="width:55%">';
        htmlText += '<h3>申し込む</h3>';
        htmlText += '<a href="/fit-meta/main/class-single.do?class_id='+ classInfo.class_id +'" style="margin-left:25%;">+</a>';
        htmlText += '</div>';
        htmlText += '<h2>'+ classInfo.class_name +'</h2>';
        htmlText += '<div class="class-meta">';
        var cnt = classInfo.cnt_review > 0 ? classInfo.sum_review / classInfo.cnt_review : 0;
        for(var star = 1; star <= 5; star++) {
            var class_name = '';
            if(Math.ceil(cnt) >= star) {
                class_name = 'text-warning';
            }
            else {
                class_name = 'star-light';
            }

            htmlText += '<i class="fas fa-star '+ class_name +' mr-1"></i>';
        }       
        htmlText += '<p>('+ classInfo.cnt_review +')</p>';
        htmlText += '</div>';
        htmlText += '<br><p>PT: '+ classInfo.pt_name +'</p>';
        htmlText += '</div>';
        htmlText += '</div>';
        htmlText += '</div>';
    
    }
    
}


mrgelo.temp.chatUserList = function() {
    htmlText = '';
    let userInfo, msgCnt;
    
    if(mrgelo.data.userList == undefined) return;
    
    for (let i = 0; i < mrgelo.data.userList.length; i++) {
        userInfo = mrgelo.data.userList[i];

        msgCnt = userInfo.cnt_new_msg != 0 ? userInfo.cnt_new_msg : '';

        htmlText += '<a href="/fit-meta/main/chatting.do?user_id='+ userInfo.user_id +'">';
        htmlText += '<div class="content">';
        htmlText += '<img src="/fit-meta/images/img/profile.png" alt="">';
        htmlText += '<div class="details">';
        htmlText += '<span>'+ userInfo.user_name +'</span>';
        if(msgCnt != '') htmlText += '<div class="status-dot"><i class="fas fa-circle"></i></div>';
        htmlText += '</div>';
        htmlText += '</div>';
        htmlText += '<div class="status-dot"><span style="font-size: 22px;">'+ msgCnt +'</span></div>';
        htmlText += '</a>';
    }

}


mrgelo.temp.newApplyClassList = function() {
    htmlText = '';
    let info;

    if(mrgelo.data.newApplyClassList == undefined) return;

    htmlText += '<tr>';
    htmlText += '<th>Class Name</th>';
    htmlText += '<th>User Name</th>';
    htmlText += '<th>User Email</th>';
    htmlText += '<th class="_th">Register</th>';
    htmlText += '<th class="_th">Delete</th>';
    htmlText += '</tr>';
    
    for (let i = 0; i < mrgelo.data.newApplyClassList.length; i++) {
        info = mrgelo.data.newApplyClassList[i];
        
        htmlText += '<tr>';
        htmlText += '<td>'+ info.class_name +'</td>';
        htmlText += '<td>'+ info.pu_name +'</td>';
        htmlText += '<td>'+ info.pu_mail +'</td>';
        htmlText += '<td><button class="btn btn-success" onclick="registerNewApplyClass('+ info.new_apply_class_id +')">Sign Up</button></td>';
        htmlText += '<td><button class="btn btn-danger" onclick="deleteNewApplyClass('+ info.new_apply_class_id +')">Delete</button></td>';
        htmlText += '</tr>';
    
    }
    
}
