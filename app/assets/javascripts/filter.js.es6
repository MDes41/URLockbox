$(document).ready(function(){
  $('#filter').on('keyup', filter.bind(this, this))
})

function filter() {
  var $searchTerm  = $("#filter").val().toUpperCase();
  var tableContents = $('#links-list').children();
  for(var i = 0; i < tableContents.length; i++) {
    var tableName = tableContents[i].children[1].innerHTML.toUpperCase();
    if (tableName.indexOf($searchTerm) == -1) {
      tableContents[i].style.display = 'none';
    } else {
      tableContents[i].style.display = '';
    }
  }
}



