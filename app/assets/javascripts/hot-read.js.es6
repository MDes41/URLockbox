$(document).ready(function(){
  hotLink();
  topLink();
})

function topLink() {
  var $searchTerm  = 'TOP'
  var $tableContents = $('#links-list').children();
  for(var i = 0; i < $tableContents.length; i++) {
    var rank = $($tableContents[i]).children()[0].innerHTML.toUpperCase()
    if (rank.indexOf($searchTerm) != -1) {
      $($tableContents[i]).addClass('hottest');
    } 
  }
}

function hotLink() {
  var $searchTerm  = 'HOT'
  var $tableContents = $('#links-list').children();
  for(var i = 0; i < $tableContents.length; i++) {
    var rank = $($tableContents[i]).children()[0].innerHTML.toUpperCase()
    if (rank.indexOf($searchTerm) != -1) {
      $($tableContents[i]).addClass('hot');
    } 
  }
}

