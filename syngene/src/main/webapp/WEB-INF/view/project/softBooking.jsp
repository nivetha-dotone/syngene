<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Soft Booking</title>
    
    <!-- Include jQuery and jQuery UI for date pickers -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <!-- Include Bootstrap for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

    
    <script src="resources/js/syngene/projectresource.js"></script>
       
    <script src="resources/js/syngene/softBooking.js"></script>
    
</head>
<body>

<div class="container mt-4">
    <!-- Filters Form as a Table -->
    <table class="table ">
        <tr>
            <td>
                <select class="form-control" id="division">
                    <option value="">Select Division</option>
                    <option value="Discovery Services">Discovery Services</option>
                       <option value="Development Services">Development Services</option>
                </select>
            </td>

            <td>
                <select class="form-control" id="operatingUnit">
                    <option value="">Select Operating Unit</option>
                    <option value="Discovery Biology">Discovery Biology</option>
                     <option value="Chemical Development">Chemical Development</option>
                </select>
            </td>

            <td>
                <select class="form-control" id="department">
                   <option value="">Select Department</option>
                    <option value="Assay Biology">Assay Biology</option>
                    <option value="DMPK">DMPK</option>
                    <option value="Large Molecules">Large Molecules</option>
                </select>
            </td>

            <!-- Project Text Input -->
            <td>
                <input type="text" class="form-control" id="project" placeholder="Enter Project Name or Code">
            </td>
            
            <td colspan="2" class="text-center">
                <!-- Search Button -->
                <button class="btn btn-primary" onclick="searchProjectOfSoftbooking()">Search</button>
            </td>
        </tr>
    </table>
   
    <!-- Table to display results -->
    <div class="mt-4">
        <h4>Search Results</h4>
        <table id="projectTable" class="table table-bordered">
            <thead>
                <tr>
                    <th>Project Code</th>
                    <th>Project Name</th>
                    <th>Project Manager</th>
                    <th>Operating Unit</th>
                    <th>Department</th>
                    <th  style="width:100px;">Start Date</th>
                    <th  style="width:100px;">End Date</th>
                </tr>
            </thead>
            <tbody>
                <!-- Results will be inserted here via AJAX -->
            </tbody>
        </table>
    </div>
</div>


<!-- Include Bootstrap JS for modal functionality -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    
   

</body>
</html>
