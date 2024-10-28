<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resource Availability</title>
    
    <!-- Include Bootstrap for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Include jQuery and jQuery UI for date pickers -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
     <script src="resources/js/syngene/projectresource.js"></script>
    
</head>
<body>

<div class="container mt-4">
    <!-- Filters Form as a Table -->
    <table class="table "><!-- table-bordered -->
        <tr>
<!--             <td><label for="division">Division</label></td>
 -->            <td>
                <select class="form-control" id="division">
                    <option value="">Select Division</option>
                    <option value="Discovery Services">Discovery Services</option>
                    <option value="Development Services">Development Services</option>
                    <!-- Add more divisions as needed -->
                </select>
            </td>
<!-- 
            <td><label for="operatingUnit">Operating Unit</label></td> -->
            <td>
                <select class="form-control" id="operatingUnit">
                    <option value="">Select Operating Unit</option>
                    <option value="Discovery Biology">Discovery Biology</option>
                    <option value="Chemical Development">Chemical Development</option>
                    <!-- Add more units as needed -->
                </select>
            </td>
<!-- 
            <td><label for="department">Department</label></td> -->
            <td>
                <select class="form-control" id="department">
                    <option value="">Select Department</option>
                    <option value="Assay Biology">Assay Biology</option>
                    <option value="DMPK">DMPK</option>
                    <option value="Large Molecules">Large Molecules</option>
                    <!-- Add more departments as needed -->
                </select>
            </td>
<!-- 
            <td><label for="startDate">Start Date</label></td> -->
            <td>
                <input type="text" class="datetimepickerformat form-control" id="startDate"  onclick="initializeDatePicker()" placeholder=
               "Start Date">
            </td>
<!-- 
            <td><label for="endDate">End Date</label></td> -->
            <td>
                <input type="text" class="datetimepickerformat form-control" id="endDate"  onclick="initializeDatePicker()" placeholder="End Date">
            </td>
            <td colspan="2" class="text-center">
                <!-- Search Button -->
                <button class="btn btn-primary" onclick="searchResources()">Search</button>
            </td>
        </tr>
    </table>
   

    <!-- Table to display results -->
    <div class="mt-4">
        <h4>Search Results</h4>
        <table id="resourceTable" class="table table-bordered">
            <thead>
                <tr>
                    <th>Department</th>
                    <th>Skill</th>
                    <th>No of Resources</th>
                </tr>
            </thead>
            <tbody>
                <!-- Results will be inserted here via AJAX -->
            </tbody>
        </table>
    </div>
</div>
    <!-- Modal for viewing booked resources -->
<div class="modal fade" id="viewBookedResourcesModal" tabindex="-1" role="dialog" aria-labelledby="viewBookedResourcesModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:150%;">
            <div class="modal-header">
                <h5 class="modal-title" id="viewBookedResourcesModalLabel">Resource Details</h5>
                
 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table" id="bookedResourceTable">
                    <thead>
                        <tr>
                            <th>Resource ID</th>
                            <th>Resource Name</th>
                            <th>Department</th>
                            <th>Skill</th>
                            
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
</body>
</html>
