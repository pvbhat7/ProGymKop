<%@page import="com.progym.model.User"%>
<%@page import="com.progym.model.Client"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   if(session.getAttribute("loggedInUser") == null)
   response.sendRedirect("login");
   %>
<!doctype html>
<html class="no-js" lang="en">
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
      <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
      <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <style>
         .modal-header, h4, .close {
         background-color: #5cb85c;
         color:white !important;
         text-align: center;
         font-size: 30px;
         }
         .modal-footer {
         background-color: #f9f9f9;
         }
      </style>
      <jsp:include page="header.jsp" />
      <script>
         window.onload = function() {
         	weight.value = "";
         	height.value = "";
         	if(document.getElementById('neck') != null)
         	neck.value = "";
         	if(document.getElementById('chest') != null)
         	chest.value = "";
         	if(document.getElementById('weist') != null)
         	weist.value = "";
         	if(document.getElementById('arm') != null)
         	arm.value = "";
         	if(document.getElementById('thigh') != null)
         	thigh.value = "";
         	if(document.getElementById('upperHips') != null)
         	upperHips.value = "";
         	if(document.getElementById('hips') != null)
         	hips.value = "";
         	if(document.getElementById('Calf') != null)
         	Calf.value = "";
         	if(document.getElementById('ankle') != null)
         	ankle.value = "";
         	};
      </script>
   </head>
   <body>
      <!-- Start Left menu area -->
      <jsp:include page="topPage.jsp" />
      <!-- Single pro tab review Start-->
      <div class="single-pro-review-area mt-t-30 mg-b-15">
         <div class="container-fluid">
            <div class="row">
               <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                  <div class="profile-info-inner">
                     <div class="profile-img" >
                        <a id="uploadPhotoLink" href="#">
                           <c:if test="${clientObject.photo == 'NA'}">
                              <img id="displayPhoto" src="img/upload_photo.jpg">
                           </c:if>
                           <c:if test="${clientObject.photo != 'NA'}">
                              <img id="displayPhoto" src="${clientObject.photo}">
                           </c:if>
                        </a>
                     </div>
                     <div class="profile-details-hr">
                        <div class="row">
                           <div class="" align="center">
                              <div class="address-hr">
                                 <h1>${clientObject.name}</h1>
                                 </p>
                              </div>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                              <div class="address-hr">
                                 <p><b>Birth Date</b><br /> ${clientObject.birthDate}</p>
                              </div>
                           </div>
                           <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                              <div class="address-hr tb-sm-res-d-n dps-tb-ntn">
                                 <p><b>Mobile</b><br /> ${clientObject.mobile}</p>
                              </div>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                              <div class="address-hr">
                                 <p><b>Blood Group</b><br /> ${clientObject.bloodGroup}</p>
                              </div>
                           </div>
                           <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                              <div class="address-hr tb-sm-res-d-n dps-tb-ntn">
                                 <%-- <p><b>Refer Points</b><br /> ${clientObject.referPoints}</p> --%>
                                 <button type="button" id="btnreferral" class="btn btn-primary btn-block btn-xs">
                                 Refer Points : ${clientObject.referPoints}
                                 </button>
                              </div>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                              <div class="address-hr">
                                 <p><b>Email</b><br /> ${clientObject.email}</p>
                              </div>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                           </div>
                           <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                              <a href="<c:url value='deleteClientProfile?gender=${clientObject.gender}&clientid=${clientObject.id}'/>">
                              <img src="img/delete.png" alt="" width="50" height="60"/>
                              </a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                  <div class="product-payment-inner-st res-mg-t-30 analysis-progrebar-ctn">
                     <ul id="myTabedu1" class="tab-review-design">
                        <li class="active"><a href="#description">Packages</a></li>
                        <c:if test="${clientObject.gender == 'female'}">
                           <li><a href="#view_monthly_data">Monthly Data</a></li>
                           <li><a href="#add_monthly_data">Add Monthly Data</a></li>
                        </c:if>
                        <li><a href="#edit_profile">Edit Profile</a></li>
                     </ul>
                     <div id="myTabContent" class="tab-content custom-product-edit st-prf-pro">
                        <!-- TAB 1 START -->
                        <div class="product-tab-list tab-pane fade active in" id="description">
                           <div class="row">
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="review-content-section">
                                 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button style="text-align:center;background-color:#000000" type="button" class="btn btn-info btn-lg" id="myBtn">Add Package</button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="<c:url value='renewPackage?gender=${clientObject.gender}&clientid=${clientObject.id}'/>">
                                    <button style="text-align:center;background-color:#000000" type="button" class="btn btn-info btn-lg">Renew Package</button>
                                    </a>
                                    <!-- Refer points show modal -->
                                    <div class="modal fade bd-example-modal-sm" id="myModalww" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                                       <div class="modal-dialog modal-sm">
                                          <div class="modal-content">
                                             <!-- Modal Header -->
                                             <div class="modal-header">
                                                <h4 class="modal-title">Refer System</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                             </div>
                                             <!-- Modal body -->
                                             <div class="modal-body" align="center">
                                                <table class="table table-striped" align="center">
                                                   <thead>
                                                      <tr align="center">
                                                         <th>Points</th>
                                                         <th>Referral</th>
                                                      </tr>
                                                   </thead>
                                                   <tbody>
                                                      <tr>
                                                         <td>${clientObject.referPoints}</td>
                                                         <td>        
                                                            <textarea style="color:red;" id="refField" disabled="disabled"></textarea>
                                                         </td>
                                                      </tr>
                                                   </tbody>
                                                </table>
                                             </div>
                                             <!-- Modal footer -->
                                             <div class="modal-footer">
                                                <c:if test="${clientObject.referPoints == '10'}">
                                                   <a href="<c:url value='redeemReferPoints?gender=${clientObject.gender}&clientid=${clientObject.id}'/>">
                                                   <button type="button" class="btn btn-success">Redeem Points</button>
                                                   </a>
                                                </c:if>
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <script>
                                       $(document).ready(function(){
                                       $("#btnreferral").click(function(){
                                       
                                       
                                       //get data from table row
                                       
                                          var reffrralName = ${refferalName};
                                          console.log(reffrralName.trim());
                                          $("#refField").val(reffrralName.trim());
                                          
                                          //open modal
                                          $("#myModalww").modal();
                                       
                                          $("#btnsave").click(function () {                            
                                          })
                                       
                                       
                                       });
                                       });
                                    </script>
                                    <!-- end Refer points show modal -->

                                    <!-- upload photo modal -->
                                    <div class="modal fade bd-example-modal-sm" id="uploadPhotoModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                                       <div class="modal-dialog modal-lg">
                                          <div class="modal-content">
                                             <!-- Modal Header -->
                                             <div class="modal-header">
                                                <h4 class="modal-title">Upload Photo</h4>
                                             </div>
                                             <!-- Modal body -->
                                             <div class="modal-body" align="center">
                                                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                                                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"> </script>
                                                <table class="table table-striped" align="center">
                                                   <thead>
                                                   <tr align="center">
                                                      <th>Video</th>
                                                      <th>Captured Photo</th>
                                                   </tr>
                                                   </thead>
                                                   <tbody>
                                                   <tr>
                                                      <td><video id="videoID" width="300" height="300" autoplay style="border: 1px solid black;"></video></td>
                                                      <td><canvas id="canvas" width="300" height="300" style="border: 1px solid black;"></canvas></td>
                                                   </tr>
                                                   </tbody>
                                                </table>
                                                <script type="text/javascript">
                                                   const video = document.getElementById('videoID');
                                                   const canvas = document.getElementById('canvas');
                                                   const ctx = canvas.getContext('2d');
                                                   var str = null;
                                                   function capture() {
                                                      ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
                                                   };

                                                   function send() {
                                                      $('#uploadPhotoModal').modal('hide');
                                                      var imageData = canvas.toDataURL();
                                                      var xmlhttp = new XMLHttpRequest();
                                                      //xmlhttp.open("POST", "/ProGym_war_exploded/saveCanvasImage", true);
                                                      xmlhttp.open("POST", "/ProGymKop/saveCanvasImage", true);
                                                      xmlhttp.send(imageData);
                                                       /*$.ajax({
                                                           url:'/ProGym_war_exploded/saveCanvasImage',
                                                           data:{imageBase64: imageData},
                                                           type: 'post',
                                                           dataType: 'json',
                                                           timeout: 10000,
                                                           async: false,
                                                           error: function(){
                                                               console.log("WOOPS");
                                                           },
                                                           success: function(res){
                                                               if(res.ret==0){
                                                                   console.log("SUCCESS");
                                                               }else{
                                                                   console.log("FAIL : " + res.msg);
                                                               }
                                                           }
                                                       });*/
                                                      setTimeout(function(){
                                                         window.location.reload(1);
                                                      }, 4000);
                                                   };
                                                </script>
                                                <script type="text/javascript">
                                                   function showVideo() {
                                                      window.URL = window.URL || window.webkitURL;
                                                      navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
                                                      navigator.getUserMedia({video: true}, function (stream) {
                                                         video.srcObject = stream;
                                                         str = stream;
                                                      }, function (e) {
                                                      });
                                                   }
                                                </script>
                                             </div>
                                             <!-- Modal footer -->
                                             <div class="modal-footer">
                                                <input type="button" class="btn btn-primary" value="Take photo" onclick="capture()" style="width: 200px; height: 30px;"/>
                                                <input type="button" class="btn btn-primary" value="Send" onclick="send()" style="width: 200px; height: 30px;"/>
                                                <button id="btnClose" type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <script>
                                       $(document).ready(function(){
                                          $("#uploadPhotoLink").click(function(){
                                             showVideo();
                                             //open modal
                                             $("#uploadPhotoModal").modal();

                                             $("#uploadPhotoModal").on("hidden.bs.modal", function () {
                                                str.getTracks().forEach(function(track) { track.stop(); })
                                                ctx.clearRect(0, 0, canvas.width, canvas.height);
                                             });

                                          });
                                       });


                                    </script>
                                    <!-- end upload photo modal -->

                                    <!-- Add package modal -->
                                    <div class="modal fade" id="myModal" role="dialog">
                                       <div class="modal-dialog">
                                          <!-- Modal content-->
                                          <div class="modal-content">
                                             <div class="modal-header" style="padding:20px 30px;">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4>Add Package</h4>
                                             </div>
                                             <div class="modal-body" style="padding:40px 50px;">
                                                <form:form role="form" modelAttribute="clientAddPackageObject" method="post" action="addPackageForClient" id="addPackageForClient">
                                                   <div class="form-group">
                                                      <form:select path="cpackageId" class="form-control">
                                                         <form:option value="NONE" label="--- Select Package ---"/>
                                                         <form:options items="${packagesList}"/>
                                                      </form:select>
                                                   </div>
                                                   </br>
                                                   <div class="form-group">
                                                      <label for="psw"><span class="glyphicon"></span> Package Start Date</label>
                                                      <form:input path="startDate" type="date" class="form-control" id="psw" />
                                                   </div>
                                                   </br>	
                                                   <div class="form-group">
                                                      <form:select path="discountPercentage" class="form-control">
                                                         <form:option value="NONE" label="--- Select Discount Amount ---"/>
                                                         <form:options items="${discountPercentageList}"/>
                                                      </form:select>
                                                   </div>
                                                   </br>
                                                   <form:input type="hidden" path="clientId" value="${clientObject.id}"/>
                                                   <form:input type="hidden" path="gender" value="${clientObject.gender}"/>
                                                   <div align="center">
                                                      <form:button type="submit" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</form:button>
                                                      <form:button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-off"></span> Submit</form:button>
                                                   </div>
                                                </form:form>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <script>
                                       $(document).ready(function(){
                                         $("#myBtn").click(function(){
                                           $("#myModal").modal();
                                         });
                                       });
                                    </script> 
                                    <div class="row mg-b-15">
                                       <div class="col-lg-12">
                                          <div class="sparkline8-list">
                                             <div class="sparkline8-graph">
                                                <div class="static-table-list">
                                                   <table class="table">
                                                      <thead>
                                                         <tr>
                                                            <th hidden="true">Id</th>
                                                            <th>Package</th>
                                                            <th>Start Date</th>
                                                            <th>End Date</th>
                                                            <th>Status</th>
                                                            <th>Fees</th>
                                                            <th>Collection</th>
                                                            <th>Action</th>
                                                            <th>Transactions</th>
                                                         </tr>
                                                      </thead>
                                                      <tbody>
                                                         <c:forEach items="${clientPackagesList}" var="c_pkg" varStatus="status">
                                                            <tr>
                                                               <td hidden="true">
                                                                  <c:out value="${c_pkg.id}"/>
                                                               </td>
                                                               <td>
                                                                  <c:out value="${c_pkg.packageName}"/>
                                                               </td>
                                                               <td>
                                                                  <c:out value="${c_pkg.packageStartDate}"/>
                                                               </td>
                                                               <td>
                                                                  <c:out value="${c_pkg.packageEndDate}"/>
                                                               </td>
                                                               <td>
                                                                  <c:out value="${c_pkg.clientPackageStatus}"/>
                                                               </td>
                                                               <td>
                                                                  <c:out value="${c_pkg.packageFees}"/>
                                                               </td>
                                                               <td>
                                                                  <c:out value="${c_pkg.amountPaid}"/>
                                                               </td>
                                                               <td>
                                                                  <c:if test="${c_pkg.packageFees != c_pkg.amountPaid}">
                                                                     <input class="btnedit btn btn-success btn-xs" type="button" value="Pay" />
                                                                  </c:if>
                                                                  <input class="btnEditClientPackage btn-primary btn-xs" type="button" value="Edit" />
                                                                  <a href="<c:url value='deleteClientAssignedPackage?u_pkgId=${clientPackagesList[status.index].id}&u_gender=${clientObject.gender}&u_clientid=${clientObject.id}'/>">
                                                                  <input class="btn btn-danger btn-xs" type="button" value="Delete" />
                                                                  </a>
                                                               </td>
                                                               <td>
                                                                  <div>
                                                                     <table id="tbldata" border="1">
                                                                        <tr>
                                                                           <th style="text-align:center;">Amount</th>
                                                                           <th style="text-align:center;">Date</th>
                                                                           <th style="text-align:center;">Approved ?</th>
                                                                           <th style="text-align:center;">Paid By</th>
                                                                           <th style="text-align:center;">Invoice</th>
                                                                        </tr>
                                                                        <c:forEach var = "trans" items = "${c_pkg.paymentTransactions}" varStatus="status1">
                                                                           <tr>
                                                                              <td style="text-align:center;">
                                                                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                                                                 <c:out value="${trans.feesPaid}"/>
                                                                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                                                              </td>
                                                                              <td style="text-align:center;">
                                                                                 &nbsp;&nbsp;
                                                                                 <c:out value="${trans.paymentDate}"/>
                                                                                 &nbsp;&nbsp;
                                                                              </td>
                                                                              <c:if test="${trans.isApproved == 'NO'}">
                                                                                 <%
                                                                                    if(((User)session.getAttribute("loggedInUser")).getAuthorizedToApprovePayment().equals("YES")){
                                                                                    %>
                                                                                 <td height="40">&nbsp;&nbsp;
                                                                                    <%
                                                                                       }
                                                                                       else{
                                                                                       %>
                                                                                 <td height="40" bgcolor="#FF3333">
                                                                                    &nbsp;&nbsp;
                                                                                    <%} %>
                                                                                    <%
                                                                                       if(((User)session.getAttribute("loggedInUser")).getAuthorizedToApprovePayment().equals("YES")){
                                                                                       %>
                                                                                    <a href="<c:url value='approveTransaction?txnId=${c_pkg.paymentTransactions[status1.index].id}&cID=${clientPackagesList[status.index].client.id}&gender=${clientPackagesList[status.index].client.gender}'/>">
                                                                                    <input class="btnedit btn btn-danger btn-xs" type="button" value="Approve" />
                                                                                    </a>
                                                                                    <%}
                                                                                       else{%>
                                                                                    <c:out value="${trans.isApproved}"/>
                                                                                    <%
                                                                                       }%>
                                                                                    &nbsp;&nbsp;
                                                                                 </td>
                                                                              </c:if>
                                                                              <c:if test="${trans.isApproved == 'YES'}">
                                                                                 <td bgcolor="#00FF00">
                                                                                    &nbsp;&nbsp;
                                                                                    <c:out value="${trans.isApproved}"/>
                                                                                    &nbsp;&nbsp;
                                                                                 </td>
                                                                              </c:if>
                                                                              <td style="text-align:center;">
                                                                                 <c:out value="${trans.paymentMode}"/>
                                                                              </td>
                                                                              <td style="border: solid 2px #ddd; padding:10px 10px;"><a href="<c:url value='sendInvoice?txnId=${c_pkg.paymentTransactions[status1.index].id}&cID=${clientPackagesList[status.index].client.id}&email=${clientObject.email}&gender=${clientPackagesList[status.index].client.gender}'/>">
                                                                                 <input class="btn btn-primary btn-xs" type="button" value="&nbsp;&nbsp;Send Invoice&nbsp;&nbsp;" />
                                                                                 </a>
                                                                              </td>
                                                                           </tr>
                                                                        </c:forEach>
                                                                     </table>
                                                                  </div>
                                                               </td>
                                                               <!-- Add Transaction Modal -->
                                                               <div class="modal fade" id="payModel" role="dialog">
                                                                  <div class="modal-dialog">
                                                                     <!-- Modal content-->
                                                                     <div class="modal-content">
                                                                        <div class="modal-header">
                                                                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                           <h4 class="modal-title">Make Payment</h4>
                                                                        </div>
                                                                        <form:form action="addTransaction" class="dropzone dropzone-custom needsclick add-professors" id="addTransaction" modelAttribute="transactionObject" method="post">
                                                                           <div class="modal-body">
                                                                              <form:input path="clientId" value="${clientObject.id}" title="" name="clientId" type="hidden" class="form-control" ></form:input>
                                                                              <form:input path="clientGender" value="${clientObject.gender}" title="" name="clientGender" type="hidden" class="form-control" ></form:input>
                                                                              <label for="psw"><span class="glyphicon"></span> Package</label>
                                                                              <input id="txt_item" class="form-control" type="text" readonly/>
                                                                              </br>
                                                                              <label for="psw"><span class="glyphicon"></span> Paid Payment</label>
                                                                              <input id="txt_Price1" class="form-control" type="text" readonly/>
                                                                              </br>
                                                                              <label for="psw"><span class="glyphicon"></span> Remaining Payment</label>
                                                                              <form:input id="feesPaid" name="feesPaid" path="feesPaid" class="form-control" type="number" />
                                                                              </br>
                                                                              <label for="psw"><span class="glyphicon"></span> Payment Mode</label>
                                                                              <form:select path="paymentMode" class="form-control">
                                                                                 <form:options items="${paymentModes}"/>
                                                                              </form:select>
                                                                              </br>
                                                                              <form:input id="packageDetailsId" class="form-control" type="hidden" name="packageDetailsId" path="packageDetailsId"/>
                                                                           </div>
                                                                           <div class="modal-footer">
                                                                              <form:button id="basicInfo" type="submit" class="btn btn-primary" onclick="this.disabled=true;this.value='Submitting...'; this.form.submit();">Pay</form:button>
                                                                              <script>
                                                                                 //submit search, display loading message
                                                                                     $('input[type = submit]').click(function(){
                                                                                         $.blockUI({ css: { 
                                                                                             border: 'none', 
                                                                                             padding: '15px', 
                                                                                             backgroundColor: '#000',
                                                                                             opacity: .6
                                                                                         } }); 
                                                                                     });
                                                                              </script>
                                                                              <form:button type="button" class="btn btn-default" data-dismiss="modal">Close</form:button>
                                                                           </div>
                                                                        </form:form>
                                                                     </div>
                                                                  </div>
                                                               </div>
                                                               <!-- Edit Client assigned Modal -->
                                                               <div class="modal fade" id="editPackageModal" role="dialog">
                                                                  <div class="modal-dialog">
                                                                     <!-- Modal content-->
                                                                     <div class="modal-content">
                                                                        <div class="modal-header">
                                                                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                           <h4 class="modal-title">Update Package</h4>
                                                                        </div>
                                                                        <form action="updateClientAssignedPackage" class="dropzone dropzone-custom needsclick add-professors" method="post">
                                                                           <div class="modal-body">
                                                                              <label for="psw"><span class="glyphicon"></span> Package Name</label>
                                                                              <input id="u_package" name="u_package" class="form-control" type="text" readonly/>
                                                                              
                                                                              <label for="psw"><span class="glyphicon"></span> Package StartDate</label>
                                                                              <input id="u_startdate" name="u_startdate" class="form-control" type="date" readonly/>
                                                                              <label for="psw"><span class="glyphicon"></span> Package EndDate</label>
                                                                              <input id="u_enddate" name="u_enddate" class="form-control" type="date"/>
                                                                              <label for="psw"><span class="glyphicon"></span> Fees </label>
                                                                              <input id="u_fees" name="u_fees" class="form-control" type="number" />
                                                                              <input id="u_pkgId" class="form-control" type="hidden" name="u_pkgId" />
                                                                              <input id="u_clientid" class="form-control" type="hidden" value="<%out.print(((Client)request.getAttribute("clientObject")).getId());%>" name="u_clientid" />
                                                                              <input id="u_gender" class="form-control" type="hidden" name="u_gender" value="<%out.print(((Client)request.getAttribute("clientObject")).getGender());%>"/>
                                                                           </div>
                                                                           <div class="modal-footer">
                                                                              <button id="basicInfo" type="submit" class="btn btn-primary">Update Package</button>
                                                                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                           </div>
                                                                        </form>
                                                                     </div>
                                                                  </div>
                                                               </div>
                                                               <script>
                                                                  $(function () {
                                                                  	
                                                                  	/* on click - pay */
                                                                      $(".btnedit").click(function () {
                                                                          //get data from table row
                                                                          var packageId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
                                                                          var packageName = $(this).parent().prev().prev().prev().prev().prev().prev().text();
                                                                          var paidPayment = $(this).parent().prev().text();
                                                                          var total = $(this).parent().prev().prev().text();
                                                                          var remaining = total - paidPayment;
                                                                  
                                                                  
                                                                          //assign to value for input box inside modal
                                                                          $("#txt_item").val(packageName);
                                                                          $("#txt_Price1").val(paidPayment);
                                                                          $("#feesPaid").val(remaining);
                                                                          $("#packageDetailsId").val(packageId);
                                                                  
                                                                          //open modal
                                                                          $("#payModel").modal();
                                                                  
                                                                          $("#btnsave").click(function () {                            
                                                                          })
                                                                      })
                                                                      
                                                                      /* on click - edit client assigned package */
                                                                      $(".btnEditClientPackage").click(function () {
                                                                          //get data from table row
                                                                          var packageId = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
                                                                          var packageName = $(this).parent().prev().prev().prev().prev().prev().prev().text();
                                                                          var startdate = $(this).parent().prev().prev().prev().prev().prev().text();
                                                                          var enddate = $(this).parent().prev().prev().prev().prev().text();
                                                                          var fees = $(this).parent().prev().prev().text().replace(/\s+/g, '');
                                                                          var initial = startdate.split(/\//);
                                                                          var formattedDate = [initial[2],initial[1],initial[0]].join('-').replace(/\s+/g, '');
                                                                          
                                                                          var initialEndDate = enddate.split(/\//);
                                                                          var formattedEndDate = [ initialEndDate[2], initialEndDate[1], initialEndDate[0] ].join('-').replace(/\s+/g, '');
                                                                          
                                                                          //assign to value for input box inside modal
                                                                          $("#u_pkgId").val(packageId);
                                                                          $("#u_package").val(packageName);
                                                                          $("#u_fees").val(fees);
                                                                          $("#u_startdate").val(formattedDate);
                                                                          $("#u_enddate").val(formattedEndDate);
                                                                          /* $("#u_clientid").val(cliendId);
                                                                          $("#u_gender").val(gender); */
                                                                          
                                                                          
                                                                          
                                                                  
                                                                          //open modal
                                                                          $("#editPackageModal").modal();
                                                                  
                                                                          $("#btnsave").click(function () {
                                                                              //make ajax request to update data
                                                                  
                                                                              //and in ajax success callback function 
                                                                              //hide modal
                                                                              //$("#myModal").modal("hide")              
                                                                          })
                                                                      })
                                                                  })
                                                               </script>
                                                            </tr>
                                                         </c:forEach>
                                                      </tbody>
                                                   </table>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <!--PACKAGES TAB 1 END -->
                        <c:if test="${clientObject.gender == 'female'}">
                           <!--MONTHLY DATA TAB 2 START -->
                           <div class="product-tab-list tab-pane fade" id="view_monthly_data">
                              <div class="row">
                                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="review-content-section">
                                       <!-- table -->
                                       <div class="row mg-b-15">
                                          <div class="col-lg-12">
                                             <div class="sparkline8-list">
                                                <div class="sparkline8-graph">
                                                   <div class="static-table-list">
                                                      <table class="table">
                                                         <thead>
                                                            <tr>
                                                               <th hidden="true">Id</th>
                                                               <th>Date</th>
                                                               <th>Month</th>
                                                               <th>Weight</th>
                                                               <th>Height</th>
                                                               <th>Neck</th>
                                                               <th>Chest</th>
                                                               <th>Weist</th>
                                                               <th>Arm</th>
                                                               <th>Thigh</th>
                                                               <th>Upper Hips</th>
                                                               <th>Hips</th>
                                                               <th>Calf</th>
                                                               <th>Ankle</th>
                                                               <th>Delete</th>
                                                            </tr>
                                                         </thead>
                                                         <tbody>
                                                            <c:forEach items="${femaleAditionalDataList}" var="obj" varStatus="status">
                                                               <tr>
                                                                  <td>
                                                                     <c:out value="${obj.date}"/>
                                                                  </td>
                                                                  <td>
                                                                     <c:out value="${obj.month}"/>
                                                                  </td>
                                                                  <td>
                                                                     <c:out value="${obj.weight}"/>
                                                                  </td>
                                                                  <td>
                                                                     <c:out value="${obj.height}"/>
                                                                  </td>
                                                                  <td>
                                                                     <c:out value="${obj.neck}"/>
                                                                  </td>
                                                                  <td>
                                                                     <c:out value="${obj.chest}"/>
                                                                  </td>
                                                                  <td>
                                                                     <c:out value="${obj.weist}"/>
                                                                  </td>
                                                                  <td>
                                                                     <c:out value="${obj.arm}"/>
                                                                  </td>
                                                                  <td>
                                                                     <c:out value="${obj.thigh}"/>
                                                                  </td>
                                                                  <td>
                                                                     <c:out value="${obj.upperHips}"/>
                                                                  </td>
                                                                  <td>
                                                                     <c:out value="${obj.hips}"/>
                                                                  </td>
                                                                  <td>
                                                                     <c:out value="${obj.calf}"/>
                                                                  </td>
                                                                  <td>
                                                                     <c:out value="${obj.ankle}"/>
                                                                  </td>
                                                                  <td>
                                                                     <a href="<c:url value='deleteFemaleClientAdditionalDetails?id=${obj.id}&gender=${clientObject.gender}&clientid=${clientObject.id}'/>">
                                                                     <input class="btn btn-danger btn-xs" type="button" value="Delete" />
                                                                     </a>
                                                                  </td>
                                                                  <%-- <td>
                                                                     <c:if test="${c_pkg.packageFees != c_pkg.amountPaid}">
                                                                     <input class="btnedit btn btn-success btn-xs" type="button" value="Pay" />
                                                                     </c:if>
                                                                     <input class="btnEditClientPackage btn-primary btn-xs" type="button" value="Edit" />
                                                                     <a href="<c:url value='deleteClientAssignedPackage?u_pkgId=${clientPackagesList[status.index].id}&u_gender=${clientObject.gender}&u_clientid=${clientObject.id}'/>">
                                                                     <input class="btn btn-danger btn-xs" type="button" value="Delete" />
                                                                     </a>
                                                                     </td>	 --%>							                                                
                                                               </tr>
                                                            </c:forEach>
                                                         </tbody>
                                                      </table>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                       <!-- table end -->
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!--MONTHLY DATA TAB 2 END -->
                           <!--ADD MONTHLY DATA TAB 3 START -->
                           <div class="product-tab-list tab-pane fade" id="add_monthly_data">
                              <div class="row">
                                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <form:form action="submitFemaleAditionalDataForm" class="dropzone dropzone-custom needsclick add-professors" id="addTransaction" modelAttribute="femaleAditionalDataFormObject" method="post">
                                       <div class="review-content-section">
                                          <div class="row">
                                             <div class="col-lg-3">
                                                <div class="form-group">
                                                   <form:input path="clientId" title="" name="clientId" type="hidden" class="form-control" placeholder="Enter Weight"></form:input>
                                                </div>
                                                <div class="form-group">
                                                   <form:input path="gender" title="" name="gender" type="hidden" class="form-control" placeholder="Enter Weight"></form:input>
                                                </div>
                                                <div class="form-group">
                                                   <form:label path="weight">Weight</form:label>
                                                   <form:input path="weight" title="" name="weight" type="number" class="form-control" placeholder="Enter Weight"></form:input>
                                                </div>
                                                <div class="form-group">
                                                   <form:label path="height">Height</form:label>
                                                   <form:input path="height" name="height" type="number" class="form-control" placeholder="Enter Height"></form:input>
                                                </div>
                                                <div class="form-group">
                                                   <form:label path="neck">Neck</form:label>
                                                   <form:input path="neck" name="neck" type="number" class="form-control" placeholder="Enter Neck"></form:input>
                                                </div>
                                                <div class="form-group">
                                                   <form:label path="chest">Chest</form:label>
                                                   <form:input path="chest" name="chest" type="number" class="form-control" placeholder="Enter Chest"></form:input>
                                                </div>
                                                <div class="form-group">
                                                   <form:label path="weist">Weist</form:label>
                                                   <form:input path="weist" name="weist" type="number" class="form-control" placeholder="Enter Weist"></form:input>
                                                </div>
                                                <div class="form-group">
                                                   <form:label path="arm">Arm</form:label>
                                                   <form:input path="arm" name="arm" type="number" class="form-control" placeholder="Enter Arm"></form:input>
                                                </div>
                                             </div>
                                             <div class="col-lg-3">
                                                <div class="form-group">
                                                   <form:label path="thigh">Thigh</form:label>
                                                   <form:input path="thigh" name="thigh" type="number" class="form-control" placeholder="Enter Theigh"></form:input>
                                                </div>
                                                <div class="form-group">
                                                   <form:label path="upperHips">Upper Hips</form:label>
                                                   <form:input path="upperHips" name="upperHips" type="number" class="form-control" placeholder="Enter Upper Hips"></form:input>
                                                </div>
                                                <div class="form-group">
                                                   <form:label path="hips">Hips</form:label>
                                                   <form:input path="hips" name="hips" type="number" class="form-control" placeholder="Enter Hips"></form:input>
                                                </div>
                                                <div class="form-group">
                                                   <form:label path="Calf">Calf</form:label>
                                                   <form:input path="Calf" name="Calf" type="number" class="form-control" placeholder="Enter Calf"></form:input>
                                                </div>
                                                <div class="form-group">
                                                   <form:label path="ankle">Ankle</form:label>
                                                   <form:input path="ankle" name="ankle" type="number" class="form-control" placeholder="Enter Ankle"></form:input>
                                                </div>
                                             </div>
                                          </div>
                                          </br>
                                          <div class="row">
                                             <div class="col-lg-12">
                                                <div class="payment-adress mg-t-15">
                                                   <button type="submit" class="btn btn-primary waves-effect waves-light mg-b-15">Submit</button>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </form:form>
                                 </div>
                              </div>
                           </div>
                           <!--ADD MONTHLY DATA TAB 3 END -->
                        </c:if>
                        <!--EDIT PROFILE TAB 4 START -->
                        <div class="product-tab-list tab-pane fade" id="edit_profile">
                           <div class="row">
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <form:form action="editClientProfile" class="dropzone dropzone-custom needsclick add-professors" id="editClientProfileFormObjectid" modelAttribute="editClientProfileFormObject" method="post">
                                    <div class="review-content-section">
                                       <div class="row">
                                          <div class="col-lg-6">
                                             <div class="form-group">
                                                <form:input path="id" title="" name="id" type="hidden" class="form-control" placeholder="Enter Weight"></form:input>
                                             </div>
                                             <div class="form-group">
                                                <form:input path="gender" title="" name="gender" type="hidden" class="form-control" placeholder="Enter Weight"></form:input>
                                             </div>
                                             <div class="form-group">
                                                <form:label path="name">Name</form:label>
                                                <form:input path="name" name="name" type="text" class="form-control" ></form:input>
                                             </div>
                                             <div class="form-group">
                                                <form:label path="mobile">Mobile</form:label>
                                                <form:input path="mobile" name="mobile" type="text" class="form-control" ></form:input>
                                             </div>
                                             <%-- <div class="form-group">
                                                <form:label path="gender">Gender</form:label>
                                                    <form:input path="gender" name="gender" type="text" class="form-control" ></form:input>
                                                </div> --%>
                                             <div class="form-group">
                                                <form:label path="birthDate">Birth Date</form:label>
                                                <form:input disabled="true" path="birthDate" name="birthDate" type="text" class="form-control" ></form:input>
                                             </div>
                                             <div class="form-group">
                                                <form:label path="height">Height</form:label>
                                                <form:input path="height" name="height" type="number" class="form-control" ></form:input>
                                             </div>
                                             <div class="form-group">
                                                <form:label path="weight">Weight</form:label>
                                                <form:input path="weight" name="weight" type="number" class="form-control" ></form:input>
                                             </div>
                                          </div>
                                          <div class="col-lg-6">
                                             <div class="form-group">
                                                <form:label path="email">Email</form:label>
                                                <form:input path="email" name="email" type="text" class="form-control" ></form:input>
                                             </div>
                                             <div class="form-group">
                                                <form:label path="address">Address</form:label>
                                                <form:input path="address" name="address" type="text" class="form-control" ></form:input>
                                             </div>
                                             <div class="form-group">
                                                <form:label path="bloodGroup">Blood Group</form:label>
                                                <form:input path="bloodGroup" name="bloodGroup" type="text" class="form-control" ></form:input>
                                             </div>
                                             <div class="form-group">
                                                <form:label path="previousGym">Previous Gym</form:label>
                                                <form:input path="previousGym" name="previousGym" type="text" class="form-control" ></form:input>
                                             </div>
                                          </div>
                                       </div>
                                       </br>
                                       <div class="row">
                                          <div class="col-lg-12">
                                             <div class="payment-adress mg-t-15">
                                                <button type="submit" class="btn btn-primary waves-effect waves-light mg-b-15">Submit</button>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </form:form>
                              </div>
                           </div>
                        </div>
                        <!--EDIT PROFILE TAB 4 END -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <jsp:include page="copyright.jsp" />
      </div>
      <jsp:include page="bottom_script.jsp" />
   </div>
   </body>

</html>