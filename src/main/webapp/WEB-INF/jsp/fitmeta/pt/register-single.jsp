<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />


<%
String user_id		= (String)session.getAttribute("user_id");
%>


<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Fit-meta</title>
  <meta name="description" content="Fit meta Gym Club!">
  <link href="${projectPath}/css/register-single.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="${projectPath}/css/fullcalendar/main.min.css" rel="stylesheet">
  <link href="${projectPath}/css/timePicker.css" rel="stylesheet">
  <style>
     .tt_custom_sm{
        overflow-y: scroll !important;
        max-height: 128%;
      } 
  </style>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="${projectPath}/js/jquery-timepicker.js"></script>
  <script src="${projectPath}/js/fullcalendar/main.min.js" defer></script>
  <script type="text/javascript">
    <% if(user_id != null) { %>
      window.SESSION_USER_INFO = {
        user_id: 		'<%=user_id%>'
      };
    <% } %>
  </script>
  <script src="${projectPath}/js/dev.mrgelo.js?1.1" defer></script>
  <script src="${projectPath}/js/pt/register-single.js" defer></script>
</head>

<body>
    <h3>Elmu's To-do List</h3>
    <div class="todo-grid-parent">
      <div>
        <div class="todo-input todo-block block-border">
          <span>Name Of Class: </span>
          <input type="text" readonly class="classNm">
          <span>Name Of User: </span>
          <input type="text" readonly class="userNm">
          <button id="unrepeatable">Apply For unrepeatable Date</button>
          <button id="repeatable">Apply For repeatable Date</button>
        </div>
  
        <div class="todo-block todoTable-block block-border">
          <table id="todoTable">
            <tr>
              <td>Class Name</td>
              <td>Date</td>
              <td>Start-Time</td>
              <td>End-Time</td>
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
  
      <div class="todo-calendar todo-block block-border">
        <div id="calendar"></div>
      </div>
    </div>
    
    <div class="todo-overlay" id="todo-overlay">
      <div id="todo-modal" class="todo-modal tt_custom_sm">
        <div class="todo-input todo-block">
          <span>Name Of Class: </span>
          <input type="text" readonly class="classNm">
          <span>Name Of User: </span>
          <input type="text" readonly class="userNm">
          <span>Event Counts</span>
          <select id="evnt-cnt">
            <option>0</option>
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
            <option>6</option>
            <option>7</option>
            <option>8</option>
            <option>9</option>
            <option>10</option>
            <option>11</option>
            <option>12</option>
          </select>
          <span></span>
          <div class="todo-input todo-block" id="register-form-1"></div>
        </div>
      </div>
      <div class="todo-modal-close-btn" id="todo-modal-close-btn">X</div>
    </div>


    <div class="class-event-view" id="class-event-view">
      <div id="todo-modal" class="todo-modal">
        <div class="todo-input todo-block">
          <span>Name Of Class: </span>
          <input type="text" readonly id="_classNm">
          <span>Name Of User: </span>
          <input type="text" readonly id="_userNm">
          <span>Date: </span>
          <input type="text" readonly id="_date">
          <span>Start Time: </span>
          <input type="text" readonly id="_start-time">
          <span>End Time: </span>
          <input type="text" readonly id="_end-time">
        </div>
      </div>
      <div class="todo-modal-close-btn" id="event-view-btn">X</div>
    </div>
    
    
  </body>


</html>