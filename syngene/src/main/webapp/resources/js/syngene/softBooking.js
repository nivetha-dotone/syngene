function searchProjectOfSoftbooking() {
				    var division = $('#division').val();
				    var operatingUnit = $('#operatingUnit').val();
				    var department = $('#department').val();
				    var project = $('#project').val();

				    $.ajax({
				        url: '/syngene/project/projectsearch',
				        type: 'POST',
				        data: {
				            division: division,
				            operatingUnit: operatingUnit,
				            department: department,
				            project: project
				        },
				        success: function(response) {
				            var tableBody = $('#projectTable tbody');
				            tableBody.empty();
				            if (response.length > 0) {
								console.log(response.length);
								console.log(response);
				                $.each(response, function(index, project) {
				                    var row = '<tr>' +
											 '<td><a href="#" onclick="redirectToProjectDetailsView('+ project.projectCode+')">' + project.projectCode + '</a></td>' +
				                              '<td>' + project.projectName + '</td>' +
				                              '<td>' + project.projectManager + '</td>' +
											  '<td>' + project.operatingUnit + '</td>' +
											  '<td>' + project.department + '</td>' +
											  '<td>' + project.startDate + '</td>' +
											  '<td>' + project.endDate + '</td>' +
											  
				                              '</tr>';
				                    tableBody.append(row);
				                });
				            } else {
				                tableBody.append('<tr><td colspan="3">No projects found</td></tr>');
				            }
				        },
				        error: function(xhr, status, error) {
				            console.error("Error fetching data:", error);
				        }
				    });
				}
				
				
				function openResourceBookingModal(department, taskId, taskName) {
				    // Open the modal for booking resources for the selected task
				    $.ajax({
				        url: '/syngene/soft/getAvailableResources',
				        type: 'POST',
				        data: { department: department },
				        success: function(resourceList) {
				            // Clear the resource table and update the task details in the modal
				            var resourceTableBody = $('#resourceTable tbody');
				            resourceTableBody.empty();
				            $('#modalTaskName').text(taskName);
				            $("#modalTaskId").val(taskId);

				            if (resourceList && resourceList.length > 0) {
				                // Loop through the resourceList to create table rows
				                resourceList.forEach(function(resource) {
				                    var row = `<tr>
				                        <td><input type="checkbox" class="resource-checkbox" data-resource-id="${resource.resourceId}"></td>
				                        <td>${resource.resourceId}</td>
				                        <td>${resource.resourceName}</td>
				                        <td>${resource.department}</td>
				                        <td><input type="text" class="form-control datetimepickerformat" placeholder="Start Date" onclick="initializeDatePicker()"/></td>
				                        <td><input type="text" class="form-control datetimepickerformat" placeholder="End Date" onclick="initializeDatePicker()"/></td>
				                        <td><input type="text" class="form-control" placeholder="Slot" /></td>
				                    </tr>`;
				                    resourceTableBody.append(row);
				                });

				                // Show the modal
				                $('#resourceBookingModal').modal('show');
				            } else {
				                alert('No available resources found for the selected department.');
				            }
				        },
				        error: function(xhr, status, error) {
				            if (xhr.status === 404) {
				                alert("No available resources found for the selected department.");
				            } else {
				                console.error("Error fetching available resources:", error);
				            }
				        }
				    });
				}

				function redirectToProjectDetailsView(projectCode) {
				    

				    var xhr = new XMLHttpRequest();
				    xhr.onreadystatechange = function() {
				        if (xhr.readyState == 4 && xhr.status == 200) {
				            document.getElementById("mainContent").innerHTML = xhr.responseText;
				        }
				    };
				    xhr.open("GET", "/syngene/soft/projectDetailsView/" + projectCode, true);
				    xhr.send();
				}
				
				
				function bookSelectedResources() {
				    var resourceBookings = [];
				    $('.resource-checkbox:checked').each(function() {
				        var resourceRow = $(this).closest('tr');
				        var resourceBooking = {
				            resourceId: $(this).data('resource-id'),
							resourceName: resourceRow.find('td:eq(2)').text(),               
							department: resourceRow.find('td:eq(3)').text(), 
				            startDate: resourceRow.find('input:eq(1)').val(),
				            endDate: resourceRow.find('input:eq(2)').val(),
				            slot: resourceRow.find('input:eq(3)').val()
				        };
				        resourceBookings.push(resourceBooking);
				    });

				    // Create Resource object containing list of ResourceBooking
				    var resource = {
				        resourceBooking: resourceBookings,
						projectId:$("#projectId").val(),
						taskId :$("#modalTaskId").val()
				    };

					console.log(resource);
				    // Send the Resource object data to the server for booking
				    $.ajax({
				        url: '/syngene/soft/bookResources',
				        type: 'POST',
				        contentType: 'application/json',
				        data: JSON.stringify(resource),
				        success: function(response) {
				            alert('Resources booked successfully!');
				            $('#resourceBookingModal').modal('hide');
				        },
				        error: function(xhr, status, error) {
				            console.error("Error booking resources:", error);
				        }
				    });
				}
				
				function viewBookedResources(taskId) {
				    $.ajax({
				        url: '/syngene/soft/getBookedResources',
				        type: 'POST',
				        data: { taskId: taskId },
				        success: function(bookedResources) {
				            var bookedResourceTableBody = $('#bookedResourceTable tbody');
				            bookedResourceTableBody.empty();

				            if (bookedResources && bookedResources.length > 0) {
				                // Populate the table with booked resources
				                bookedResources.forEach(function(resource) {
				                    var row = `<tr>
				                        <td>${resource.resourceId}</td>
				                        <td>${resource.resourceName}</td>
				                        <td>${resource.department}</td>
				                        <td>${resource.startDate}</td>
				                        <td>${resource.endDate}</td>
				                        <td>${resource.slot}</td>
				                    </tr>`;
				                    bookedResourceTableBody.append(row);
				                });

				                // Show the modal
				                $('#viewBookedResourcesModal').modal('show');
				            } else {
				                alert('No resources have been booked for this task.');
				            }
				        },
				        error: function(xhr, status, error) {
				            console.error("Error fetching booked resources:", error);
				        }
				    });
				}

