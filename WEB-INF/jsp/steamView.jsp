<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%
if(session.getAttribute("loggedInUser") == null)
response.sendRedirect("login");
%>

<!doctype html>
<html class="no-js" lang="en">

<head>
<jsp:include page="header.jsp" />    
</head>

<body>
   
    <!-- Start Left menu area -->
   <jsp:include page="topPage.jsp" />
   
        <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                        <h4>Notifications</h4>
                            <!-- <a href="paidPayments?gender=all"><button type="button" class="btn btn-info" id="myBtn">Male Trainer</button></a>&nbsp;&nbsp;
                            <a href="paidPayments?gender=male"><button type="button" class="btn btn-info" id="myBtn">Female Trainer</button></a>&nbsp;&nbsp; -->
                            <div class="asset-inner">
                                <%-- <table>
                                    <tr>
                                        <th>Trainer</th>
                                        <th>Activity</th>
                                        <th>Member Name</th>
                                        <th>Date</th>
                                        <th>Amount</th>                                        
                                        <th>Discard</th>                                                                                
                                    </tr>
                                    
                                    <c:forEach items="${notificationsList}" var="notiData" varStatus="status">
                                    <tr>
                                    	
                                    	<td><c:out value="${notiData.trainer}"/></td>
                                    	<td><c:out value="${notiData.activity}"/></td>  
                                        <td>
                                        <a href="<c:url value='clientProfile?cliendId=${notiData.clientId}&gender=${notiData.clientGender}'/>">
                                        <c:out value="${notiData.memberName}"/>
                                        </a>
                                        </td>
                                        <td><c:out value="${notiData.activityDate}"/></td>
                                        <td><c:out value="${notiData.amount}"/></td>      
                                        <td>
	                                        <a href="<c:url value='discardNotification?notiId=${notificationsList[status.index].notiId}'/>">
									        	<input class="btn btn-danger btn-xs" type="button" value="Delete" />
									        </a>
                                        </td>                           
                                    </tr>
                                    </c:forEach>
                                    
                                </table> --%>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="copyright.jsp" />
    </div>

     <jsp:include page="bottom_script.jsp" />
</body>
</html>