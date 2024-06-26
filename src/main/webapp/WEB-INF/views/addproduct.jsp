<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

	<link href="<c:url value="/resources/css/product.css" />" rel="stylesheet">

<style>
    #error{color:red;margin-left: 200px;};
    #success{color:#f08632;margin-left: 200px;};
</style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div class="center-form">
        <h2 class="center-text">Add Product</h2>
        <c:if test="${not empty error}">
			<span id="error">${error}</span>
		</c:if>
		<c:if test="${not empty success}">
			<span id="success" style="color:#f08632;margin-left: 200px;">${success}</span>
		</c:if>
        <form:form action="createproduct" method="post" modelAttribute="pbean" enctype="multipart/form-data" id="productForm">
            <div class="form-group">
                <label for="userName" class="form-label">Name:</label>
                <form:input type="text" path="productName" id="productname" class="form-control d-inline-block" style="width: calc(100% - 120px);" />
                <span id="productError"  class="error" style="margin-left: 150px;color:red;"></span>
            </div>
            <div class="form-group">
                <label for="userName" class="form-label">Description:</label>
                <form:input type="text" path="description" id="description" class="form-control d-inline-block" style="width: calc(100% - 120px);" />
                <span id="descriptionError"  class="error" style="margin-left: 150px;color:red;"></span>
            </div>
            <div class="form-group">
                <label for="userEmail" class="form-label">Price:</label>
                <form:input type="text" path="price" id="price" class="form-control d-inline-block" style="width: calc(100% - 120px);" />
                <span id="priceError"  class="error" style="margin-left: 150px;color:red;"></span>
            </div>
            <div class="form-group">
                <label for="userEmail" class="form-label">Photo:</label>
            	<div class="file-upload">
				<!-- Container for uploading files -->
					<div class="image-upload-wrap">
						<!-- Input field for selecting files -->
							<form:input type="file" path="file" id="file"	class="file-upload-input" onchange="readURL(this);" />
									<!-- Text displayed when no file is selected -->
								<div class="drag-text">
									<h3 style="font-size:20px;">Choose product picture</h3>
								</div>
					</div>

					<!-- Container for displaying uploaded files -->
					<div class="file-upload-content">
					<!-- Placeholder for displaying the uploaded image -->
						<img class="file-upload-image" src="#" alt="your image" />
					<!-- Container for the title and remove button of the uploaded image -->
							<div class="image-title-wrap">
					<!-- Button to remove the uploaded image -->
								<button type="button" onclick="removeUpload()" class="remove-image">Remove</button>
							</div>
					</div>
					<span id="fileError"  class="error" style="margin-left: 80px;color:red;"></span>
				</div>
			</div>
            <div class="p-t-15">
                    <button type="submit" class="btn btn-primary" 
                    style="margin-left:490px;width:90px;height:40px;">Add</button>
             </div>
        </form:form>
    </div>
</div>



<script src="<c:url value="/resources/js/addproduct.js" />"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://kit.fontawesome.com/5bb5a852ac.js"	crossorigin="anonymous"></script>

<script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    document.querySelector('.file-upload-image').src = e.target.result;
                    document.querySelector('.file-upload-content').style.display = 'block';
                    document.querySelector('.image-upload-wrap').style.display = 'none';
                };

                reader.readAsDataURL(input.files[0]);
            } else {
                removeUpload();
            }
        }

        function removeUpload() {
            document.querySelector('.file-upload-input').value = "";
            document.querySelector('.file-upload-content').style.display = 'none';
            document.querySelector('.image-upload-wrap').style.display = 'block';
        }

        document.querySelector('.image-upload-wrap').addEventListener('dragover', function() {
            this.classList.add('image-dropping');
        });
        document.querySelector('.image-upload-wrap').addEventListener('dragleave', function() {
            this.classList.remove('image-dropping');
        });
    </script>

</body>
</html>