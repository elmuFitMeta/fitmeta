<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Fit-meta</title>
  <meta name="description" content="Fit meta Gym Club!">
  <link href="${projectPath}/css/to-do.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="${projectPath}/css/fullcalendar/main.min.css" rel="stylesheet">
  <link href="${projectPath}/css/timePicker.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="${projectPath}/js/jquery-timepicker.js"></script>
  <script src="${projectPath}/js/fullcalendar/main.min.js" defer></script>
  <script src="${projectPath}/js/main/todo.js" defer></script>
</head>
<body>
  <h3>Elmu's To-do List</h3>
  <div class="todo-grid-parent">
    <div>
      <div class="todo-input todo-block">
        <span>To-do: </span>
        <input type="text" placeholder="Enter new to-do">
        <span>Category: </span>
        <input type="text" placeholder="Enter category" list="categoryList">
        <datalist id="categoryList">
          <option value="Personal"></option>
          <option value="Work"></option>
        </datalist>
        <span>Date: </span>
        <input type="date" onkeydown="return false" id="dateInput">
        <span>Time start: </span>
        <input type="text" class="time-picker" readonly id="timeStart">
        <span>Time end: </span>
        <input type="text" class="time-picker" readonly id="timeEnd">
        <span></span>
        <button id="addBtn">Add</button>
        <span></span>
        <button id="sortBtn">Sort by Date</button>
        <span></span>
        <button id="open-modal-box">Get Modal Box</button>
        <span></span>
        <label for=""><input type="checkbox" id="shortlistBtn"> Incomplete First</label>
      </div>

      <div class="todo-block todoTable-block">
        <table id="todoTable">
          <tr>
            <td></td>
            <td>Date</td>
            <td>Time</td>
            <td>to-do</td>
            <td>
              <select id="categoryFilter">
              </select>
            </td>
            <td></td>
          </tr>
        </table>
        <div class="pagination-pages">
        </div>
      </div>
    </div>

    <div class="todo-calendar todo-block">
      <div id="calendar"></div>
    </div>
  </div>
  
  <div class="todo-overlay" id="todo-overlay">
    <div id="todo-modal" class="todo-modal">
      <div class="todo-input todo-block">
        <span>To-do: </span>
        <input id="class-nm" type="text" placeholder="Enter new to-do">
        <span>Category: </span>
        <input id="user-nm" type="text" placeholder="Enter category" list="categoryList">
        <datalist id="categoryList">
          <option value="Personal"></option>
          <option value="Work"></option>
        </datalist>
        <span>Date: </span>
        <input id="_date" type="date">
        <span>Time: </span>
        <input id="_time" type="time">
        <span></span>
        <button id="changeBtn">Add</button>
      </div>
    </div>
    <div class="todo-modal-close-btn" id="todo-modal-close-btn">X</div>
  </div>
  
  
</body>
</html>