const DEFAULT_OPTION = 'ALL';
let calendar,
userId = window.SESSION_USER_INFO.user_id,
classId,
classSingleInfo,
classEvents,
showUnrepeatableBoxBtn,
showRepeatableBoxBtn,
closeUnrepeatableBoxBtn,
closeRepeatableBoxBtn,
closeEventViewBoxBtn,
inputEventCnt,
eventCnt,
registerFormFirst,
selectElem,
classTable,
currentPage = 1,
itemsPerPage = 10,
paginationCtnr,
totalPage = 0;


$(document).ready(function(e) {   

  fStart();
});

function fStart() {
  classId = getURLParameter("id") ? getURLParameter("id") : 'no';
  if (classId == 'no') history.back();
  getElements();
  addListeners();
  initCalendar();
  load();
  renderRows(classEvents);
  updateSelectOption();
  $(".timePicker").hunterTimePicker();
}

function getElements(){
  showUnrepeatableBoxBtn = $('#unrepeatable')[0];
  showRepeatableBoxBtn = $('#repeatable')[0];
  closeUnrepeatableBoxBtn = $('#todo-modal-close-btn')[0];
  closeRepeatableBoxBtn = $('#repeat-register-btn')[0];
  closeEventViewBoxBtn = $('#event-view-btn')[0];
  inputEventCnt = $('#evnt-cnt')[0];
  registerFormFirst = $('#register-form-1');
  selectElem = document.getElementById('categoryFilter');
  classTable = document.getElementById("todoTable");
  paginationCtnr = document.querySelector('.pagination-pages');
}

function addListeners(){
  showUnrepeatableBoxBtn.addEventListener("click", showUnrepeatableBox, false);
  showRepeatableBoxBtn.addEventListener("click", showRepeatableBox, false);
  closeUnrepeatableBoxBtn.addEventListener("click", closeUnrepeatableBox, false);
  closeRepeatableBoxBtn.addEventListener("click", closeRepeatableBox, false);
  closeEventViewBoxBtn.addEventListener("click", closeEventViewBox, false);
  inputEventCnt.addEventListener("change", setEventDates, false);
  selectElem.addEventListener('change', userNameFilter, false);
  paginationCtnr.addEventListener('click', onPaginationBtnClick, false);
}

function initCalendar() {
    let calendarEl = $('#calendar')[0];

    calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      initialDate: new Date(),
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      events: [],
      eventClick: function(info) {
        let id = info.event.id;
        let result = classEvents.find(obj => obj.event_id == id);

        $('#_classNm').val(result.class_name);
        $('#_userNm').val(result.user_name);
        $('#_date').val(result.date);
        $('#_start-time').val(result.start_time);
        $('#_end-time').val(result.end_time);

        showEventViewBox();
      },
      eventBackgroundColor: '#a11e12',
      eventBorderColor: '#ed6a5e',
      eventTimeFormat: {
        hour: 'numeric',
        minute: '2-digit',
        omitZeroMinute: true,
        hour12: false
      },
      locale: 'ja',
    });
  
    calendar.render();
}

function load() {
  if(userId != null) {
    mrgelo.core.ajaxSend('getNewApplyClassSingleInfo', { pt_id: userId, id: classId, service_tp: 'new_apply_class_single_info'});
    if (mrgelo.data.retcode != "000") return;
    classSingleInfo = mrgelo.data.classSingleInfo;
    classEvents = mrgelo.data.classEvents;
    setClassSingleInfo();
  }
}

function setClassSingleInfo() {
  $('.classNm').val(classSingleInfo.class_name);
  $('.userNm').val(classSingleInfo.pu_name);
}

function getURLParameter(sParam){
  var sPageURL = window.location.search.substring(1);
  var sURLVariables = sPageURL.split('&');
  for (var i = 0; i < sURLVariables.length; i++){
    var sParameterName = sURLVariables[i].split('=');
    if (sParameterName[0] == sParam){
      return sParameterName[1];
    }
  }
  return null;
}

function showUnrepeatableBox() {
  document.getElementById('todo-overlay').classList.add('slidedIntoView');
}

function showRepeatableBox() {
  document.getElementById('repeat-register').classList.add('slidedIntoView');
}

function closeUnrepeatableBox() {
  document.getElementById('todo-overlay').classList.remove('slidedIntoView');
}

function closeRepeatableBox() {
  document.getElementById('repeat-register').classList.remove('slidedIntoView');
}

function setEventDates(e) {
  eventCnt = e.target.value;
  let textHtml = '';

  for (let i = 0; i < eventCnt; i++) {
    textHtml += '<span>Date: </span>';
    textHtml += '<input type="date" onkeydown="return false;" id="dateInput'+i+'">';
    textHtml += '<span>Time start: </span>';
    textHtml += '<input type="text" class="time-picker" readonly id="startTime'+i+'">';
    textHtml += '<span>Time end: </span>';
    textHtml += '<input type="text" class="time-picker" readonly id="endTime'+i+'"></input>';
  }

  textHtml += '<span></span>';
  textHtml += '<button onclick="registerClassEvents()">Add</button>';

  registerFormFirst.empty();
  registerFormFirst.append(textHtml);
  $(".time-picker").hunterTimePicker();
}

function registerClassEvents() {
  let arrEvents = new Array();
  let checkDate = new Date();
  checkDate = new Date(checkDate.setMonth(checkDate.getMonth()+3));
  for (let i = 0; i < eventCnt; i++) {
    let objEvents = new Object();
    objEvents.date = $('#dateInput'+i+'').val();
    objEvents.startTime = $('#startTime'+i+'').val();
    objEvents.endTime = $('#endTime'+i+'').val();
    if (objEvents.date == '' || objEvents.startTime == '' || objEvents.endTime == '') {
      alert('Input the date or time!');
      return;
    }
    let endDate = new Date(objEvents.date);
    if (endDate > checkDate) {
      alert('Please select date inside 3 months!');
      return;
    }
    arrEvents.push(objEvents);
  }

  let paramJson = new Object();
  paramJson.service_tp = "class_event_reg";
  paramJson.crud_tp = "c";
  paramJson.pt_id = userId;
  paramJson.user_id = classSingleInfo.pu_id;
  paramJson.user_name = classSingleInfo.pu_name;
  paramJson.class_id = classSingleInfo.class_id;
  paramJson.class_name = classSingleInfo.class_name;
  paramJson.arrEvents = arrEvents;

  closeUnrepeatableBox();
  mrgelo.core.ajaxSend('classEventReg', paramJson);
  clearTable();
  currentPage = 1;
  totalPage = 0;
  classEvents = mrgelo.data.updateEvents.classEvents;
  mrgelo.data.classEvents = classEvents;
  renderRows(classEvents);
  updateSelectOption();
  registerFormFirst.empty();
  $('#evnt-cnt').val($("#event-cnt option:first").val());
}

function registerRepeatClassEvents() {
  let daysSelected = new Array();
  let arrEvents = new Array();
  $('input[name="_week-days"]:checked').each(function() {
    daysSelected.push(parseInt(this.value));
    $(this).prop('checked', false);
  });

  if(daysSelected.length == 0) {
    alert('Please insert days of week!');
    return;
  }

  const startDate = new Date($('#start-date').val());
  const endDate = new Date($('#end-date').val());
  if (isNaN(startDate) || isNaN(endDate)) {
    alert('Please insert dates!');
    return;
  }

  let checkDate = new Date();
  checkDate = new Date(checkDate.setMonth(checkDate.getMonth()+3));
  if (endDate > checkDate) {
    alert('Please select date inside 3 months!');
    return;
  }

  const startTime = $('#start-time').val();
  const endTime = $('#end-time').val();
  if (startTime == '' || endTime == '') {
    alert('Please insert times!');
    return;
  }

  while (startDate <= endDate) {

    if (daysSelected.includes(startDate.getDay())) {
      let objEvents = new Object();
      objEvents.date = startDate.getFullYear() + "-" + ('0' + (startDate.getMonth() + 1)).slice(-2) + "-" + ('0' + startDate.getDate()).slice(-2);
      objEvents.startTime = startTime;
      objEvents.endTime = endTime;
      arrEvents.push(objEvents);
    }

    startDate.setDate(startDate.getDate() + 1);
  }

  let paramJson = new Object();
  paramJson.service_tp = "class_event_reg";
  paramJson.crud_tp = "c";
  paramJson.pt_id = userId;
  paramJson.user_id = classSingleInfo.pu_id;
  paramJson.user_name = classSingleInfo.pu_name;
  paramJson.class_id = classSingleInfo.class_id;
  paramJson.class_name = classSingleInfo.class_name;
  paramJson.arrEvents = arrEvents;

  closeRepeatableBox();
  mrgelo.core.ajaxSend('classEventReg', paramJson);
  clearTable();
  currentPage = 1;
  totalPage = 0;
  classEvents = mrgelo.data.updateEvents.classEvents;
  mrgelo.data.classEvents = classEvents;
  renderRows(classEvents);
  updateSelectOption();
  $('#start-date').val('');
  $('#end-date').val('');
  $('#start-time').val('');
  $('#end-time').val('');
}

function renderRows(classEventsArr) {
  classEventsArr.forEach(obj => {
    addEvent({
      id: obj.event_id,
      title: obj.user_name,
      start: obj.date+'T'+obj.start_time,
      end: obj.date+'T'+obj.end_time
    });
  });

  renderPageNumbers(classEventsArr);
  currentPage = currentPage > totalPage ? totalPage : currentPage;
  
  let slicedArr = classEventsArr.slice(itemsPerPage * (currentPage - 1), itemsPerPage * currentPage);

  slicedArr.forEach(eventObj => {
    renderRow(eventObj);
  });
}

function renderRow(obj) {
  // add a new row
  let trElem = document.createElement("tr");
  todoTable.appendChild(trElem);

  // class name cell
  let tdElem2 = document.createElement("td");
  tdElem2.innerText = obj.class_name;
  trElem.appendChild(tdElem2);

  // date cell
  let dateElem = document.createElement("td");
  let dateObj = new Date(obj.date);
  let formattedDate = dateObj.toLocaleString('en-GB', {
    month: 'long',
    day: 'numeric',
    year: 'numeric'
  });
  dateElem.innerText = formattedDate;
  trElem.appendChild(dateElem);

  // start time cell
  let startTimeElem = document.createElement("td");
  startTimeElem.innerText = obj.start_time;
  trElem.appendChild(startTimeElem);

  // end time cell
  let endTimeElem = document.createElement("td");
  endTimeElem.innerText = obj.end_time;
  trElem.appendChild(endTimeElem);

  // user name cell
  let tdElem3 = document.createElement("td");
  tdElem3.innerText = obj.user_name;
  tdElem3.className = 'categoryCell';
  trElem.appendChild(tdElem3);

  // delete cell
  let spanElem = document.createElement("span");
  spanElem.innerText = "delete";
  spanElem.className = "material-icons";
  spanElem.addEventListener("click", deleteEvent, false);
  spanElem.dataset.id = obj.event_id;
  let tdElem4 = document.createElement("td");
  tdElem4.appendChild(spanElem);
  trElem.appendChild(tdElem4);

  function deleteEvent() {

    let paramJson = new Object();
    paramJson.service_tp = "class_event_reg";
    paramJson.crud_tp = "d";
    paramJson.pt_id = userId;
    paramJson.event_id = this.dataset.id;

    mrgelo.core.ajaxSend('classEventReg', paramJson);
    clearTable();
    currentPage = 1;
    totalPage = 0;
    classEvents = mrgelo.data.updateEvents.classEvents;
    mrgelo.data.classEvents = classEvents;
    renderRows(classEvents);
    updateSelectOption();
  }
}

function addEvent(event) {
  calendar.addEvent(event);
}

function showEventViewBox() {
  document.getElementById('class-event-view').classList.add('slidedIntoView');
}

function closeEventViewBox() {
  document.getElementById('class-event-view').classList.remove('slidedIntoView');
}

function updateSelectOption() {
  let options = [];

  classEvents.forEach((obj) =>{
    options.push(obj.user_name);
  });

  let optionSet = new Set(options);

  // empty the select options
  selectElem.innerHTML = '';

  let newOptionElem = document.createElement('option');
  newOptionElem.value = DEFAULT_OPTION;
  newOptionElem.innerText = DEFAULT_OPTION;
  selectElem.appendChild(newOptionElem);
  
  for (let option of optionSet) {
    let newOptionElem = document.createElement('option');
    newOptionElem.value = option;
    newOptionElem.innerText = option;
    selectElem.appendChild(newOptionElem);     
  }

}

function userNameFilter() {
  clearTable();

  if (selectElem.value == DEFAULT_OPTION) renderRows(classEvents);
  else {
    let filteredEventsArr = classEvents.filter(obj => obj.user_name == selectElem.value);
    renderRows(filteredEventsArr);
  }
}

function clearTable() {
  let trElems = classTable.getElementsByTagName('tr');
  for (let i = trElems.length - 1; i > 0; i--) {
    trElems[i].remove(); 
  }

  calendar.getEvents().forEach(event=>event.remove());
}

function renderPageNumbers(arr) {
  let numberOfItems = arr.length;
  totalPage = Math.ceil(numberOfItems / itemsPerPage);

  let pageNumberDiv = document.querySelector(".pagination-pages");

  pageNumberDiv.innerHTML = '<span class="material-icons chevron" data-pagination="firstPage">first_page</span>';
  
  if(currentPage != 1)
    pageNumberDiv.innerHTML += '<span class="material-icons chevron" data-pagination="prev">chevron_left</span>';

  if(totalPage > 0){
    for(let i = 1; i <= totalPage; i++) {
      pageNumberDiv.innerHTML += '<span data-pagination="pageNum">'+ i +'</span>';
    }
  }
  
  if(currentPage != totalPage)
    pageNumberDiv.innerHTML += '<span class="material-icons chevron" data-pagination="next">chevron_right</span>';

    pageNumberDiv.innerHTML += '<span class="material-icons chevron" data-pagination="lastPage">last_page</span>';
}

function onPaginationBtnClick(event) {
  switch (event.target.dataset.pagination) {
    case 'pageNum':
      currentPage = Number(event.target.innerText);
      break;
    case 'prev':
      currentPage = currentPage == 1 ? currentPage : currentPage - 1;
      break;
    case 'next':
      currentPage = currentPage == totalPage ? totalPage : currentPage + 1;
      break;
    case 'firstPage':
      currentPage = 1;
      break;
    case 'lastPage':
      currentPage = totalPage;
      break;
  }
  userNameFilter();
}

