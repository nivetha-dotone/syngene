var ctx = document.getElementById('salesChart').getContext('2d');
   var salesChart = new Chart(ctx, {
       type: 'line',
       data: {
           labels: ['January', 'February', 'March', 'April', 'May', 'June'],
           datasets: [{
               label: 'Sales',
               data: [12000, 19000, 3000, 5000, 20000, 30000],
               backgroundColor: 'rgba(54, 162, 235, 0.2)',
               borderColor: 'rgba(54, 162, 235, 1)',
               borderWidth: 1,
               fill: true
           }]
       },
       options: {
           scales: {
               y: {
                   beginAtZero: true
               }
           }
       }
   });