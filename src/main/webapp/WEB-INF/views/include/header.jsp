<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Phonebook</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">

    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/search">Search<span class="sr-only"></span></a>
            </li>
            <security:authorize access="hasRole('ADMIN')">
                <li class="nav-item">
                    <a class="nav-link" href="/admin">Admin panel<span class="sr-only"></span></a>
                </li>
            </security:authorize>
        </ul>
    </div>

    <security:authorize access="!isAuthenticated()">
        <a href="/login"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button></a>
    </security:authorize>


    <security:authorize access="isAuthenticated()">
        <span class="navbar navbar-light bg-light">
            <security:authentication property="principal.username" />
        </span>
        <a href="/logout"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button></a>
    </security:authorize>



    </div>
</nav>
