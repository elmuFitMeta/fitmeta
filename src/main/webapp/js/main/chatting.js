const form = document.querySelector(".typing-area"),
inputField = form.querySelector(".input-field"),
sendBtn = form.querySelector("button");
chatBox = document.querySelector(".chat-box");

var userId = getURLParameter("user_id") ? getURLParameter("user_id") : 'no';
var root = getURLParameter("url") ? getURLParameter("user_id") : 'no';

fStart();


function fStart() {
    if(userId != 'no') {
        if(root == 'no') mrgelo.core.ajaxSend('getChatUserInfo', {user_id: userId, service_tp: 'chat_user_info', incoming_user_id: userId, outgoing_user_id: window.SESSION_USER_INFO.user_id, seen: 1});
        if (mrgelo.data.retcode != "000") return;
        setUserInfo();
        setMsgInfo();
    }
}


function setUserInfo() {
    let userInfo = mrgelo.data.userInfo;
    $('#nm').text(userInfo.user_name);
}


form.onsubmit = (e)=>{
    e.preventDefault();
}


//inputField.focus();
inputField.onkeyup = ()=>{
    if(inputField.value != ""){
        sendBtn.classList.add("active");
    }else{
        sendBtn.classList.remove("active");
    }
}

sendBtn.onclick = ()=>{
    var msg = $('#msg').val().trim();
    if(msg == '') return;
    
    var jsonParam = new Object();
	jsonParam.service_tp = 'msg_info_reg';
	jsonParam.crud_tp = 'c';
	jsonParam.incoming_user_id = userId;
	jsonParam.outgoing_user_id = window.SESSION_USER_INFO.user_id;
	jsonParam.msg = msg;

    mrgelo.core.ajaxSend('insertMsgInfo', jsonParam);

    setMsgInfo();
}

chatBox.onmouseenter = ()=>{
    chatBox.classList.add("active");
}

chatBox.onmouseleave = ()=>{
    chatBox.classList.remove("active");
}

function setMsgInfo() {

    htmlText = '';
    let msgInfo;
    
    if(mrgelo.data.msgList == undefined) return;
    
    for (let i = 0; i < mrgelo.data.msgList.length; i++) {
        msgInfo = mrgelo.data.msgList[i];

        if (msgInfo.outgoing_user_id == window.SESSION_USER_INFO.user_id) {
            htmlText += '<div class="chat outgoing">';
            htmlText += '<div class="details">';
            htmlText += '<p>'+ msgInfo.msg +'</p>';
            htmlText += '</div>';
            htmlText += '</div>';
            console.log(msgInfo.msg);
        } else {
            htmlText += '<div class="chat incoming">';
            htmlText += '<img src="/fit-meta/images/img/profile.png" alt="">';
            htmlText += '<div class="details">';
            htmlText += '<p>'+ msgInfo.msg +'</p>';
            htmlText += '</div>';
            htmlText += '</div>';
        }
    }

    $('.chat-box').empty();
    $('.chat-box').append(htmlText);

    if(!chatBox.classList.contains("active")){
        scrollToBottom();
    }

    inputField.value = "";
    
}


function scrollToBottom(){
    chatBox.scrollTop = chatBox.scrollHeight;
}


