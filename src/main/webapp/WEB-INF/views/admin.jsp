<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>


<html>
    <head>
        <meta charset="utf-8">
        <title>Admin</title>

        <style>
            table, th, td {
                font-family: Lato-Regular;
                border: 1px solid white;
                border-collapse: collapse;
            }

            table.iksweb{
                width: 100%;
                border-collapse:collapse;
                border-spacing:0;
                height: auto;
            }
            table.iksweb,table.iksweb td, table.iksweb th {
                border: 1px solid #595959;
            }
            table.iksweb td,table.iksweb th {
                padding: 3px;
                width: 30px;
                height: 35px;
            }
            /*table.iksweb th {*/
            /*    background: #ffffff;*/
            /*    color: #fff;*/
            /*    font-weight: normal;*/
            /*}*/


            thead {
                background-color: #6c7ae0;
                color: #fff;
                font-style: italic;
                font-size: 17px;
                text-align: center;
            }

            tbody:nth-child(even) {
                text-align: center;
                background: rgba(255, 255, 255, 0.99);
            }

            tbody:nth-child(odd) {
                text-align: center;
                background: #ecebeb;
            }


        </style>


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
                <td>Номер</td>
                <td>ФИО</td>
                <td>Почта</td>
                <td>Должность</td>
                <td>Отдел</td>
                <td>Действие</td>
            </tr>
            </thead>
            <c:forEach var="phone" items="${phones}" varStatus="status">
                <tbody>
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