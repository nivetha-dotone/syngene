<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
     <!-- Include Bootstrap for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Include jQuery and jQuery UI for date pickers -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        .dashboard-row {
            display: flex;
             justify-content: space-between;
            margin-bottom: 20px;
        }
        .dashboard-image {
            width: 28%; /* Adjust size as necessary */
        }
    </style>
</head>
<body>
    
    <div class="dashboard-row">
        <img src="resources/img/billable.jpg" alt="Billable vs Non-Billable" class="dashboard-image"/>
        <img src="resources/img/totalhourutilization.jpg" alt="Total Hours Utilization" class="dashboard-image"/>
        <img src="resources/img/productivityanalysis.jpg" alt="Productivity Analysis" class="dashboard-image"/>
    </div>
    
    <div class="dashboard-row">
        <img src="resources/img/employeeefficiency.png" alt="Employee Efficiency" class="dashboard-image"/>
         <img src="resources/img/taskefficiency.jpg" alt="Employee Efficiency" class="dashboard-image"/>
        <img src="resources/img/productivehours.png" alt="Productive Hours" class="dashboard-image"/>
    </div>

</body>
</html>
