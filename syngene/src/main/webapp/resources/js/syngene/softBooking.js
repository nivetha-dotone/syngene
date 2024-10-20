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
				
				
				function openResourceBookingModal(taskId) {
				    // Open the modal for booking resources for the selected task
				    $.ajax({
				        url: '/syngene/soft/getAvailableResources',
				        type: 'POST',
				        data: { taskId: taskId },
				        success: function(response) {
				            var resourceTableBody = $('#resourceTable tbody');
				            resourceTableBody.empty();
				            response.resources.forEach(function(resource) {
				                var row = `<tr>
				                    <td><input type="checkbox" class="resource-checkbox" data-resource-id="${resource.resourceId}"></td>
				                    <td>${resource.resourceId}</td>
				                    <td>${resource.resourceName}</td>
				                    <td>${resource.department}</td>
				                    <td><input type="text" class="form-control" placeholder="Start Date" /></td>
				                    <td><input type="text" class="form-control" placeholder="End Date" /></td>
				                    <td><input type="text" class="form-control" placeholder="Slot" /></td>
				                </tr>`;
				                resourceTableBody.append(row);
				            });

				            // Show the modal
				            $('#resourceBookingModal').modal('show');
				        },
				        error: function(xhr, status, error) {
				            console.error("Error fetching available resources:", error);
				        }
				    });
				}

				function bookSelectedResources() {
				    var selectedResources = [];
				    $('.resource-checkbox:checked').each(function() {
				        var resourceRow = $(this).closest('tr');
				        var resourceData = {
				            resourceId: $(this).data('resource-id'),
				            startDate: resourceRow.find('input:eq(1)').val(),
				            endDate: resourceRow.find('input:eq(2)').val(),
				            slot: resourceRow.find('input:eq(3)').val()
				        };
				        selectedResources.push(resourceData);
				    });

				    // Send selected resources data to the server for booking
				    $.ajax({
				        url: '/syngene/project/bookResources',
				        type: 'POST',
				        contentType: 'application/json',
				        data: JSON.stringify(selectedResources),
				        success: function(response) {
				            alert('Resources booked successfully!');
				            $('#resourceBookingModal').modal('hide');
				        },
				        error: function(xhr, status, error) {
				            console.error("Error booking resources:", error);
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

 
				