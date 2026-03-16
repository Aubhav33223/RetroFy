<%@page import="java.util.Base64"%>
<%@page import="com.cashify.servlet_cashify_project.dao.OldPhoneDao"%>
<%@page import="com.cashify.servlet_cashify_project.dto.OldPhone"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Old Phones List</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        img {
            max-width: 100px;
            height: auto;
        }

        .verify-form select {
            padding: 4px;
        }

        .verify-form input[type="submit"] {
            padding: 4px 8px;
        }
    </style>
</head>
<body>
<jsp:include page="admin-navbar.jsp"></jsp:include>
<h4>User-Product-Details</h4>
<table border="2">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Brand</th>
        <th>Model</th>
        <th>Storage</th>
        <th>Condition</th>
        <th>Expected Price</th>
        <th>Comments</th>
        <th>Image</th>
        <th>Verification</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<OldPhone> phones = new OldPhoneDao().getAllOldPhones();
       
    	if(!phones.isEmpty()){
            for (OldPhone phone : phones) {
    %>
    <tr>
        <td><%= phone.getId() %></td>
        <td><%= phone.getName() %></td>
        <td><%= phone.getEmail() %></td>
        <td><%= phone.getPhone() %></td>
        <td><%= phone.getBrand() %></td>
        <td><%= phone.getModel() %></td>
        <td><%= phone.getStorage() %></td>
        <td><%= phone.getCondition() %></td>
        <td><%= phone.getExpectedprice() %></td>
        <td><%= phone.getComments() %></td>
        <td>
            <%
                byte[] imageBytes = phone.getImage();
                if (imageBytes != null && imageBytes.length > 0) {
                    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            %>
                    <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Phone Image"/>
            <%
                } else {
            %>
                    No Image
            <%
                }
            %>
        </td>
        <td>
            <form class="verify-form" method="post" action="verifyOldPhone">
                <input type="hidden" name="id" value="<%= phone.getId() %>"/>
                <select name="verification">
                    <option value="Yes" <%= "Yes".equals(phone.getVerification()) ? "selected" : "" %>>Yes</option>
                    <option value="No" <%= "No".equals(phone.getVerification()) ? "selected" : "" %>>No</option>
                </select>
                <input type="submit" value="Update"/>
            </form>
        </td>
    </tr>
    <%
     }}else{
    %>
    <tr>
        <td colspan="12">No records found.</td>
    </tr>
    <%}%>
    </tbody>
</table>

</body>
</html>