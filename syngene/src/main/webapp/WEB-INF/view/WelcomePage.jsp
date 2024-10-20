<%@ page import="com.dot1.pojo.MasterUser" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--   <link rel="stylesheet" type="text/css" href="resources/css/cmsstyles.css">  -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
     <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <script src="resources/js/syngene/projectresource.js"></script>
       <script src="resources/js/syngene/softBooking.js"></script>
    <script>
    var contextPath = '<%= request.getContextPath() %>';
   

function loadCommonList(path,heading) {
	 updateHeading(heading);
	    var url = contextPath + path;
    // Construct the URL using the contextPath variable
  //  var url = contextPath + path;
    console.log("Constructed URL:", url); // Log the constructed URL to the console
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("mainContent").innerHTML = this.responseText;
              resetSessionTimer();
        }
    };
    xhttp.open("GET", url, true);
    xhttp.send();
}

function checkSessionStatus() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var response = JSON.parse(this.responseText);
            if (!response.sessionActive) {
                // Session has expired, redirect to login page
                window.location.href = "/syngene";
            }
        }
    };
    xhr.open("GET", "/checkSessionStatus", true);
    xhr.send();
}



</script>
    <style>
     /* General Styles */
   body {
    margin: 0;
    padding: 0;
    font-family: 'Titillium Web', sans-serif;
}

/* Top Navigation Bar Styles */
.top-nav {
    background-color: rgb(0, 81, 81);
    color: white;
    height: 50px;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 10px;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1001;
    box-sizing: border-box;
    font-family: 'Volte Rounded', 'Noto Sans', sans-serif;
    font-size: 1.25rem;
    font-weight: 600;
    line-height: 1.5rem;
}

.top-nav .logo {
    height: 40px;
    width: auto;
    margin: 0 5px;
}

.top-nav .logo.dot1 {
    height: 30px;
}

.top-nav .heading {
    color: white;
    font-size: 1rem;
    font-weight: bold;
    text-align: center;
    flex-grow: 1;
}

.top-nav .dropdown span {
    color: white;
    font-size: 1rem;
    font-weight: bold;
}

.top-nav .dropdown-content {
    display: none;
    position: absolute;
    background-color: rgb(0, 81, 81);
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    right: 0;
}

.top-nav .dropdown-content a {
    color: white;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    font-family: 'Noto Sans', sans-serif;
    font-size: .875rem;
    font-weight: 500;
    line-height: 2.5rem;
}

.top-nav .dropdown-content a:hover {
    background-color: #004d40;
}

.top-nav .dropdown:hover .dropdown-content {
    display: block;
}

/* Side Navigation Bar Styles */
.main-menu {
    background: rgb(0, 81, 81);
    position: fixed;
    top: 50px;
    bottom: 0;
    height: calc(100% - 50px);
    left: 0;
    width: 60px;
    overflow: hidden;
    transition: width 0.3s ease;
    z-index: 1000;
    color: white;
}

.main-menu.expanded {
    width: 250px;
}

.main-menu > ul {
    margin: 7px 0;
    padding: 0;
    list-style: none;
}

.main-menu li {
    position: relative;
    width: 100%;
}

.main-menu li > a {
    display: flex;
    align-items: center;
    color: white;
    font-size: 14px;
    text-decoration: none;
    padding: 10px 15px;
    transition: background-color 0.1s linear;
}

.main-menu .nav-icon {
    font-size: 20px;
    color: white;
    margin-right: 15px;
}

.main-menu .nav-text {
    flex-grow: 1;
    overflow: hidden;
    white-space: nowrap;
}

.main-menu .sub-menu {
    display: none;
    padding: 0;
    margin: 0;
    background: #00796b;
    list-style: none;
}

.main-menu .sub-menu li a {
    padding: 10px 30px;
    font-size: 13px;
    color: white;
    text-decoration: none;
    margin: 0;
    display: block;
    box-sizing: border-box;
}

.main-menu .sub-menu li a:hover {
    background: #004d40;
}

.main-menu li.active > a,
.main-menu li:hover > a {
    background-color: #009688;
}

.main-menu li.active .sub-menu {
    display: block;
}

/* Content Area */
.form-content {
    float: left;
    background: #ffffff;
    height: calc(100% - 50px);
    margin-top: 50px;
    margin-left: 60px;
    width: calc(100% - 60px);
    transition: margin-left 0.3s ease, width 0.3s ease;
    box-sizing: border-box;
}

.main-menu.expanded + .form-content {
    margin-left: 250px;
    width: calc(100% - 250px);
}

.main-menu:not(.expanded) + .form-content {
    margin-left: 60px;
    width: calc(100% - 60px);
}

/* Table Header Size Adjustment */
table th {
    font-size: 0.875rem;
    padding: 8px;
}

/* Navigation Pills Styles */
.navmenu .nav-pills a, .navmenu .nav-pills .expander {
    font-family: 'Noto Sans Display', 'Noto Sans', sans-serif;
    font-size: .875rem;
    font-weight: 500;
    line-height: 1.125rem;
    letter-spacing: normal;
    border-radius: 0 999px 999px 0;
    margin: 0;
    min-height: 2.75rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
}

.navmenu a, .navmenu .expander {
    padding: .5rem .5rem .5rem 1.5rem;
    min-height: 2.75rem;
    text-overflow: ellipsis;
    overflow: hidden;
    word-wrap: break-word;
    color: var(--zed_sys_color_mainMenuAction_enabled);
}

.menu-links-container div {
    width: 100%;
}

*, :after, :before {
    box-sizing: border-box;
}

.navmenu .nav-pills {
    flex: 1;
    padding-right: 1rem;
}

.nav {
    display: flex;
    flex-wrap: wrap;
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
}

.navmenu {
    position: absolute;
    left: -19.5rem;
    transform: translate(0);
    z-index: 1033;
    transition: all 0.3s ease;
}

.navmenu.show {
    left: 0;
}

/* Responsive Styles */
@media (max-width: 768px) {
    .top-nav, .main-menu {
        display: block;
    }

    .top-nav {
        position: relative;
        height: auto;
    }

    .main-menu {
        width: 100%;
        height: auto;
        position: static;
        display: block;
    }

    .main-menu.expanded {
        width: 100%;
    }

    .main-menu .nav-icon {
        font-size: 18px;
        margin-right: 10px;
    }
}

.active {
    background-color: #004d40;
    color: white;
}
.user-info {
    display: flex;
    align-items: center;
}

.user-logo {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background-color: #005151; /* Default background color for initials */
    margin-right: 10px;
}

.user-logo-img {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    display: none; /* Hide by default */
}

.user-initials {
    color: #fff;
    font-weight: bold;
    font-size: 16px;
    display: none; /* Hide by default */
}

.user-name {
    font-size: 16px;
    color: #005151;
    font-family: Volte Rounded, Noto Sans, sans-serif;
}

/* Show user logo if available, hide initials */
.user-logo img[src*="user.logo"] {
    display: block;
}

.user-logo img[src=""] + .user-initials {
    display: block; /* Show initials if logo is not available */
}
.dropdown {
    position: relative;
    display: inline-block;
    cursor: pointer;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {
    background-color: #f1f1f1;
}
.user-initials {
    width: 40px;
    height: 40px;
    background-color: #005151;
    color: white;
    text-align: center;
    line-height: 40px;
    border-radius: 50%;
    font-weight: bold;
    font-size: 20px;
}
.initials-icon {
            display: inline-block;
            width: 40px; /* Adjust size as needed */
            height: 40px; /* Adjust size as needed */
            border-radius: 50%;
            background-color: #3498db; /* Background color of the circle */
            color: white; /* Text color */
            text-align: center;
            line-height: 40px; /* Center text vertically */
            font-size: 18px; /* Font size of initials */
            font-weight: bold; /* Make initials bold */
            margin-right: 10px; /* Space between icon and text */
        }
        /* Side Navigation Bar Styles */
.main-menu {
    background: rgb(0, 81, 81);
    position: fixed;
    top: 50px;
    bottom: 0;
    height: calc(100% - 50px);
    left: 0;
    width: 60px;
    overflow-y: auto; /* Enable vertical scrolling */
    overflow-x: hidden; /* Hide horizontal scroll if not needed */
    transition: width 0.3s ease;
    z-index: 1000;
    color: white;
}

.main-menu.expanded {
    width: 250px;
}

/* Optional: Add a scrollbar style for webkit browsers */
.main-menu::-webkit-scrollbar {
    width: 8px;
}

.main-menu::-webkit-scrollbar-thumb {
    background: rgba(0, 0, 0, 0.5);
    border-radius: 4px;
}

.main-menu::-webkit-scrollbar-thumb:hover {
    background: rgba(0, 0, 0, 0.7);
}
.arrow-up, .arrow-down {
    width: 10px;
    height: 8px;
    filter: invert(100%); /* Turns black arrows white */
}
.home-icon {
    padding: 10px;
    cursor: pointer;
}

.home-icon i {
    font-size: 24px; /* Adjust size as needed */
    color: #ffffff; /* Change color as needed */
}
    </style>
</head>
<body>
<% 
    String initials = (String) session.getAttribute("userInitials");
    MasterUser user = (MasterUser) session.getAttribute("loginuser");
    
%>

    <!-- Top Navigation Bar -->
    <div class="top-nav">
    
       <!--  <img src="resources/img/syngenelogo.jpg" alt="Company Logo" class="logo"> -->
        <div class="heading">Syngene</div>
         <div class="dropdown">
             <span class="initials-icon"><c:out value="${sessionScope.userInitials}" /></span> <span><c:out value="${sessionScope.loginuser.firstName}" /><c:out value="${sessionScope.loginuser.lastName}" /></span>
            <div class="dropdown-content">
                <a href="#" onclick="loadChangePassword()">Change Password</a>
                <a href="#" onclick="loadLogout()">Logout</a>
            </div>
        </div>
        <img src="resources/img/Dot1.png" alt="Dot1 Logo" class="logo dot1">
    </div>

    <!-- Side Navigation Bar -->
    <nav class="main-menu">
        <ul>
 
             <li>
            <a href="#" onclick="loadCommonList('/project/home', 'Home')">
                 <i class="fa fa-home nav-icon"></i>
                <span class="nav-text">Home</span>
            </a>
        </li>
        
        <li>
            <a href="#" onclick="loadCommonList('/project/resource', 'Resource Availability')">
                  <i class="fa fa-users nav-icon"></i> 
                <span class="nav-text">Resource Availability</span>
            </a>
        </li>
        
         <li>
            <a href="#" onclick="loadCommonList('/project/costEstimations', 'Project Cost Estimations')">
              <i class="fa fa-calculator nav-icon"></i>  
                <span class="nav-text">Project Cost Estimations</span>
            </a>
        </li>
         <li>
            <a href="#" onclick="loadCommonList('/project/taskCreation', 'Project Task Creation')">
                 <i class="fa fa-tasks nav-icon"></i>  
                <span class="nav-text">Project Task Creation</span>
            </a>
        </li>
         <li>
            <a href="#" onclick="loadCommonList('/project/softBooking', 'Project Soft Booking')">
                 <i class="fa fa-book nav-icon"></i>
                <span class="nav-text">Project Soft Booking</span>
            </a>
        </li>
         <li>
            <a href="#" onclick="loadCommonList('/project/resourceCosting', 'Project Resource Costing')">
                <i class="fa fa-money nav-icon"></i>
                <span class="nav-text">Project Resource Costing</span>
            </a>
        </li>
        </ul>
    </nav>
    

    <!-- Main Content Area -->
    <div id="mainContent" class="form-content"></div>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script>
  

    function toggleSubMenu(menuId) {
        const submenu = document.getElementById(menuId);
        const arrowUpIcon = submenu.previousElementSibling.querySelector('.arrow-up');
        const arrowDownIcon = submenu.previousElementSibling.querySelector('.arrow-down');

        if (submenu.style.display === 'block') {
            submenu.style.display = 'none';
            arrowUpIcon.style.display = 'none';
            arrowDownIcon.style.display = 'inline-block';
        } else {
            submenu.style.display = 'block';
            arrowUpIcon.style.display = 'inline-block';
            arrowDownIcon.style.display = 'none';
        }
    }

    document.addEventListener('DOMContentLoaded', () => {
        let submenuVisible = false;
        let submenuSelected = false;

        function toggleSubMenu() {
            const submenu = document.querySelector('#clms-sub-menu');
            const arrowUpIcon = document.querySelector('.arrow-up');
            const arrowDownIcon = document.querySelector('.arrow-down');

            submenuVisible = !submenuVisible;
            submenu.style.display = submenuVisible ? 'block' : 'none';
            arrowUpIcon.style.display = submenuVisible ? 'inline-block' : 'none';
            arrowDownIcon.style.display = submenuVisible ? 'none' : 'inline-block';
        }

        const clmsMenuLink = document.querySelector('.mainmenu-link');
        if (clmsMenuLink) {
            clmsMenuLink.addEventListener('click', (event) => {
                event.preventDefault(); // Prevent default link behavior
                toggleSubMenu();
            });
        }

        // Ensure submenu closes when the sidebar is hovered out
        const mainMenu = document.querySelector('.main-menu');
        mainMenu.addEventListener('mouseenter', function() {
            this.classList.add('expanded');
        });

        mainMenu.addEventListener('mouseleave', function() {
            if (!submenuSelected) {
                this.classList.remove('expanded');
            }
        });

        // Handle submenu selection
        document.querySelectorAll('#clms-sub-menu a').forEach(link => {
            link.addEventListener('click', function() {
                submenuSelected = true; // Mark submenu as selected
                highlightMenuItem(this.parentElement);
                loadContent(this.textContent);
                setTimeout(() => submenuSelected = false, 300); // Reset after a short delay
            });
        });

        function highlightMenuItem(menuItem) {
            const menuItems = document.querySelectorAll('#clms-sub-menu li');
            menuItems.forEach(item => item.classList.remove('active'));
            menuItem.classList.add('active');
        }

        function loadContent(text) {
            const headingText = text;
            updateHeading(headingText);
            document.getElementById("mainContent").innerHTML = `<h1>${text}</h1><p>Content for ${text} will go here.</p>`;
            resetSessionTimer();
        }

        function updateHeading(text) {
            const headingElement = document.querySelector('.top-nav .heading');
            headingElement.textContent = text;
        }

        function resetSessionTimer() {
            console.log('Session timer reset');
        }
    });


    function loadContent(link) {
        const headingText = link.textContent;
        updateHeading(headingText);
        const urlMatch = link.getAttribute('onclick').match(/'(.*?)'/);
        if (urlMatch) {
            const url = urlMatch[1]; // Extract URL from onclick
            console.log("Constructed URL:", url);
            const xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("mainContent").innerHTML = this.responseText;
                    resetSessionTimer();
                }
            };
            xhttp.open("GET", url, true);
            xhttp.send();
        } else {
            console.error("Failed to extract URL from onclick attribute");
        }
    }
   

    function updateHeading(text) {
        const headingElement = document.querySelector('.top-nav .heading');
        headingElement.textContent = text;
    }

   
    function resetSidebar() {
        // Hide all sub-menus
        const subMenus = document.querySelectorAll('.sub-menu');
        subMenus.forEach(menu => {
            menu.style.display = 'none';
        });

        // Reset all menu item selections (optional, depends on how selections are handled)
        const menuItems = document.querySelectorAll('.main-menu-item');
        menuItems.forEach(item => {
            item.classList.remove('selected'); // Adjust according to your CSS class for selected items
        });

        // Show the default menu or reset to initial state
        // You might want to set a specific state here, or just leave it empty
    }
    
   
    function loadPrincipalEmployerList() {
        updateHeading('Principal Employer');
        var url = contextPath + '/principalEmployer/list';
        console.log("Constructed URL:", url);

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4) {
                if (this.status == 200) {
                    document.getElementById("mainContent").innerHTML = this.responseText;
                    resetSessionTimer();
                } else {
                    console.error("Failed to load content:", this.status, this.statusText);
                }
            }
        };
        xhttp.open("GET", url, true);
        xhttp.send();
    }
    function loadWorkmenQOB() {
        updateHeading('Quick On-boarding');
        var url = contextPath + '/contractworkmen/quickOnbordingList';
        console.log("Constructed URL:", url);

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4) {
                if (this.status == 200) {
                    document.getElementById("mainContent").innerHTML = this.responseText;
                    resetSessionTimer();
                } else {
                    console.error("Failed to load content:", this.status, this.statusText);
                }
            }
        };
        xhttp.open("GET", url, true);
        xhttp.send();
    }

    function loadContractorList() {
        updateHeading('Contractor');
        var url = contextPath + '/contractor/list';
        console.log("Constructed URL:", url);

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("mainContent").innerHTML = this.responseText;
                resetSessionTimer();
            }
        };
        xhttp.open("GET", url, true);
        xhttp.send();
    }

    function loadChangePassword() {
        console.log("Change Password clicked");
        // Add logic to load change password view
    }

    function loadLogout() {
        console.log("Logout clicked");
        // Add logic to handle logout
    }

    function resetSessionTimer() {
        // Placeholder for session timer reset logic
    }
    

    </script>
</body>

</html>
