<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="utf-8">
    <title>Search</title>

    <style><%@include file="../css/main.css"%></style>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

</head>
<body>

    <%@include file="include/header.jsp" %>

    <div class="p-3">

        <h3 id="tabledesc">Поиск</h3>
        <hr>
        <div class="mainContainer p-3">

    <form method="get" action="/search">

        <div class="form-group row">
        <label for="FIO" class="col-sm-1 col-form-label">ФИО:</label>
        <div class="col-sm-7">
            <input type="text" name="name" id="FIO" class="form-control" value='' />
        </div>
        </div>


        <div class="form-group row">
            <label for="number" class="col-sm-1 col-form-label">Номер:</label>
            <div class="col-sm-7">
                <input type="text" name="phone" id="number" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label for="mail" class="col-sm-1 col-form-label">Почта:</label>
            <div class="col-sm-7">
                <input type="text" name="mail" id="mail" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="position" class="col-sm-1 col-form-label">Должность:</label>
            <div class="col-sm-7">
                <input type="text" name="position" id="position" class="form-control"/>
            </div>
        </div>


        <div class="form-group row">
            <label for="department" class="col-sm-1 col-form-label">Отдел:</label>
            <div class="col-sm-7">
                <input type="text" name="department" id="department" class="form-control"/>
            </div>
        </div>

        <input class="btn btn-primary" type="submit" value="Search">
    </form>
    <br>

    <table class="iksweb" aria-describedby="tabledesc">
        <thead>
        <tr>
            <th>Номер</th>
            <th>ФИО</th>
            <th>Почта</th>
            <th>Позиция</th>
            <th>Отдел</th>
        </tr>
        </thead>
        <c:forEach var="phone" items="${phones}" varStatus="status">
            <tbody>
            <c:forEach var="owner" items="${phone.getOwners()}">
                <tr>
                    <c:if test="${phone.getOwners().get(0).equals(owner)}">
                        <td rowspan="${phone.getOwners().size()}">
                            <c:out value="${phone.getNumber()}"></c:out>
                        </td>
                    </c:if>
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
                </tr>
            </c:forEach>
        </tbody>
        </c:forEach>
    </table>

        </div>
    </div>
</body>
</html>