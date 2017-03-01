$(document).ready(function(){
  $('#filter').on('keyup', filter.bind(this, this))
  $("#only-unread-links").off('click');
  $("#only-read-links").off('click');
  $("#only-unread-links").on('click', unreadLinks);
  $("#only-read-links").on('click', readLinks);
})

function filter() {
  var $searchTerm  = $("#filter").val().toUpperCase();
  var $tableContents = $('#links-list').children();
  for(var i = 0; i < $tableContents.length; i++) {
    var tableName = $($tableContents[i]).children('.inside-link').children()[1].innerHTML.toUpperCase();
    if (tableName.indexOf($searchTerm) == -1) {
      $tableContents[i].style.display = 'none';
    } else {
      $tableContents[i].style.display = '';
    }
  }
}

function unreadLinks() {
  var $searchTerm  = 'FALSE';
  var $tableContents = $('#links-list').children();
  for(var i = 0; i < $tableContents.length; i++) {
    var tableName = $($tableContents[i]).children('.inside-link').children()[2].innerHTML.toUpperCase();
    if (tableName.indexOf($searchTerm) == -1) {
      $tableContents[i].style.display = 'none';
    } else {
      $tableContents[i].style.display = '';
    }
  }
}

function readLinks() {
  var $searchTerm  = 'TRUE';
  var $tableContents = $('#links-list').children();
  for(var i = 0; i < $tableContents.length; i++) {
    var tableName = $($tableContents[i]).children('.inside-link').children()[2].innerHTML.toUpperCase();
    if (tableName.indexOf($searchTerm) == -1) {
      $tableContents[i].style.display = 'none';
    } else {
      $tableContents[i].style.display = '';
    }
  }
}





