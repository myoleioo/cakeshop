<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
   <link rel="stylesheet" href="<c:url value ="https://cdn.datatables.net/2.0.5/css/dataTables.dataTables.css" />">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
   
      <style>
        td {
            height: 50px;
        }

        .scrollable-table {
            max-height: 300px; 
            overflow-y: auto;
        }
    </style>
</head>
<jsp:include page="header.jsp" />
  <div style="margin-top:50px;height:100vh; background-color:#fdf3ea;">
  <span>${delSuccess}</span>
        
        <div class="scrollable-table">
            <table class="table table-striped" id="table">
                <thead>
                    <tr>
                    	
                        <th scope="col">Id</th>
                        <th scope="col">OrderDate</th>
                        <th scope="col">CustomerId</th>
                        <th scope="col">ProductId</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Address</th>
                        <th scope="col">TotalAmount</th>
                        <th scope="col">CheckedPayment</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${lstUser}" var="user" varStatus="index">
                        <tr>
                            <td scope="row">${index.count}</td>
                            <td>${user.prefix}${user.userId}</td>
                            <td>${user.userName}</td>
                            <td>${user.userEmail}</td>
                            
                            <td>${user.userRole}</td>
                            <td>
               
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   <script src="https://cdn.datatables.net/2.0.5/js/dataTables.js"></script>
  <script>
    $(document).ready(function() {
      const dataTable = $("#table").DataTable({
        "lengthMenu" : [ 3, 5, 10 ],
        "pageLength" : 5,
      });

    });
  </script>
</body>
</html>