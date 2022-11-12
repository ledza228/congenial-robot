<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <style><%@include file="../css/main.css"%></style>

    <script><%@include file="../js/workers.js"%></script>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">


</head>
<body>

<%@include file="include/header.jsp"%>

<div  class="mainContainer p-3">
    <h3>Add Phone</h3>
    <hr>

    <label for="number">Phone number</label>
    <input type="text" class="form-control" id="number" aria-describedby="emailHelp" value=${phone.getNumber()}>
    <br>

    <input type="checkbox" style="margin-left: 10px" class="form-check-input" id="isHidden">
    <label class="form-check-label" style="margin-left: 10px" for="isHidden">Internal number</label>
    <br>
    <br>

    <button class="btn btn-primary" onclick="createPhone()">Create</button>

    <div class="p-2">Владельцы номера:</div>

    <table class="owners iksweb">
        <tr class="example-owner">
            <th>ФИО</th>
            <th>Почта</th>
            <th>Должность</th>
            <th>Отдел</th>
            <th style="width: 50px">Действие</th>
        </tr>
    </table>

    <div class="dropdown">
        <input type="text" placeholder="ФИО работника" class="search" oninput="changeSearch()"/>
        <div class="dropdown-menu">
            <div id="0" class="dropdown-item drop-worker-example" href="#" style="display: none"> Submenu item 0</div>
        </div>
    </div>

</div>
</body>
</html>