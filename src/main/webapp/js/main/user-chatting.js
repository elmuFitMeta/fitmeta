
const searchBar = $('.users .search input'),
searchBtn = $('.users .search button');
const user = window.SESSION_USER_INFO;

$('#nm').text(user.user_name);


searchBtn.click(function() {
	searchBar.toggleClass('show');
    searchBar.focus();
	searchBtn.toggleClass('active');
});

fStart();

function fStart() {
	mrgelo.core.ajaxSend('getChatUserList', {user_id: user.user_id, service_tp: 'chat_user_list'});
	if (mrgelo.data.retcode != "000") return;
    setUserListInfo();
}

function setUserListInfo() {
	mrgelo.temp.chatUserList();
	$('.users-list').append(htmlText);
}

