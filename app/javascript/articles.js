$(document).ready(function() {
    $('#articles').DataTable({
      sPaginationType: "full_numbers",
      bJQueryUI: true,
      bProcessing: true,
      bServerSide: true,
      "lengthMenu": [[1, 3, 5, -1], [1, 3, 5, "All"]],
      sAjaxSource: $('#articles').data('source')  
      }
    );
});

/*
$.ajax({
    'url': "http://localhost:3000/articles.json",
    'method': "GET",
    'contentType': 'application/json'
}).done( function(data) {
    $('#articles').dataTable( {
        "aaData": data,
        "columns": [
            { "data": "title" },
            { "data": "description" }
        ]
    })
})
*/