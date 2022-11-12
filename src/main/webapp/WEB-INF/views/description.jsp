<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Edit</title>

    <style><%@include file="../css/main.css"%></style>

    <script>
        var currentId = location.pathname.split("/").filter(element => element).at(-1);
    </script>

    <script><%@include file="../js/workers.js"%></script>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

</head>
<body>

<%@include file="include/header.jsp"%>

<div class="mainContainer p-3">

    <h3>Изменение номера</h3>
    <hr>

    <label for="number">Phone number</label>
    <input type="text" class="form-control" id="number" aria-describedby="emailHelp" value=${phone.getNumber()}>
    <br>
    <c:if test="${phone.getIsHidden()}">
        <input type="checkbox" style="margin-left: 10px" class="form-check-input" id="isHidden" checked>
    </c:if>
    <c:if test="${!phone.getIsHidden()}">
        <input type="checkbox" style="margin-left: 10px" class="form-check-input" id="isHidden">
    </c:if>
    <label class="form-check-label" style="margin-left: 10px" for="isHidden">Internal number</label>

    <br>
    <br>

    <button class="btn btn-primary" onclick="putRequest()">Submit edit</button>

        <div class="p-2">Владельцы номера:</div>

    <table class="owners iksweb">
        <tr class="example-owner">
            <td>ФИО</td>
            <td>Почта</td>
            <td>Должность</td>
            <td>Отдел</td>
            <td style="width: 50px">Действие</td>
        </tr>
        <c:forEach var="owner" items="${phone.getOwners()}" varStatus="status">
            <tr id="${owner.getId()}" class="owner">
                <td>
                    <c:out value="${owner.getName()}"></c:out>
                </td>
                <td>
                    <c:out value="${owner.getEmail()}"></c:out>
                </td>
                <td>
                    <c:out value="${owner.getPosition()}"></c:out>
                </td>
                <td>
                    <c:out value="${owner.getDepartment()}"></c:out>
                </td>
                <td style="text-align: center; width: 50px;">
                    <button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top"
                            title="Delete" onclick=${"deleteFromOwners(".concat(owner.getId()).concat(")")}>
                        <i class="fa fa-trash"></i>
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>


    <div class="dropdown">
        <input type="text" placeholder="ФИО нового работника" class="search" oninput="changeSearch()"/>
        <div class="dropdown-menu">
            <div id="0" class="dropdown-item drop-worker-example" href="#" style="display: none"> Submenu item 0</div>
        </div>
    </div>

</div>
</body>
</html>
