<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
 integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
  crossorigin="anonymous">

<link rel="stylesheet" href="<c:url value="/resources/css/profile.css"/>" type="text/css">

<link href="<c:url value ="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
 <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>            

<style>

.red-color{
    color:red;
    margin-left: 200px;
    }

</style>

</head>
<body style="background:#5c5c77;">
<c:choose>
	<c:when test="${role == 'Customer'}">
		  <nav class="navbar" style="background-color: #e3f2fd;">
		      <a href="./"><i class="fa-solid fa-house fa-2x"  style="margin-left: 10px;color: #5c5c77"></i></a>
		  </nav>
  	</c:when>
	<c:otherwise>
			<nav class="navbar" style="background-color: #e3f2fd;">
		      <a href="./adminpage"><i class="fa-solid fa-house fa-2x"  style="margin-left: 10px;color: #5c5c77"></i></a>
		  </nav>
	</c:otherwise>
</c:choose>

<section>
	<div class="container emp-profile" style="background-color:#fdf3ea;">
            <form method="post">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog" alt=""/>
                            <div class="file btn btn-lg btn-primary">
                                Change Photo
                                <input type="file" name="file"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h5>
                                        ${name}
                                    </h5>
                                    <h6>
                                        ${role}
                                    </h6>
                                    <p class="proile-rating"> <span></span></p>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab"  role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="col-md-2">
                        <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class="profile-edit-btn" name="btnAddMore">Edit Profile</button>
                    </div>
                    
                </div>
                
                
                <div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content"  style="background:#fdf3ea;">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Edit Your Information</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div><br>
							
							<div class="row g-3 align-items-center">
							  <div class="col-auto">
							    <label for="inputPassword6" class="col-form-label" style="margin-left: 50px;">Name :</label>
							  </div>
							  <div class="col-auto">
							    <input type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
							  </div>
							</div><br>
							
							<div class="row g-3 align-items-center">
							  <div class="col-auto">
							    <label for="inputPassword6" class="col-form-label" style="margin-left: 50px;">Email :</label>
							  </div>
							  <div class="col-auto">
							    <input type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
							  </div>
							</div><br>
							<div class="col text-center">
								<button type="submit" id="submitbtn" class="btn btn-primary" style="background:#f08632;border-color:#f08632;">Save</button>
							</div><br>

						</div>
					</div>
				</div>

                
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                        	<a href="#myModal" class="btn btn-danger"
                    			data-toggle="modal" role="button">Logout</a>
                        </div>
                    </div>
                    
                    <div id="myModal" class="modal fade">
                    <div class="modal-dialog modal-confirm">
                      <div class="modal-content" style="background:#fdf3ea;">
                        <div class="modal-header flex-column">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                          <div class="icon-box">
                            <i class='fa fa-sign-out fa-4x red-color'></i>
                          </div>
                          <h4 class="modal-title w-100">Are you sure?</h4>
                        </div>
                        <div class="modal-body">
                          <p>Do you really want to LOGOUT?</p>
                        </div>
                        <div class="modal-footer justify-content-center">
                          <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Cancel</button>
                          <button type="button" class="btn btn-danger" onclick="location.href='<c:url value="logout"/>'">logout</button>
                        </div>
                      </div>
                    </div>
                  </div>
                    
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${name}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${sessionEmail}</p>
                                            </div>
                                        </div>
                            </div><br>
                            
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    
                                </li>
                            </ul><br>
                           
                                    <div class="row">
                                         <div class="col-md-6">
                                              <label>Password</label>
                                          </div>
                                          <div class="col-md-6">
                                              <p>********
                                              <button type="button" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" class="profile-edit-btn" name="btnAddMore" style="margin-left: 80px;width: 50%;">
                                              Change Password</button>  
                                              </p>
                                              
                                          </div>
                                    </div>
                                    
                                    
                                    <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
									  <div class="modal-dialog modal-dialog-centered">
									    <div class="modal-content" style="background:#fdf3ea;">
									      <div class="modal-header">
									        <h1 class="modal-title fs-5" id="exampleModalToggleLabel">Change Password</h1>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div><br>
									      <div class="row g-3 align-items-center">
											  <div class="col-auto">
											    <label for="inputPassword6" class="col-form-label" style="margin-left: 50px;">Current Password :</label>
											  </div>
											  <div class="col-auto" >
											    <input type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
											  </div>
											</div><br>
											
											<div class="row g-3 align-items-center">
											  <div class="col-auto">
											    <label for="inputPassword6" class="col-form-label" style="margin-left: 50px;">New Password :</label>
											  </div>
											  <div class="col-auto" style="margin-left: 24.5px;">
											    <input type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
											  </div>
											</div><br>
											
											<div class="row g-3 align-items-center">
											  <div class="col-auto">
											    <label for="inputPassword6" class="col-form-label" style="margin-left: 50px;">Confirm Password :</label>
											  </div>
											  <div class="col-auto">
											    <input type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
											  </div>
											</div><br>
				
											<div class="col text-center">
												<button type="submit" id="submitbtn" class="btn btn-primary" style="background:#f08632;border-color:#f08632;">Save Changes</button>
											</div><br>

									    </div>
									  </div>
									</div>
                                    
                                   
                            <%-- <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Experience</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Hourly Rate</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>10$/hr</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Total Projects</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>230</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>English Level</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Availability</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>6 months</p>
                                            </div>
                                        </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Your Bio</label><br/>
                                        <p>Your detail description</p>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </form>           
        </div>
        
        </section>                                    
  <script src='<c:url value ="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"/>'></script>
<script src='<c:url value ="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>'></script>	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
 crossorigin="anonymous"></script>
 
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>