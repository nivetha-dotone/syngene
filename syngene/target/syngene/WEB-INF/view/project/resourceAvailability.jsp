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
                    <option value="Division1">Division1</option>
                    <option value="Division2">Division2</option>
                    <!-- Add more divisions as needed -->
                </select>
            </td>
<!-- 
            <td><label for="operatingUnit">Operating Unit</label></td> -->
            <td>
                <select class="form-control" id="operatingUnit">
                    <option value="">Select Operating Unit</option>
                    <option value="OU1">Operating Unit 1</option>
                    <option value="OU2">Operating Unit 2</option>
                    <!-- Add more units as needed -->
                </select>
            </td>
<!-- 
            <td><label for="department">Department</label></td> -->
            <td>
                <select class="form-control" id="department">
                    <option value="">Select Department</option>
                    <option value="Dept1">Department 1</option>
                    <option value="Dept2">Department 2</option>
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

</body>
</html>
