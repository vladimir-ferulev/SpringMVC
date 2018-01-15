<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%--
  Created by IntelliJ IDEA.
  User: vladimir
  Date: 1/14/18
  Time: 7:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users list</title>
</head>
<body>
<a href="../../">Main page</a>
<br/>
<h2>Users</h2>

<jstl:if test="${!empty listUsers}">
    <table class="table1">
        <tr>
            <th width="80">id</th>
            <th width="120">firstname</th>
            <th width="120">lastname</th>
            <th width="60">age</th>
            <th width="60">edit</th>
            <th width="60">delete</th>
        </tr>
        <jstl:forEach items="${listUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td><a href="/userdata/${user.id}" target="_blank">${user.firstName}</a></td>
                <td>${user.lastName}</td>
                <td>${user.age}</td>
                <td><a href="<jstl:url value='/edit/${user.id}'/>">edit</a></td>
                <td><a href="<jstl:url value='/remove/${user.id}'/> ">delete</a></td>
            </tr>
        </jstl:forEach>
    </table>
</jstl:if>

<br/>
<br/>
<h2>Add new user</h2>

<jstl:url var="add" value="/users/add"/>

<form:form action="${add}" commandName="user">
    <table>
        <jstl:if test="${!empty user.lastName}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="id"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disable="true"/>
                </td>
            </tr>
        </jstl:if>
        <tr>
            <td>
                <form:label path="firstName">
                    <spring:message text="First name"/>
                </form:label>
            </td>
            <td>
                <form:input path="firstName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="lastName">
                    <spring:message text="Last name"/>
                </form:label>
            </td>
            <td>
                <form:input path="lastName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="Age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <jstl:if test="${!empty user.firstName}">
                    <input type="submit" value="<spring:message text="Edit user"/> "/>
                </jstl:if>
                <jstl:if test="${empty user.firstName}">
                    <input type="submit" value="<spring:message text="Add user"/>"/>
                </jstl:if>

            </td>
        </tr>

    </table>
</form:form>
</body>
</html>
