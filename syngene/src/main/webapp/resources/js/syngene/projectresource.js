function initializeDatePicker() {
        $('.datetimepickerformat').datepicker({
            dateFormat: 'yy-mm-dd', // Set the date format
            changeMonth: true,      // Allow changing month via dropdown
            changeYear: true,       // Allow changing year via dropdown
            yearRange: "-100:+0",   // Set the year range from 100 years ago to the current year
            maxDate: 0              // Prevent selecting future dates
        });
    }
	
	function searchResources() {
		    var division = $('#division').val();
		    var operatingUnit = $('#operatingUnit').val();
		    var department = $('#department').val();
		    var startDate = $('#startDate').val();
		    var endDate = $('#endDate').val();

		    $.ajax({
		        url: '/syngene/project/resourcesearch',
		        type: 'POST',
		        data: {
		            division: division,
		            operatingUnit: operatingUnit,
		            department: department,
		            startDate: startDate,
		            endDate: endDate
		        },
		        success: function(response) {
		            var tableBody = $('#resourceTable tbody');
		            tableBody.empty();
		            if (response.length > 0) {
		                $.each(response, function(index, resource) {
		                    var row = '<tr>' +
		                              '<td>' + resource.department + '</td>' +
		                              '<td>' + resource.skill + '</td>' +
		                              '<td>' + resource.noOfResources + '</td>' +
		                              '</tr>';
		                    tableBody.append(row);
		                });
		            } else {
		                tableBody.append('<tr><td colspan="3">No resources found</td></tr>');
		            }
		        },
		        error: function(xhr, status, error) {
		            console.error("Error fetching data:", error);
		        }
		    });
		} 

		function searchProject() {
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
											  '<td><a href="#" onclick="openTaskModal(\'' + project.projectCode + '\')">' + project.projectCode + '</a></td>' +
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
				
				function openTaskModal(projectCode) {
				    // Use projectCode to fetch project-specific details via AJAX
				    $.ajax({
				        url: '/syngene/project/getProjectDetails',  // Replace with actual API URL
				        type: 'POST',
				        data: { projectCode: projectCode },
				        success: function(response) {
				            // Assuming response contains project-specific data
				            $('#modalProjectCode').text(response.projectCode); // Update project code in the modal
							$('#modalProjectCodeId').val(response.projectCode);
				            $('#modalProjectName').text(response.projectName); // Update project name in the modal
				            $('#modalProjectManager').text(response.projectManager); // Update manager in the modal

				            // You can also populate task-related fields if needed
				           populateTasks(response.tasks);
						   populateMachine(response.machinery)
				            // Open the modal
				            $('#projectTaskModal').modal('show');
				        },
				        error: function(xhr, status, error) {
				            alert('Error fetching project details: ' + xhr.responseText);
				        }
				    });
				}

				function populateTasks(tasks) {
				    let taskTableBody = $('#taskTable tbody');
				    taskTableBody.empty();
				    if (tasks.length > 0) {
				        tasks.forEach(function(task) {
				            let row = `
				                <tr>
				                    <td><select class="form-control"><option>${task.taskName}</option></select></td>
				                    <td><select class="form-control"><option>${task.skill}</option></select></td>
				                    <td><input type="number" class="form-control" value="${task.noOfResources}" /></td>
				                    <td><input type="number" class="form-control" value="${task.noOfManDays}" /></td>
				                    <td><input type="text" class="form-control datetimepickerformat" value="${task.startDate}" onclick="initializeDatePicker()" /></td>
				                    <td><input type="text" class="form-control datetimepickerformat" value="${task.endDate}" onclick="initializeDatePicker()" /></td>
				                    <td style="width:50px;"><button class="btn btn-danger" onclick="removeRow(this)">-</button></td>
				                </tr>`;
				            taskTableBody.append(row);
				        });
				    } else {
				       // taskTableBody.append('<tr><td colspan="7">No tasks found</td></tr>');
				    }
				}

				// Functions to add new rows to Task and Machinery tables
				    function addTaskRow() {
				        $('#taskTable tbody').append(`
				            <tr>
				                <td><select class="form-control"><option>Task 1</option><option>Task 2</option></select></td>
				                <td><select class="form-control"><option>Skill 1</option><option>Skill 2</option></select></td>
				                <td><input type="number" class="form-control" /></td>
				                <td><input type="number" class="form-control" /></td>
				                <td><input type="text" class="form-control datetimepickerformat" onclick="initializeDatePicker()" /></td>
				                <td><input type="text" class="form-control datetimepickerformat" onclick="initializeDatePicker()"/></td>
				                <td style="width:50px;"><button class="btn btn-danger" onclick="removeRow(this)">-</button></td>
				            </tr>
				        `);
				        $('.datepicker').datepicker();
				    }
					function addMachineryRow() {
					        $('#machineryTable tbody').append(`
					            <tr>
					                <td><input type="text" class="form-control" /></td>
					                <td><input type="number" class="form-control" /></td>
					                <td style="width:50px;"><button class="btn btn-danger" onclick="removeRow(this)">-</button></td>
					            </tr>
					        `);
					    }

					    function removeRow(button) {
					        $(button).closest('tr').remove();
					    }
						function saveProjectTasks() {
						    // Collect task data
						    let tasks = [];
						    $('#taskTable tbody tr').each(function () {
						        let task = {
						            taskName: $(this).find('select:eq(0)').val(),
						            skill: $(this).find('select:eq(1)').val(),
						            noOfResources: $(this).find('input:eq(0)').val(),
						            noOfManDays: $(this).find('input:eq(1)').val(),
						            startDate: $(this).find('input:eq(2)').val(),
						            endDate: $(this).find('input:eq(3)').val()
						        };
						        tasks.push(task);
						    });

						    // Collect machinery data
						    let machinery = [];
						    $('#machineryTable tbody tr').each(function () {
						        let machine = {
						            machineName: $(this).find('input:eq(0)').val(),
						            noOfHours: $(this).find('input:eq(1)').val()
						        };
						        machinery.push(machine);
						    });

						    // Create data object to send
						    let data = {
								projectCode:$("#modalProjectCodeId").val(),
						        tasks: tasks,
						        machinery: machinery
						    };

						    // AJAX call to send data to the server
						    $.ajax({
						        url: '/syngene/project/saveProjectTasks',
						        type: 'POST',
						        contentType: 'application/json',
						        data: JSON.stringify(data),
						        success: function (response) {
						            alert('Project tasks saved successfully');
						            // Optional: You can reset the form or close the modal
						            $('#projectTaskModal').modal('hide');
						        },
						        error: function (xhr, status, error) {
						            alert('Error saving project tasks: ' + xhr.responseText);
						        }
						    });
						}
						
						function populateMachine(machinery) {
										    let machineryTableBody = $('#machineryTable tbody');
										    machineryTableBody.empty();
										    if (machinery.length > 0) {
										        machinery.forEach(function(machine) {
										            let row = `
										                <tr>
										                   
										                    <td><input type="text" class="form-control" value="${machine.machineName}" /></td>
										                    <td><input type="number" class="form-control" value="${machine.noOfHours}" /></td>
										                   
										                    <td style="width:50px;"><button class="btn btn-danger" onclick="removeRow(this)">-</button></td>
										                </tr>`;
										            machineryTableBody.append(row);
										        });
										    } else {
										       // taskTableBody.append('<tr><td colspan="7">No tasks found</td></tr>');
										    }
										}

			