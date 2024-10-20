<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Details</title>
    
    <!-- Include jQuery and jQuery UI for date pickers -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <!-- Include Bootstrap for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

    <script src="resources/js/syngene/projectdetails.js"></script>
      <script src="resources/js/syngene/softBooking.js"></script>
</head>
<body>

<div class="container mt-4">
    <!-- Header Section: Displaying Project Information -->
    <h5>Project Details</h5>
    <table class="table table-borderless">
        <tr>
            <!-- First row: Project Code, Project Name, Project Manager -->
            <td><strong>Project Code:</strong></td>
            <td>${projectInfo.projectCode }
            <input type="hidden" id="projectId" value="${projectInfo.projectCode }">
            </td>
            <td><strong>Project Name:</strong></td>
            <td>${projectInfo.projectName }</td>
            <td><strong>Project Manager:</strong></td>
            <td>${projectInfo.projectManager }</td>
        </tr>
        <tr>
            <!-- Second row: Operating Unit, Department -->
            <td><strong>Operating Unit:</strong></td>
            <td>${projectInfo.operatingUnit }</td>
            <td><strong>Department:</strong></td>
            <td>${projectInfo.department }</td>
        </tr>
    </table>

    <!-- Tasks Section -->
    <h5>Task List</h5>
    <table id="taskTable" class="table table-bordered">
        <thead>
            <tr>
                <th>Task Name</th>
                <th>Skill</th>
                <th>No. of Resources</th>
                <th>No. of Man Days</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="task" items="${projectInfo.tasks}" varStatus="loop" > 
        <tr>
						<td>${task.taskName }</td>
						<td>${task.skill }</td>
						<td>${task.noOfResources }</td>
						<td>${task.noOfManDays }</td>
						<td>${task.startDate}</td>
						<td>${task.endDate }</td>
						<td><button class="btn btn-primary" onclick="openResourceBookingModal('${projectInfo.department}','${task.taskId }','${task.taskName }')">Book Resource</button>
						 <button class="btn btn-primary" type="button" onclick="viewBookedResources('${task.taskId}')">View</button>
						</td>
		</tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Machinery Section -->
    <h5>Machinery List</h5>
    <table id="machineryTable" class="table table-bordered">
        <thead>
            <tr>
                <th>Machine Name</th>
                <th>No. of Hours</th>
            </tr>
        </thead>
        <tbody>
         <c:forEach var="machine" items="${projectInfo.machinery}" varStatus="loop" > 
         <tr>
         <td>${machine.machineName }</td>
         <td>${machine.noOfHours }</td>
         </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Modal for Resource Booking -->
    <div id="resourceBookingModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title">Booking Resource For Task <span id="modalTaskName"></span> </h5>
                  <input type="hidden" id="modalTaskId" >
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
                <div class="modal-body">
                    <!-- Resource Booking Form -->
                    <table id="resourceTable" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Select</th>
                                <th>Resource ID</th>
                                <th>Resource Name</th>
                                <th>Department</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Slot</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Resource rows will be inserted here via AJAX -->
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="bookSelectedResources()">Book</button>
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal for viewing booked resources -->
<div class="modal fade" id="viewBookedResourcesModal" tabindex="-1" role="dialog" aria-labelledby="viewBookedResourcesModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:150%;">
            <div class="modal-header">
                <h5 class="modal-title" id="viewBookedResourcesModalLabel">Booked Resources for Task</h5>
                
 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table" id="bookedResourceTable">
                    <thead>
                        <tr>
                            <th>Resource ID</th>
                            <th>Resource Name</th>
                            <th>Department</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Slot</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Booked resources will be dynamically populated here -->
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

</div>

<!-- Include Bootstrap JS for modal functionality -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
