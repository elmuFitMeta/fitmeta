onload = todoMain;

function todoMain(){
  const DEFAULT_OPTION = 'ALL';

  let inputElem,
      todoTable,
      inputElem2,
      dateInput,
      timeStart,
      timeEnd,
      addButton,
      sortButton,
      selectElem,
      todoList = [],
      calendar,
      shortlistBtn,
      closeModalBoxBtn,
      showModalBoxBtn,
      paginationCtnr,
      currentPage = 1,
      itemsPerPage = 5,
      totalPage = 0;

  getElements();
  addListeners();
  initCalendar();
  load();
  renderRows(todoList);
  updateSelectOption()

  function getElements(){
    inputElem = document.getElementsByTagName("input")[0];
    inputElem2 = document.getElementsByTagName("input")[1];
    dateInput = document.getElementById("dateInput");
    timeStart = document.getElementById("timeStart");
    timeEnd = document.getElementById("timeEnd");
    addButton = document.getElementById("addBtn");
    sortButton = document.getElementById("sortBtn");
    ulElem = document.getElementsByTagName("ul")[0];
    selectElem = document.getElementById('categoryFilter');
    shortlistBtn = document.getElementById("shortlistBtn");
    closeModalBoxBtn = document.getElementById("todo-modal-close-btn");
    showModalBoxBtn = document.getElementById("open-modal-box");
    todoTable = document.getElementById("todoTable");
    paginationCtnr = document.querySelector('.pagination-pages');

  }

  function addListeners(){
    addButton.addEventListener("click", addEntry, false);
    sortButton.addEventListener("click", sortEntry, false);
    selectElem.addEventListener('change', multipleFilter, false);
    shortlistBtn.addEventListener('change', multipleFilter, false);
    showModalBoxBtn.addEventListener("click", showModalBox, false);
    closeModalBoxBtn.addEventListener("click", closeModalBox, false);
    paginationCtnr.addEventListener('click', onPaginationBtnClick, false);
  }

  function addEntry(event){

    let inputValue = inputElem.value;
    inputElem.value = "";

    let inputValue2 = inputElem2.value;
    inputElem2.value = "";

    let dateValue = dateInput.value;
    dateInput.value = "";

    let timeS = timeStart.value;
    timeStart.value = "";

    let timeE = timeEnd.value;
    timeEnd.value = "";


    let obj = {
      id: _uuid(),
      todo: inputValue,
      category: inputValue2, 
      date: dateValue,
      time: timeS,
      timeEnd: timeE,
      done: false
    };

    renderRow(obj);

    todoList.push(obj);

    save();

    updateSelectOption();

    addEvent({
      id: obj.id,
      title: obj.todo,
      start: obj.date +'T'+ obj.time,
      end: obj.date +'T'+ obj.timeEnd,
      //backgroundColor: (obj.done ? 'green' : '#a11e12'),
    });

  }

  function updateSelectOption() {
    let options = [];

    todoList.forEach((obj) =>{
      options.push(obj.category);
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

  function save() {
    let stringified = JSON.stringify(todoList);
    localStorage.setItem('todoList', stringified);
  }

  function load() {
    let retrieved = localStorage.getItem('todoList');
    todoList = JSON.parse(retrieved);
    if(todoList == null) todoList = [];
	
  }

  function renderRows(arr) {

    arr.forEach(obj => {
      addEvent({
        id: obj.id,
        title: obj.todo,
        start: obj.date +'T'+ obj.time,
        end: obj.date +'T'+ obj.timeEnd,
        //backgroundColor: (obj.done ? 'green' : '#a11e12'),
      });
    });

    renderPageNumbers(arr);
    currentPage = currentPage > totalPage ? totalPage : currentPage;

    let slicedArr = arr.slice(itemsPerPage * (currentPage - 1), itemsPerPage * currentPage);
    slicedArr.forEach(todoObj => {
      renderRow(todoObj);
    });

  }

  function renderRow(obj) {
    
    // add a new row
    let trElem = document.createElement("tr");
    todoTable.appendChild(trElem);

    // checkbox cell
    let checkboxElem = document.createElement("input");
    checkboxElem.type = "checkbox";
    checkboxElem.addEventListener("click", checkClickCallback, false);
    checkboxElem.dataset.id = obj.id;
    let tdElem1 = document.createElement("td");
    tdElem1.appendChild(checkboxElem);
    trElem.appendChild(tdElem1);

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

    // time cell
    let timeElem = document.createElement("td");
    timeElem.innerText = obj.time;
    trElem.appendChild(timeElem);

    // to-do cell
    let tdElem2 = document.createElement("td");
    tdElem2.innerText = obj.todo;
    trElem.appendChild(tdElem2);

    // category cell
    let tdElem3 = document.createElement("td");
    tdElem3.innerText = obj.category;
    tdElem3.className = 'categoryCell';
    trElem.appendChild(tdElem3);

    // delete cell
    let spanElem = document.createElement("span");
    spanElem.innerText = "delete";
    spanElem.className = "material-icons";
    spanElem.addEventListener("click", deleteItem, false);
    spanElem.dataset.id = obj.id;
    let tdElem4 = document.createElement("td");
    tdElem4.appendChild(spanElem);
    trElem.appendChild(tdElem4);

    checkboxElem.type = 'checkbox';
    checkboxElem.checked = obj.done;

    if (obj.done) {
      trElem.classList.add("strike");
    } else {
      trElem.classList.remove("strike");
    }

    function deleteItem(){
      trElem.remove();
      updateSelectOption();

      for (let i = 0; i < todoList.length; i++) {
        if(todoList[i].id == this.dataset.id) {todoList.splice(i, 1);}       
      }
      save();

      // remove from calendar
      calendar.getEventById(this.dataset.id).remove();
    }

    function checkClickCallback(){
      trElem.classList.toggle("strike");
      for (let i = 0; i < todoList.length; i++) {
        if(todoList[i].id == this.dataset.id) {todoList[i].done = this.checked;}       
      }
      save();
    }

  }

  function _uuid() {
    var d = Date.now();
    if (typeof performance !== 'undefined' && typeof performance.now === 'function'){
      d += performance.now(); //use high-precision timer if available
    }
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
      var r = (d + Math.random() * 16) % 16 | 0;
      d = Math.floor(d / 16);
        return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
    });
  }

  function sortEntry() {
    todoList.sort((a, b)=>{
      let aDate = Date.parse(a.date);
      let bDate = Date.parse(b.date);
      return aDate - bDate;
    });

    save();
    clearTable();
    renderRows(todoList);
  }

  function initCalendar() {
    var calendarEl = document.getElementById('calendar');

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
        let result = todoList.find(obj => obj.id == id);

        document.getElementById('class-nm').value = result.todo;
        document.getElementById('user-nm').value = result.category;
        document.getElementById('_date').value = result.date;
        document.getElementById('_time').value = result.time;

        showModalBox();
    
        // change the border color just for fun
        info.el.style.borderColor = 'red';
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

  function addEvent(event) {
    calendar.addEvent(event);
  }

  function clearTable() {

    let trElems = todoTable.getElementsByTagName('tr');
    for (let i = trElems.length - 1; i > 0; i--) {
      trElems[i].remove();
      
    }

    calendar.getEvents().forEach(event=>event.remove());
  }

  function multipleFilter() {
    clearTable();

    if (selectElem.value == DEFAULT_OPTION) {

      if (shortlistBtn.checked) {
        let filteredArray1 = todoList.filter(obj => obj.done == false);
        let filteredArray2 = todoList.filter(obj => obj.done == true);
        let arr = filteredArray1.concat(filteredArray2);
        renderRows(arr);
      } else {
        renderRows(todoList);
      }
    } else {
      let filteredCategoryArray = todoList.filter(obj => obj.category == selectElem.value);
      
      if (shortlistBtn.checked) {
        let filteredIncomplitedArray = filteredCategoryArray.filter(obj => obj.done == false);
        let filteredDoneArray = filteredCategoryArray.filter(obj => obj.done == true);
        let arr = filteredIncomplitedArray.concat(filteredDoneArray);
        renderRows(arr);
      } else {
        renderRows(filteredCategoryArray);
      }
    }
  }

  function showModalBox(event) {
    document.getElementById('todo-overlay').classList.add('slidedIntoView');
  }

  function closeModalBox(event) {
    document.getElementById('todo-overlay').classList.remove('slidedIntoView');
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
    multipleFilter();
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

}

$().ready(function(e) {

  $('#timePicker').hunterTimePicker({
    callback: function(e){
      alert(e.val());
    }
  });
  
  $(".time-picker").hunterTimePicker();
});
































