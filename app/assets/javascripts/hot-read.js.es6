// $(document).ready(function(){
//   getHotReads();
// })

// function getHotReads (){

//   console.log("delete")

//   $.ajax({
//       url: 'http://localhost:2999/api/v1/reads',
//       method: 'GET',
//     })
//    .then(hotReads)
//    .fail(displayFailure )
//  }



// function hotReads(link) {
//   debugger
//   var $searchTerm  = 'FALSE';
//   var tableContents = $('#links-list').children();
//   for(var i = 0; i < tableContents.length; i++) {
//     var tableName = tableContents[i].children[2].innerHTML.toUpperCase();
//     if (tableName.indexOf($searchTerm) == -1) {
//       tableContents[i].style.display = 'none';
//     } else {
//       tableContents[i].style.display = '';
//     }
//   }
// }


