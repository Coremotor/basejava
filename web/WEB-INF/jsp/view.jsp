<%@ page import="com.urise.webapp.model.ListSection" %>
<%@ page import="com.urise.webapp.model.TextSection" %>
<%@ page import="com.urise.webapp.model.CompanySection" %>
<%@ page import="com.urise.webapp.util.HtmlUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <jsp:useBean id="resume" type="com.urise.webapp.model.Resume" scope="request"/>
    <title>Резюме ${resume.fullName}</title>
</head>
<body>
<div class="wrapper">
    <jsp:include page="fragments/header.jsp"/>
    <div class="content">
        <section>
            <h1>${resume.fullName}&nbsp;<a href="resume?uuid=${resume.uuid}&action=edit"><img src="img/pencil.png"></a>
            </h1>
            <c:forEach var="contactEntry" items="${resume.contacts}">
                <jsp:useBean id="contactEntry"
                             type="java.util.Map.Entry<com.urise.webapp.model.ContactsType, java.lang.String>"/>
                <%=contactEntry.getKey().toHtml(contactEntry.getValue())%><br/>
            </c:forEach>
            <table cellpadding="2">
                <c:forEach var="sectionEntry" items="${resume.sections}">
                    <jsp:useBean id="sectionEntry"
                                 type="java.util.Map.Entry<com.urise.webapp.model.SectionsType, com.urise.webapp.model.Section>"/>
                    <c:set var="type" value="${sectionEntry.key}"/>
                    <c:set var="section" value="${sectionEntry.value}"/>
                    <jsp:useBean id="section" type="com.urise.webapp.model.Section"/>
                    <tr>
                        <td colspan="2"><h2><a name="type.name">${type.title}</a></h2></td>
                    </tr>
                    <c:choose>
                        <c:when test="${type=='OBJECTIVE' || type=='PERSONAL'}">
                            <tr>
                                <td colspan="2">
                                    <%=((TextSection) section).getContent()%>
                                </td>
                            </tr>
                        </c:when>
                        <c:when test="${type=='QUALIFICATIONS' || type=='ACHIEVEMENT'}">
                            <tr>
                                <td colspan="2">
                                    <ul>
                                        <c:forEach var="item" items="<%=((ListSection) section).getSections()%>">
                                            <li>${item}</li>
                                        </c:forEach>
                                    </ul>
                                </td>
                            </tr>
                        </c:when>
                        <c:when test="${type=='EXPERIENCE' || type=='EDUCATION'}">
                            <c:forEach var="org" items="<%=((CompanySection) section).getCompanies()%>">
                                <tr>
                                    <td colspan="2">
                                        <c:choose>
                                            <c:when test="${empty org.website}">
                                                <h3>${org.name}</h3>
                                            </c:when>
                                            <c:otherwise>
                                                <h3><a href="${org.website}">${org.name}</a></h3>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                <c:forEach var="periods" items="${org.periods}">
                                    <jsp:useBean id="periods" type="com.urise.webapp.model.Company.Period"/>
                                    <tr>
                                        <td width="15%" style="vertical-align: top"><%=HtmlUtil.formatDates(periods)%>
                                        </td>
                                        <td><b>${periods.title}</b><br>${periods.description}</td>
                                    </tr>
                                </c:forEach>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </table>
            <br/>
            <button onclick="window.history.back()">ОК</button>
        </section>
    </div>
    <jsp:include page="fragments/footer.jsp"/>
</div>
</body>
</html>
