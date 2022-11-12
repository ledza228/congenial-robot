<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <style><%@include file="../css/main.css"%></style>

        <script>
            function deletePhone(id){
                fetch("/api/admin/phone/"+id, {
                    method: 'Delete',
                }).catch(e => {
                    console.log(e);
                    alert("Delete error")
                }).then(c => {
                    location.reload()
                });
            }
        </script>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    </head>
    <body>

    <%@include file="include/header.jsp"%>

    <div class="p-3">
    <h3>Admin panel</h3>
        <hr>

        <div>
        <a href="/admin/phone/" class="p-3"><button type="button" class="btn btn-success">Add phone</button></a>
        <div class="mainContainer p-3">
        <table class="iksweb">
            <thead>
            <tr>
                <th>Номер</th>
                <th>ФИО</th>
                <th>Почта</td>
                <th>Должность</th>
                <th>Отдел</th>
                <th>Действие</th>
            </tr>
            </thead>
            <c:forEach var="phone" items="${phones}" varStatus="status">
                <tbody>
                <c:if test="${phone.getOwners().size() == 0}">
                    <tr>
                        <td>
                            <c:if test="${phone.getIsHidden()}">
                                <span class="badge badge-primary">private</span>
                                <br>
                            </c:if>
                            <span>
                                <c:out value="${phone.getNumber()}"></c:out>
                            </span>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td rowspan="${phone.getOwners().size()}">

                            <div style="text-align: center">
                                <a href=${"/admin/phone/".concat(phone.getPhoneId())}>
                                    <button class="btn btn-success btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" title="Edit"><em class="fa fa-edit"></em></button>
                                </a>

                                <button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="tooltip"
                                        data-placement="top" title="Delete" onclick="deletePhone(${phone.getPhoneId()})"><em class="fa fa-trash"></em></button>
                            </div>

                        </td>

                    </tr>
                </c:if>
                <c:forEach var="owner" items="${phone.getOwners()}">
                    <tr>
                        <c:if test="${phone.getOwners().get(0).equals(owner)}">
                            <td rowspan="${phone.getOwners().size()}">
                                <c:if test="${phone.getIsHidden()}">
                                    <span class="badge badge-primary">private</span>
                                    <br>
                                </c:if>
                                <span>
                                    <c:out value="${phone.getNumber()}"></c:out>
                                </span>
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
                        <c:if test="${phone.getOwners().get(0).equals(owner)}">
                            <td rowspan="${phone.getOwners().size()}">

                            <div style="text-align: center">
                                <a href=${"/admin/phone/".concat(phone.getPhoneId())}>
                                    <button class="btn btn-success btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-edit"></i></button>
                                </a>

                            <button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="tooltip"
                                    data-placement="top" title="Delete" onclick="deletePhone(${phone.getPhoneId()})"><i class="fa fa-trash"></i></button>
                            </div>

                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </c:forEach>
        </table>
    </div>
    </div>
    </div>
    </body>
</html>
