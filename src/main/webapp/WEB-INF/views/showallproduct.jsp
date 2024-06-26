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
   
   
      <style>
      
      	table {
            width: 50%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        
        img {
            display: block;
            margin: auto;
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
                        <th scope="col" style="text-align: center;">Id</th>
                        <th scope="col" style="text-align: center;">ProductName</th>
                        <th scope="col" style="text-align: center;">Description</th>
                        <th scope="col" style="text-align: center;">Price</th>
                        <th scope="col" style="text-align: center;">Photo</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${showallproduct}" var="sap" varStatus="index">
                        <tr>
                            <td scope="row" style="text-align: center;">${index.count}</td>
                            <td style="text-align: center;">${sap.productName}</td>
                            <td style="text-align: center;">${sap.description}</td>
                            <td style="text-align: center;">${sap.price}</td>
                            <td style="text-align: center;">
               					<img src="${pageContext.request.contextPath}/${sap.filePath}" alt="${sap.productName}" width="100">
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